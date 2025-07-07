import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/basic_module/detail_screen.dart';
import 'package:flutter_application_1/basic_module/photo_constant.dart';
import 'package:flutter_application_1/basic_module/short_screen.dart';

class FbScreen extends StatefulWidget {
  const FbScreen({super.key});

  @override
  State<FbScreen> createState() => _FbScreenState();
}

class _FbScreenState extends State<FbScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
             _buildVideoFeed(),
              const SizedBox(height: 20),
            _buildActorListView(),
            
          ],
        ),
      ),
    );
  }

 Widget _buildActorListView() {
  final double pad = 10;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: pad),
        child: Row(
          children: const [
            Icon(Icons.play_arrow_rounded, color: Colors.white, size: 24), // You can replace with a custom short icon if needed
            SizedBox(width: 5),
            Text(
              'Shorts',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 8),
      SizedBox(
        height: 350,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: actorList.length,
          padding: EdgeInsets.symmetric(horizontal: pad),
          itemBuilder: (context, index) {
            final item = actorList[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TikTokMainPage(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(right: pad),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    item,
                    width: 200,
                    height: 300, 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}


  Widget _buildVideoFeed() {
    final double pad = 10;
    return Column(
      children: imageList.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  imageUrl: item,
                  title: 'Hello everyone this is my vdo that i make it on 2040  :${index + 1}',
                  subtitle: '100K views • 2h ago',
                  channelName: 'Channel ${index + 1}',
                  views: '100K',
                ),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: pad),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item,
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: pad),
                  child: Text(
                    'Kimmy Video :  ${index + 6}',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: pad),
                  child: Text(
                    'Channel ${index + 1} • 100K views • 1 day ago',
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
