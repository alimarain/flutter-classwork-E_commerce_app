import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'name': 'owais',
      'message': 'It is a long established fact that a reader will be distracted by the readable content.',
      'time': '3 hours ago',
      'avatar': 'assets/user1.jpg'
    },
    {
      'name': 'Abdul hadi',
      'message': 'There are many variations of passages of Lorem Ipsum available.',
      'time': '2 hours ago',
      'avatar': 'assets/user2.jpg'
    },
    {
      'name': 'rana azhar',
      'message': 'If you are going to use a passage of Lorem Ipsum, be sure there isn’t anything embarrassing.',
      'time': '6 hours ago',
      'avatar': 'assets/user3.jpg'
    },
    {
      'name': 'moazzam',
      'message': 'It is a long established fact that a reader will be distracted by this layout.',
      'time': '7 hours ago',
      'avatar': 'assets/user1.jpg'
    },
    {
      'name': 'ramish gujjar',
      'message': 'There are many variations of passages of Lorem Ipsum available.',
      'time': '8 hours ago',
      'avatar': 'assets/user2.jpg'
    },
    {
      'name': 'Taimoor Ash',
      'message': 'If you are going to use a passage of Lorem Ipsum, be sure there isn’t anything embarrassing.',
      'time': '10 hours ago',
      'avatar': 'assets/user3.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notif'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.arrow_back),
                  Text(
                    'Notification',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.more_vert),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: notifications.length,
                separatorBuilder: (_, __) => Divider(height: 20),
                itemBuilder: (context, index) {
                  final item = notifications[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(item['avatar']!),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name']!,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(height: 4),
                            Text(
                              item['message']!,
                              style: TextStyle(color: Colors.black87),
                            ),
                            SizedBox(height: 4),
                            Text(
                              item['time']!,
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
