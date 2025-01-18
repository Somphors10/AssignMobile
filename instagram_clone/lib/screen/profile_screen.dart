import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Text('kim_zoa1997', style: TextStyle(color: Colors.white)),
              Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add_box_outlined, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, size: 40, color: Colors.white),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              profileStat('0', 'Posts'),
                              profileStat('102', 'Followers'),
                              profileStat('857', 'Following'),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              profileButton('Edit Profile'),
                              profileButton('Share Profile'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Zoa', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Taekook 💖', style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 4),
                    Text('www.facebook.com/profile.php?id=10008...', style: TextStyle(color: Colors.blue)),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Divider(color: Colors.grey),
              storyHighlights(),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileStat(String count, String label) {
    return Column(
      children: [
        Text(count, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.white70)),
      ],
    );
  }

  Widget profileButton(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }

  Widget storyHighlights() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          storyIcon('💖✨'),
          SizedBox(width: 16),
          storyIcon('luv💗'),
          SizedBox(width: 16),
          storyIcon('New', isPlaceholder: true),
        ],
      ),
    );
  }

  Widget storyIcon(String label, {bool isPlaceholder = false}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: isPlaceholder ? Colors.grey : Colors.white,
          child: isPlaceholder
              ? Icon(Icons.add, size: 30, color: Colors.white)
              : Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}
