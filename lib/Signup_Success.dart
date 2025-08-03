import 'package:flutter/material.dart';
import 'dashboard.dart';

class SignupSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.check_circle, color: Colors.green, size: 80),
          Text("Signup Successful!", style: TextStyle(fontSize: 22)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Dashboard()));
            },
            child: Text("Go to Dashboard"),
          )
        ]),
      ),
    );
  }
}
