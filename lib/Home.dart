import 'package:e_commerce_app/Product_Detail.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> products = ["Shoe", "Watch", "Shirt", "Laptop"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(productName: products[index])));
            },
          );
        },
      ),
    );
  }
}
