import 'package:flutter/material.dart';

// Global notifier for theme mode
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() => runApp(MessengerCloneApp());

class MessengerCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, currentMode, __) {
        return MaterialApp(
          title: 'Messenger Clone',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,
          home: HomeScreen(),
        );
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  final List<Widget> _pages = <Widget>[
    const Center(child: Text('Chats Page')),
    const StoriesPage(),
    const MenuPage(),
  ];

  void _onTap(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_stories),
            label: 'Stories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}

class Story {
  final String name;
  final String imageUrl;
  final bool isOnline;
  final int unreadCount;

  const Story({
    required this.name,
    required this.imageUrl,
    this.isOnline = false,
    this.unreadCount = 0,
  });
}

class StoriesPage extends StatelessWidget {
  const StoriesPage({Key? key}) : super(key: key);
  static const List<Story> stories = <Story>[
    Story(
        name: 'Nii Kaa',
        imageUrl: 'https://via.placeholder.com/150',
        isOnline: true,
        unreadCount: 2),
    Story(
        name: 'Kaylee Lee',
        imageUrl: 'https://via.placeholder.com/150',
        isOnline: true,
        unreadCount: 1),
    Story(
        name: 'Zē Ny',
        imageUrl: 'https://via.placeholder.com/150',
        isOnline: true,
        unreadCount: 1),
    Story(
        name: 'Friend 4',
        imageUrl: 'https://via.placeholder.com/150',
        isOnline: false),
    Story(
        name: 'Friend 5',
        imageUrl: 'https://via.placeholder.com/150',
        isOnline: true,
        unreadCount: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 3 / 4,
          ),
          itemCount: stories.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const StoryCard.addStory();
            }
            return StoryCard(story: stories[index - 1]);
          },
        ),
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final Story? story;
  final bool isAdd;

  const StoryCard({Key? key, this.story})
      : isAdd = false,
        super(key: key);
  const StoryCard.addStory({Key? key})
      : story = null,
        isAdd = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: Colors.grey[300],
            child: isAdd
                ? const Center(
                    child: Icon(
                      Icons.add,
                      size: 48,
                      color: Colors.grey,
                    ),
                  )
                : Image.network(
                    story!.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        if (!isAdd && story != null) ...<Widget>[
          Positioned(
            top: 8,
            left: 8,
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.blue,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundImage: NetworkImage(story!.imageUrl),
                  ),
                ),
                if (story!.isOnline)
                  const Positioned(
                    bottom: 2,
                    right: 2,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.green,
                    ),
                  ),
                if (story!.unreadCount > 0)
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${story!.unreadCount}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
              story!.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(blurRadius: 4, color: Colors.black)],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          const ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text('Nh Ah Kuy'),
            subtitle: Text('@thai.tha.5245961'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SettingsPage()),
              );
            },
          ),
          const ListTile(
              leading: Icon(Icons.store), title: Text('Marketplace')),
          const ListTile(
              leading: Icon(Icons.message), title: Text('Message requests')),
          const ListTile(leading: Icon(Icons.archive), title: Text('Archive')),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('More', style: TextStyle(color: Colors.grey)),
          ),
          const ListTile(
              leading: Icon(Icons.person_add), title: Text('Friend requests')),
          const ListTile(
              leading: Icon(Icons.chat_bubble), title: Text('Channel invites')),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Communities', style: TextStyle(color: Colors.grey)),
          ),
          const ListTile(
              leading: Icon(Icons.add), title: Text('Create community')),
          const ListTile(
            leading: CircleAvatar(child: Text('EPS')),
            title: Text('EPS 한국 거'),
            subtitle: Text('2,578 active'),
          ),
          const ListTile(
            leading: CircleAvatar(child: Icon(Icons.school)),
            title: Text('AUB Student Zone'),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = themeNotifier.value == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 24),
            Center(
              child: Stack(
                children: <Widget>[
                  const CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 48, color: Colors.white),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.camera_alt,
                          size: 16, color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Center(
              child: Text('Nh Ah Kuy',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const Center(
              child: Text('@thai.tha.5245961',
                  style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Accounts',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const ListTile(
              leading: Icon(Icons.swap_horiz),
              title: Text('Switch account'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text('Profile',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SwitchListTile(
              secondary: const Icon(Icons.nightlight_round),
              title: const Text('Dark mode'),
              value: isDark,
              onChanged: (val) {
                themeNotifier.value = val ? ThemeMode.dark : ThemeMode.light;
              },
            ),
            SwitchListTile(
              secondary: const Icon(Icons.circle),
              title: const Text('Active status'),
              value: true,
              onChanged: (_) {},
            ),
            ListTile(
              leading: const Icon(Icons.alternate_email),
              title: const Text('Username'),
              subtitle: const Text('m.me/thai.tha.5245961'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text('For families',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const ListTile(
              leading: Icon(Icons.family_restroom),
              title: Text('Family Center'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text('Services',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Orders'),
            ),
            const ListTile(
              leading: Icon(Icons.payment),
              title: Text('Payments'),
            ),
          ],
        ),
      ),
    );
  }
}
