import 'package:flutter/material.dart';
import 'package:instagram_clone/image_data.dart'; // Import the file containing the image list

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
      title: const Text("Instagram"),
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
    return Padding(
      padding: const EdgeInsets.only(
        top: 10, // Space below the AppBar
        bottom: 10, // Space above the BottomAppBar
      ),
      child: _buildMainListView(),
    );
  }

  Widget _buildMainListView() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        _buildStoryListView(),
        _buildPostListView(),
      ],
    );
  }

  Widget _buildStoryListView() {
    return Container(
      height: 100, // Height of the story container
      margin: const EdgeInsets.symmetric(vertical: 10), // Top and bottom margins
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Container(
            width: 80, // Width of each story
            margin: const EdgeInsets.only(right: 10), // Space between stories
            child: Column(
              children: [
                ClipOval(
                  child: _buildImage(imageList[index], isStory: true),
                ),
                const SizedBox(height: 4), // Space between story and text
                const Text(
                  "User", // Placeholder username
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPostListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: _buildImage(imageList[index]),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text(
                  "Liked by User1 and others", // Placeholder like text
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImage(String path, {bool isStory = false}) {
    return path.startsWith('http') // Check if the path is a network URL
        ? Image.network(
            path,
            fit: BoxFit.cover,
            height: isStory ? 70 : null,
            width: isStory ? 70 : null,
          )
        : Image.asset(
            path,
            fit: BoxFit.cover,
            height: isStory ? 70 : null,
            width: isStory ? 70 : null,
          );
  }
}
