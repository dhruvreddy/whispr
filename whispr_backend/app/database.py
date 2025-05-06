import pymysql

def get_db():
    connection = pymysql.connect(
        host="localhost",
        user="root",
        password="Pranitha",  # Replace with your MySQL password
        database="whispr",
        charset="utf8mb4",
        cursorclass=pymysql.cursors.DictCursor
    )
    try:
        yield connection
    finally:
        connection.close()