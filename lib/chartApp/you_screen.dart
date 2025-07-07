import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: you_screen(),
    debugShowCheckedModeBanner: false,
  ));
}

class you_screen extends StatelessWidget {
  const you_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const SizedBox(height: 40),
          _buildProfileHeader(),
          const SizedBox(height: 16),
          _buildHorizontalSectionTitle("History"),
          _buildHorizontalImageList(),
          const SizedBox(height: 16),
          _buildHorizontalSectionTitle("Playlists"),
          _buildHorizontalPlaylistList(),
          const Divider(),
          _buildSectionTile("Your videos", Icons.video_library_outlined),
          _buildSectionTile("Downloads", Icons.download_outlined, trailing: const Text("20 recommendations")),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundColor: Colors.deepPurple,
            child: Text(
              "T",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Tha Thai", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Create a channel", style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.cast),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text("View all", style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildHorizontalImageList() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          _buildImageItem("https://th.bing.com/th/id/OIP.7lQAEJB473kMKB3GmMaOggHaHa?w=125&h=104&c=7&bgcl=ec9996&r=0&o=6&dpr=1.3&pid=13.1"),
          _buildImageItem("https://th.bing.com/th/id/OIP.7lQAEJB473kMKB3GmMaOggHaHa?w=125&h=104&c=7&bgcl=ec9996&r=0&o=6&dpr=1.3&pid=13.1"),
          _buildImageItem("https://th.bing.com/th/id/OIP.7lQAEJB473kMKB3GmMaOggHaHa?w=125&h=104&c=7&bgcl=ec9996&r=0&o=6&dpr=1.3&pid=13.1"),
        ],
      ),
    );
  }

  Widget _buildImageItem(String url) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(url, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildHorizontalPlaylistList() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          _buildPlaylistItem(Icons.thumb_up_alt_outlined, "Liked videos", "Private"),
          _buildPlaylistItem(Icons.watch_later_outlined, "Watch later", "Private"),
          _buildNewPlaylistItem(),
        ],
      ),
    );
  }

  Widget _buildPlaylistItem(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 120,
            color: Colors.grey.shade300,
            child: Icon(icon, size: 30),
          ),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildNewPlaylistItem() {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 120,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 120,
            color: Colors.grey.shade300,
            child: const Center(child: Icon(Icons.add)),
          ),
          const SizedBox(height: 4),
          const Text("New playlist", style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildSectionTile(String title, IconData icon, {Widget? trailing}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing,
      onTap: () {},
    );
  }
}
