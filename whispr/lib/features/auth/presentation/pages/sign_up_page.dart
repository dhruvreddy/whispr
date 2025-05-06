import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whispr"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Name"),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Email"),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Password"),
              ),
              SizedBox(
                height: 12,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextButton(
                style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(0),
                  splashFactory: NoSplash.splashFactory,
                ),
                onPressed: () {},
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
