import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_logic.dart';
import 'font_logic.dart';

class MessengerSettingsScreen extends StatelessWidget {
  const MessengerSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeLogic = Provider.of<ThemeLogic>(context);
    final fontLogic = Provider.of<FontLogic>(context);

    final isDark = themeLogic.themeIndex == 1;
    final backgroundColor = isDark ? Colors.black : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: fontLogic.size + 3,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(Icons.person, size: 40, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  'Nh Ah Kuy',
                  style: TextStyle(
                    fontSize: fontLogic.size + 1,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '@thai.tha.5245961',
                  style: TextStyle(
                    fontSize: fontLogic.size - 2,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          _buildSectionTitle('Accounts', fontLogic),
          _buildListTile(Icons.switch_account, 'Switch account', fontLogic, textColor, onTap: () {}),

          _buildSectionTitle('Profile', fontLogic),
          _buildListTile(
            Icons.dark_mode,
            'Dark mode',
            fontLogic,
            textColor,
            trailing: Text(
              themeLogic.themeIndex == 1 ? 'On' : 'Off',
              style: TextStyle(color: textColor, fontSize: fontLogic.size - 2),
            ),
            onTap: () {
              if (themeLogic.themeIndex == 1) {
                themeLogic.changeToLight();
              } else {
                themeLogic.changeToDark();
              }
            },
          ),
          _buildListTile(
            Icons.circle,
            'Active status',
            fontLogic,
            textColor,
            trailing: Text('On', style: TextStyle(color: textColor, fontSize: fontLogic.size - 2)),
            onTap: () {},
          ),
          _buildListTile(
            Icons.alternate_email,
            'Username',
            fontLogic,
            textColor,
            trailing: Text(
              'm.me/thai.tha.5245961',
              style: TextStyle(color: Colors.grey, fontSize: fontLogic.size - 3),
            ),
            onTap: () {},
          ),

          _buildSectionTitle('For families', fontLogic),
          _buildListTile(Icons.family_restroom, 'Family Center', fontLogic, textColor, onTap: () {}),

          _buildSectionTitle('Services', fontLogic),
          _buildListTile(Icons.shopping_bag, 'Orders', fontLogic, textColor, onTap: () {}),
          _buildListTile(Icons.payment, 'Payments', fontLogic, textColor, onTap: () {}),

          const SizedBox(height: 24),

          // Font size controls
          Center(
            child: Column(
              children: [
                Text(
                  'Font Size: ${fontLogic.size.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: fontLogic.size,
                    color: textColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle),
                      color: textColor,
                      onPressed: () {
                        fontLogic.decrease();
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle),
                      color: textColor,
                      onPressed: () {
                        fontLogic.increase();
                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, FontLogic fontLogic) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontLogic.size - 1,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildListTile(
    IconData icon,
    String text,
    FontLogic fontLogic,
    Color textColor, {
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(
        text,
        style: TextStyle(
          fontSize: fontLogic.size,
          color: textColor,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
