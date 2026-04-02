// lib/widgets/vision_scaffold.dart
import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';

class VisionScaffold extends StatelessWidget {
  final String currentPath;
  final Widget body;

  const VisionScaffold({
    super.key,
    required this.currentPath,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavBar(currentPath: currentPath),
    );
  }
}