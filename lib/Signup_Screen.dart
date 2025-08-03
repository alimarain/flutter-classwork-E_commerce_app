import 'package:e_commerce_app/Signup_Success.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  signup()async{
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text,
    password: passController.text
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("Sign Up", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
Padding(
  padding: const EdgeInsets.only(top: 10,bottom: 10),
  child: Row(
    children: [
      Text(
        "Create an new account",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    ],
  ),
),

            TextField(decoration: InputDecoration(labelText: 'UserName')),
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: passController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignupSuccessScreen()));
              },
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
