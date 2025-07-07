import 'package:flutter/material.dart';
import 'package:flutter_application_1/chart_module/settng_screen.dart';
import 'detail_screen.dart';
import 'story_screen.dart';
 // Make sure you import your settings screen

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'messenger',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.facebook, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildBody(context),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'People'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 2) {
            // Open settings screen directly
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MessengerSettingsScreen()),
            );
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_currentIndex == 1) {
      // People tab shows StoryScreen
      return  StoryScreen();
    }

    // Default: Chats
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildStoryItem(null, "Your note"),
              _buildStoryItem('https://www.bing.com/th/id/OIP.BzIEmqTkX9RaOxFr35HIRwHaEo?w=261&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2', "Pa"),
              _buildStoryItem('https://www.bing.com/th/id/OIP.BzIEmqTkX9RaOxFr35HIRwHaEo?w=261&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2', "Ñoe"),
              _buildStoryItem('https://www.bing.com/th/id/OIP.BzIEmqTkX9RaOxFr35HIRwHaEo?w=261&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=20', "Jènzyy"),
              _buildStoryItem('https://www.bing.com/th/id/OIP.BzIEmqTkX9RaOxFr35HIRwHaEo?w=261&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2', "Pa"),
              _buildStoryItem('https://www.bing.com/th/id/OIP.BzIEmqTkX9RaOxFr35HIRwHaEo?w=261&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2', "Ñoe"),
              _buildStoryItem('https://www.bing.com/th/id/OIP.BzIEmqTkX9RaOxFr35HIRwHaEo?w=261&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=20', "Jènzyy"),
              _buildStoryItem('https://www.bing.com/th/id/OIP.BzIEmqTkX9RaOxFr35HIRwHaEo?w=261&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2', "Pa"),
              _buildStoryItem('https://www.bing.com/th/id/OIP.BzIEmqTkX9RaOxFr35HIRwHaEo?w=261&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2', "Ñoe"),
              _buildStoryItem('https://www.bing.com/th/id/OIP.BzIEmqTkX9RaOxFr35HIRwHaEo?w=261&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=20', "Jènzyy"),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildChatItem(
                context,
                "https://th.bing.com/th/id/OIP.l-Qmr5cOiKCSh13fb6bM0QHaJQ?w=120&h=104&c=7&bgcl=4cf178&r=0&o=6&dpr=1.3&pid=13.1",
                "Chhay Boravy",
                "2 new messages",
                "22:55",
              ),
              _buildChatItem(
                context,
                "https://th.bing.com/th/id/OIP.l-Qmr5cOiKCSh13fb6bM0QHaJQ?w=120&h=104&c=7&bgcl=4cf178&r=0&o=6&dpr=1.3&pid=13.1",
                "Ah Pov",
                "Ah sent a photo.",
                "11:27",
              ),
              _buildChatItem(
                context,
                "https://th.bing.com/th/id/OIP.l-Qmr5cOiKCSh13fb6bM0QHaJQ?w=120&h=104&c=7&bgcl=4cf178&r=0&o=6&dpr=1.3&pid=13.1",
                "Chhay Boravy",
                "2 new messages",
                "22:55",
              ),
              _buildChatItem(
                context,
                "https://th.bing.com/th/id/OIP.l-Qmr5cOiKCSh13fb6bM0QHaJQ?w=120&h=104&c=7&bgcl=4cf178&r=0&o=6&dpr=1.3&pid=13.1",
                "Ah Pov",
                "Ah sent a photo.",
                "11:27",
              ),
              _buildChatItem(
                context,
                "https://th.bing.com/th/id/OIP.l-Qmr5cOiKCSh13fb6bM0QHaJQ?w=120&h=104&c=7&bgcl=4cf178&r=0&o=6&dpr=1.3&pid=13.1",
                "Chhay Boravy",
                "2 new messages",
                "22:55",
              ),
              _buildChatItem(
                context,
                "https://th.bing.com/th/id/OIP.l-Qmr5cOiKCSh13fb6bM0QHaJQ?w=120&h=104&c=7&bgcl=4cf178&r=0&o=6&dpr=1.3&pid=13.1",
                "Ah Pov",
                "Ah sent a photo.",
                "11:27",
              ),
              _buildChatItem(
                context,
                "https://th.bing.com/th/id/OIP.l-Qmr5cOiKCSh13fb6bM0QHaJQ?w=120&h=104&c=7&bgcl=4cf178&r=0&o=6&dpr=1.3&pid=13.1",
                "Chhay Boravy",
                "2 new messages",
                "22:55",
              ),
              _buildChatItem(
                context,
                "https://th.bing.com/th/id/OIP.l-Qmr5cOiKCSh13fb6bM0QHaJQ?w=120&h=104&c=7&bgcl=4cf178&r=0&o=6&dpr=1.3&pid=13.1",
                "Ah Pov",
                "Ah sent a photo.",
                "11:27",
              ),
              _buildChatItem(
                context,
                "https://th.bing.com/th/id/OIP.l-Qmr5cOiKCSh13fb6bM0QHaJQ?w=120&h=104&c=7&bgcl=4cf178&r=0&o=6&dpr=1.3&pid=13.1",
                "Chhay Boravy",
                "2 new messages",
                "22:55",
              ),
              _buildChatItem(
                context,
                "https://th.bing.com/th/id/OIP.l-Qmr5cOiKCSh13fb6bM0QHaJQ?w=120&h=104&c=7&bgcl=4cf178&r=0&o=6&dpr=1.3&pid=13.1",
                "Ah Pov",
                "Ah sent a photo.",
                "11:27",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStoryItem(String? imageUrl, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
            backgroundColor: Colors.grey[300],
            child: imageUrl == null
                ? const Icon(Icons.person, color: Colors.white)
                : null,
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Widget _buildChatItem(
      BuildContext context, String imageUrl, String name, String message, String time) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
      title: Text(name),
      subtitle: Text(message),
      trailing: Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(name: name, imageUrl: imageUrl),
          ),
        );
      },
    );
  }
}
