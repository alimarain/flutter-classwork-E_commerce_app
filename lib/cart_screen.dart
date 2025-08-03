import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isOngoingSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back, size: 28),
                  Text("My Order", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(width: 28), 
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => isOngoingSelected = true),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isOngoingSelected ? Colors.black : Colors.transparent,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text(
                        "Ongoing",
                        style: TextStyle(
                          color: isOngoingSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => isOngoingSelected = false),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: !isOngoingSelected ? Colors.black : Colors.transparent,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text(
                        "Completed",
                        style: TextStyle(
                          color: !isOngoingSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    orderCard("BackPack", "Easy To Carry", "Color:Green", "Code: #1234", "\$120.00", "images/bag.png"),
                    orderCard("bags", "tote bags", "Quantity:4", "Code: #5566", "\$60.00", "images/backpack.jpg"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
  Widget orderCard(String title, String subtitle, String size, String code, String price, String imagePath) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade100,
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imagePath, width: 70, height: 70, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(subtitle, style: TextStyle(color: Colors.grey, fontSize: 14)),
                Row(
                  children: [
                    Text(size, style: TextStyle(color: Colors.grey, fontSize: 13)),
                    SizedBox(width: 10),
                    Text(code, style: TextStyle(color: Colors.grey, fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
          Text(price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}
