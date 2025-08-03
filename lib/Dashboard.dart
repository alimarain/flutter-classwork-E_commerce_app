import 'package:e_commerce_app/cart_screen.dart';
import 'package:e_commerce_app/notification_screen.dart';
import 'package:e_commerce_app/profile_screen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, size: 28),
                  Icon(Icons.search, size: 28),
                ],
              ),
              const SizedBox(height: 20),

              Container(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    promoCard("50% Off", "On everything today"),
                    SizedBox(width: 10),
                    promoCard("70% Off", "On every product"),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              sectionHeader("New Arrivals"),
              const SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  productCard("The Marc Jacobs", "Cotton backpack", "\$195.00", "images/bag.png"),
                  productCard("Tote", "Tote bags", "\$245.00", "images/backpack.jpg"),
                ],
              ),
              const SizedBox(height: 20),
              sectionHeader("Popular"),
              const SizedBox(height: 10),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    popularCard("Nike", "Premium Shoes", "\$740.00", "images/nike.jpg"),
                    SizedBox(width: 10),
                    popularCard("Nike Air Max", "Running shoes", "\$180.00", "images/sneakers.jpg"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

   bottomNavigationBar: BottomNavigationBar(
  currentIndex: _currentIndex,
  type: BottomNavigationBarType.fixed,
  onTap: (index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => CartScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => NotificationScreen()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ProfileScreen()),
      );
    } else {
      setState(() => _currentIndex = index);
    }
    
  },
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
    BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifications"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ],
)



    );
  }

  Widget promoCard(String title, String subtitle) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black87,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(subtitle, style: TextStyle(color: Colors.white70, fontSize: 16)),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: Text("Get Now", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  Widget sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("View All", style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget productCard(String name, String subtitle, String price, String imagePath) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade200,
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Image.asset(imagePath, fit: BoxFit.contain)),
            const SizedBox(height: 6),
            Text(name, style: TextStyle(fontWeight: FontWeight.w600)),
            Text(subtitle, style: TextStyle(color: Colors.grey)),
            Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget popularCard(String name, String subtitle, String price, String imagePath) {
    return Container(
      width: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Image.asset(imagePath, width: 60, height: 60),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.w600)),
                Text(subtitle, style: TextStyle(color: Colors.grey)),
                Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
