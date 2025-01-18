import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Posts', style: TextStyle(color: Colors.white)),
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
        body: ListView.builder(
          itemCount: 5, // Example: 5 posts
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    'kim_zoa1997',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Location',
                    style: TextStyle(color: Colors.white70),
                  ),
                  trailing: Icon(Icons.more_vert, color: Colors.white),
                ),

                // Post Image
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey[800], // Placeholder for post image
                  child: Center(
                    child: Icon(Icons.image, color: Colors.white, size: 100),
                  ),
                ),

                // Action Buttons
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite_border,
                                color: Colors.white),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.chat_bubble_outline,
                                color: Colors.white),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.send, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.bookmark_border, color: const Color.fromARGB(255, 8, 2, 2)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                // Likes and Comments
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Liked by user1 and 102 others',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'kim_zoa1997 ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'This is a post caption.',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {},
                        child: Text('View all 15 comments',
                            style: TextStyle(color: Colors.white70)),
                      ),
                      SizedBox(height: 4),
                      Text('2 hours ago',
                          style: TextStyle(
                              color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ),

                Divider(color: Colors.grey),
              ],
            );
          },
        ),
      ),
    );
  }
}
