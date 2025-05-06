import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignInPage> {
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
                  "Sign In",
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
                  "Sign Up",
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
