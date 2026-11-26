import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final bool darkMode;
  final ValueChanged<bool> onDarkModeChanged;

  const ProfileScreen({
    super.key,
    required this.darkMode,
    required this.onDarkModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профайл'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Харанхуй горим'),
            subtitle: const Text('Light болон Dark theme сэлгэх'),
            value: darkMode,
            onChanged: onDarkModeChanged,
          ),
        ],
      ),
    );
  }
}
