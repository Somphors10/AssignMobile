import 'package:flutter/material.dart';
import 'package:instagram_clone/image_data.dart';

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
          itemCount: postImages.length, 
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
                  child: Image.network(
                    postImages[index], 
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Icon(Icons.error, color: Colors.white));
                    },
                  ),
                ),

                // Action Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite_border, color: Colors.white),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.chat_bubble_outline, color: Colors.white),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.send, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.bookmark_border, color: Color.fromARGB(255, 8, 2, 2)),
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
                      Text('Liked by user1 and 102 others', style: TextStyle(color: Colors.white)),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'kim_zoa1997 ',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                        child: Text('View all 15 comments', style: TextStyle(color: Colors.white70)),
                      ),
                      SizedBox(height: 4),
                      Text('2 hours ago', style: TextStyle(color: Colors.white70, fontSize: 12)),
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
