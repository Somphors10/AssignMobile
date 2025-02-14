import 'package:flutter/material.dart';
import 'package:instagram_clone/image_data.dart'; // Import the file containing image URLs

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: _buildSearchBar(),
        elevation: 0,
      ),
      body: _buildGrid(),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[800],
        hintText: "Search",
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (value) {
        // Handle search logic if needed
      },
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(4),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of items in a row
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 1, // Makes the grid square
      ),
      itemCount: imageUrls.length, // Use image URLs from the imported file
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle tap for each item, e.g., open a detailed view
            print('Tapped on image $index');
          },
          child: ImageItem(imageUrl: imageUrls[index]),
        );
      },
    );
  }
}

// Custom widget to display an image
class ImageItem extends StatelessWidget {
  final String imageUrl;

  const ImageItem({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          errorBuilder: (context, error, stackTrace) => const Center(
            child: Icon(Icons.error, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
