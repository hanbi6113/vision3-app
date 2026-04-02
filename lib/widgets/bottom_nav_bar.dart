// lib/widgets/bottom_nav_bar.dart
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final String currentPath;

  const BottomNavBar({
    super.key,
    required this.currentPath,
  });

  int _selectedIndex() {
    if (currentPath == '/' || currentPath.startsWith('/home')) return 0;
    if (currentPath.startsWith('/series')) return 1;
    if (currentPath.startsWith('/movies')) return 2;
    if (currentPath.startsWith('/discover')) return 3;
    if (currentPath.startsWith('/market')) return 4;
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    final routes = [
      '/',
      '/series',
      '/movies',
      '/discover',
      '/market',
    ];

    final target = routes[index];

    if (currentPath == target) return;

    Navigator.pushNamed(context, target);
  }

  @override
  Widget build(BuildContext context) {
    final selected = _selectedIndex();

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF050608),
        border: Border(
          top: BorderSide(
            color: Color.fromRGBO(255, 255, 255, 0.08),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 76,
          child: Row(
            children: [
              _BottomNavItem(
                label: 'Home',
                active: selected == 0,
                onTap: () => _onTap(context, 0),
              ),
              _BottomNavItem(
                label: 'Series',
                active: selected == 1,
                onTap: () => _onTap(context, 1),
              ),
              _BottomNavItem(
                label: 'Movies',
                active: selected == 2,
                onTap: () => _onTap(context, 2),
              ),
              _BottomNavItem(
                label: 'Discover',
                active: selected == 3,
                onTap: () => _onTap(context, 3),
              ),
              _BottomNavItem(
                label: 'Market',
                active: selected == 4,
                onTap: () => _onTap(context, 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _BottomNavItem({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 34,
                height: 3,
                decoration: BoxDecoration(
                  color: active ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: active
                      ? Colors.white
                      : const Color.fromRGBO(255, 255, 255, 0.58),
                  fontSize: 13,
                  fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}