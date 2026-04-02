// lib/widgets/site_header.dart
import 'package:flutter/material.dart';

class SiteHeader extends StatelessWidget implements PreferredSizeWidget {
  final String currentPath;

  const SiteHeader({
    super.key,
    required this.currentPath,
  });

  bool _isActive(String prefix) => currentPath.startsWith(prefix);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromRGBO(5, 6, 8, 0.88),
      elevation: 0,
      toolbarHeight: 72,
      titleSpacing: 20,
      title: Row(
        children: [
          const Text(
            'Vision3',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
          ),
          const Spacer(),
          _NavChip(
            label: 'Discover',
            active: _isActive('/discover'),
            onTap: () => Navigator.pushNamed(context, '/discover'),
          ),
          const SizedBox(width: 10),
          _NavChip(
            label: 'Series',
            active: _isActive('/series'),
            onTap: () => Navigator.pushNamed(context, '/series'),
          ),
          const SizedBox(width: 10),
          _NavChip(
            label: 'Movies',
            active: _isActive('/movies'),
            onTap: () => Navigator.pushNamed(context, '/movies'),
          ),
          const SizedBox(width: 10),
          _NavChip(
            label: 'Rankings',
            active: _isActive('/rankings'),
            onTap: () => Navigator.pushNamed(context, '/rankings'),
          ),
          const SizedBox(width: 10),
          _NavChip(
            label: 'Continue',
            active: _isActive('/continue-watching'),
            onTap: () => Navigator.pushNamed(context, '/continue-watching'),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: const Color.fromRGBO(255, 255, 255, 0.10),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(73);
}

class _NavChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _NavChip({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          border: active
              ? Border.all(color: const Color.fromRGBO(255, 255, 255, 0.12))
              : null,
          color: active
              ? const Color.fromRGBO(255, 255, 255, 0.10)
              : Colors.transparent,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: active
                ? Colors.white
                : const Color.fromRGBO(255, 255, 255, 0.72),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}