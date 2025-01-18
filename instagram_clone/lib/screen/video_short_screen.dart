import 'package:flutter/material.dart';

class VideoShortScreen extends StatefulWidget {
  const VideoShortScreen({super.key});

  @override
  State<VideoShortScreen> createState() => _VideoShortScreenState();
}

class _VideoShortScreenState extends State<VideoShortScreen> {
  final List<String> _videoThumbnails = [
    'https://via.placeholder.com/480x800.png?text=Video+1',
    'https://via.placeholder.com/480x800.png?text=Video+2',
    'https://via.placeholder.com/480x800.png?text=Video+3',
    'https://via.placeholder.com/480x800.png?text=Video+4',
    'https://via.placeholder.com/480x800.png?text=Video+5',
  ];

  final List<String> _profilePictures = [
    'https://via.placeholder.com/150.png?text=User+1',
    'https://via.placeholder.com/150.png?text=User+2',
    'https://via.placeholder.com/150.png?text=User+3',
    'https://via.placeholder.com/150.png?text=User+4',
    'https://via.placeholder.com/150.png?text=User+5',
  ];

  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged,
        itemCount: _videoThumbnails.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // Video Placeholder
              Image.network(
                _videoThumbnails[index],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              _buildOverlay(index),
              _buildRightIcons(index),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOverlay(int index) {
    return Positioned(
      bottom: 80,
      left: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(_profilePictures[index]),
              ),
              const SizedBox(width: 10),
              Text(
                '@user${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            'This is a description for video ${index + 1}',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildRightIcons(int index) {
    return Positioned(
      bottom: 80,
      right: 16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 20),
          _buildIconWithLabel(Icons.favorite_border, '1.2M'),
          const SizedBox(height: 20),
          _buildIconWithLabel(Icons.chat_bubble_outline, '34K'),
          const SizedBox(height: 20),
          _buildIconWithLabel(Icons.share, 'Share'),
          const SizedBox(height: 20),
          _buildIconWithLabel(Icons.more_vert, ''),
        ],
      ),
    );
  }

  Widget _buildIconWithLabel(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        const SizedBox(height: 5),
        if (label.isNotEmpty)
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
      ],
    );
  }
}
