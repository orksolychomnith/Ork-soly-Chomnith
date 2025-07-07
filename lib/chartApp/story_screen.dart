import 'package:flutter/material.dart';

void main() => runApp(StoryApp());

class StoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoryScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> stories = [
    {
      'name': 'User 1',
      'image': 'https://www.bing.com/th/id/OIP.bBuxH_NIkzrXbt6468FlXAHaEK?w=259&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
      'count': 2,
    },
    {
      'name': 'Kaylee Lee',
      'image': 'https://www.bing.com/th/id/OIP.hGVGX2jNoIiTRqjdoqC5aQHaHa?w=157&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
      'count': 1,
    },
    {
      'name': 'Zé Ny',
      'image': 'https://www.bing.com/th/id/OIP.hGVGX2jNoIiTRqjdoqC5aQHaHa?w=157&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
      'count': 1,
    },
    {
      'name': 'Jong jong pink',
      'image': 'https://www.bing.com/th/id/OIP.hGVGX2jNoIiTRqjdoqC5aQHaHa?w=157&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
      'count': 1,
    },
    {
      'name': 'User 5',
      'image': 'https://www.bing.com/th/id/OIP.l2wEB5mRjWN7L9q13R2PggHaEo?w=224&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
      'count': 1,
    },
    {
      'name': 'User 6',
      'image': 'https://www.bing.com/th/id/OIP.l2wEB5mRjWN7L9q13R2PggHaEo?w=224&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
      'count': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stories', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            buildAddStoryTile(),
            ...stories.map((story) => buildStoryTile(story)).toList(),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 1,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
      //     BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Stories'),
      //     BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
      //   ],
      // ),
    );
  }

  Widget buildAddStoryTile() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Icon(Icons.add, size: 30, color: Colors.black),
          ),
          SizedBox(height: 10),
          Text('Add to story'),
        ],
      ),
    );
  }

  Widget buildStoryTile(Map<String, dynamic> story) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(story['image']),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(5),
            color: Colors.black.withOpacity(0.4),
            width: double.infinity,
            child: Text(
              story['name'],
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        if (story['count'] > 1)
          Positioned(
            top: 6,
            right: 6,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.black,
              child: Text(
                '${story['count']}',
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}