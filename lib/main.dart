import 'package:e_commerce_app/Dashboard.dart';
import 'package:e_commerce_app/Login_Screen.dart';
import 'package:e_commerce_app/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Dashboard(),
    );
  }
}
