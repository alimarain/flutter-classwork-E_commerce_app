import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Color iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4, 
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back, color: iconColor),
                  Icon(Icons.visibility, color: iconColor),
                ],
              ),
              SizedBox(height: 20),

              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('images/face.jpg'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'ali muhammad',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'alimuhammad41@gmail.com',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 30),
              _buildMenuSection('Personal Details', Icons.person),
              _buildMenuSection('My Order', Icons.shopping_bag),
              _buildMenuSection('My Favourites', Icons.favorite),
              _buildMenuSection('Shipping Address', Icons.location_on),
              _buildMenuSection('My Card', Icons.credit_card),
              _buildMenuSection('Settings', Icons.settings),
              SizedBox(height: 20),
              _buildMenuSection('FAQs', Icons.help_outline),
              _buildMenuSection('Privacy Policy', Icons.privacy_tip),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuSection(String title, IconData icon) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: iconColor),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
          },
        ),
        Divider(),
      ],
    );
  }
}
