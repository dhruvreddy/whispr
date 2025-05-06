from fastapi import FastAPI, HTTPException, Depends
from pydantic import BaseModel
from typing import Optional, List
import pymysql
from passlib.context import CryptContext
from .database import get_db

app = FastAPI(title="Whispr API")

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

# Pydantic models for request/response
class UserCreate(BaseModel):
    name: str
    email: str
    password: str

class UserResponse(BaseModel):
    user_id: int
    name: str
    email: str

class NoteCreate(BaseModel):
    title: str
    description: Optional[str] = None
    suggestion: Optional[str] = None
    tips: Optional[str] = None

class NoteResponse(BaseModel):
    notes_id: int
    title: str
    description: Optional[str]
    suggestion: Optional[str]
    tips: Optional[str]
    user_id: int

# Helper function to verify password
def verify_password(plain_password: str, hashed_password: str) -> bool:
    return pwd_context.verify(plain_password, hashed_password)

# Sign-up endpoint
@app.post("/signup", response_model=UserResponse)
def signup(user: UserCreate, db: pymysql.Connection = Depends(get_db)):
    with db.cursor() as cursor:
        # Check if email exists
        cursor.execute("SELECT * FROM user WHERE email = %s", (user.email,))
        if cursor.fetchone():
            raise HTTPException(status_code=400, detail="Email already registered")
        
        # Hash password and insert user
        hashed_password = pwd_context.hash(user.password)
        cursor.execute(
            "INSERT INTO user (name, email, pass) VALUES (%s, %s, %s)",
            (user.name, user.email, hashed_password)
        )
        db.commit()
        cursor.execute("SELECT user_id, name, email FROM user WHERE email = %s", (user.email,))
        return cursor.fetchone()

# Sign-in endpoint
@app.post("/signin", response_model=UserResponse)
def signin(user: UserCreate, db: pymysql.Connection = Depends(get_db)):
    with db.cursor() as cursor:
        cursor.execute("SELECT * FROM user WHERE email = %s", (user.email,))
        db_user = cursor.fetchone()
        if not db_user or not verify_password(user.password, db_user["pass"]):
            raise HTTPException(status_code=401, detail="Invalid email or password")
        return {"user_id": db_user["user_id"], "name": db_user["name"], "email": db_user["email"]}

# Post note endpoint
@app.post("/notes", response_model=NoteResponse)
def create_note(
    note: NoteCreate,
    email: str,
    password: str,
    db: pymysql.Connection = Depends(get_db)
):
    with db.cursor() as cursor:
        # Verify user
        cursor.execute("SELECT * FROM user WHERE email = %s", (email,))
        db_user = cursor.fetchone()
        if not db_user or not verify_password(password, db_user["pass"]):
            raise HTTPException(status_code=401, detail="Invalid email or password")
        
        # Insert note
        cursor.execute(
            """
            INSERT INTO notes (title, description, suggestion, tips, user_id)
            VALUES (%s, %s, %s, %s, %s)
            """,
            (note.title, note.description, note.suggestion, note.tips, db_user["user_id"])
        )
        db.commit()
        cursor.execute(
            "SELECT * FROM notes WHERE notes_id = LAST_INSERT_ID()"
        )
        return cursor.fetchone()

# Get notes endpoint
@app.get("/notes", response_model=List[NoteResponse])
def get_notes(email: str, password: str, db: pymysql.Connection = Depends(get_db)):
    with db.cursor() as cursor:
        # Verify user
        cursor.execute("SELECT * FROM user WHERE email = %s", (email,))
        db_user = cursor.fetchone()
        if not db_user or not verify_password(password, db_user["pass"]):
            raise HTTPException(status_code=401, detail="Invalid email or password")
        
        # Get notes
        cursor.execute("SELECT * FROM notes WHERE user_id = %s", (db_user["user_id"],))
        return cursor.fetchall()

# Delete note endpoint
@app.delete("/notes/{note_id}")
def delete_note(
    note_id: int,
    email: str,
    password: str,
    db: pymysql.Connection = Depends(get_db)
):
    with db.cursor() as cursor:
        # Verify user
        cursor.execute("SELECT * FROM user WHERE email = %s", (email,))
        db_user = cursor.fetchone()
        if not db_user or not verify_password(password, db_user["pass"]):
            raise HTTPException(status_code=401, detail="Invalid email or password")
        
        # Check if note exists and belongs to user
        cursor.execute(
            "SELECT * FROM notes WHERE notes_id = %s AND user_id = %s",
            (note_id, db_user["user_id"])
        )
        if not cursor.fetchone():
            raise HTTPException(status_code=404, detail="Note not found")
        
        # Delete note
        cursor.execute("DELETE FROM notes WHERE notes_id = %s", (note_id,))
        db.commit()
        return {"message": "Note deleted"}