import 'package:flutter/material.dart';
import 'package:instagram_clone/image_data.dart'; // Import the file containing the user data

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Instagram",
        style: TextStyle(fontFamily: 'Billabong', fontSize: 32),
      ),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      actions: const [
        Icon(Icons.favorite_border), // Favorite icon
        SizedBox(width: 16), // Space between icons
        Icon(Icons.message_outlined), // Chat icon
        SizedBox(width: 16), // Space at the end
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStoryListView(), // Stories section
          const Divider(color: Colors.grey), // Divider between sections
          _buildPostListView(), // Posts section
        ],
      ),
    );
  }

  Widget _buildStoryListView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(
            userData.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.red,
                        width: 3, // Story border width
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        userData[index]["image"]!,
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userData[index]["name"]!, // Display username from userData
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPostListView() {
    return Column(
      children: List.generate(
        userData.length,
        (index) => Container(
          margin: const EdgeInsets.only(bottom: 16),
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        userData[index]["image"]!,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      userData[index]["name"]!, // Display username from userData
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.more_vert, color: Colors.white),
                  ],
                ),
              ),
              Image.network(
                userData[index]["image"]!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.favorite_border, color: Colors.white),
                    SizedBox(width: 16),
                    Icon(Icons.comment_outlined, color: Colors.white),
                    SizedBox(width: 16),
                    Icon(Icons.send_outlined, color: Colors.white),
                    Spacer(),
                    Icon(Icons.bookmark_border, color: Colors.white),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Liked by ${userData[(index + 1) % userData.length]["name"]!} and others", // Dynamic like text
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "View all comments", // Placeholder comment text
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
