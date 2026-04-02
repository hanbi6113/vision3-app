// lib/watch/watch_background.dart
import 'package:flutter/material.dart';
import '../data/watch_data.dart';

class WatchBackground extends StatelessWidget {
  final GenreKey genre;

  const WatchBackground({
    super.key,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    switch (genre) {
      case GenreKey.rofan:
        return const _GradientBackground(
          colors: [
            Color(0xFFFFF8FC),
            Color(0xFFFFF6FB),
            Color(0xFFF8FBFF),
          ],
          glowColors: [
            Color(0xFFFFD8EC),
            Color(0xFFE7DCFF),
            Color(0xFFDFF4FF),
          ],
        );
      case GenreKey.romance:
        return const _GradientBackground(
          colors: [
            Color(0xFFFAF6F2),
            Color(0xFFF7F0EB),
            Color(0xFFFCFAF8),
          ],
          glowColors: [
            Color(0xFFEAD5D8),
            Color(0xFFF1DDD4),
            Color(0xFFE9DEDE),
          ],
        );
      case GenreKey.sf:
        return const _GradientBackground(
          colors: [
            Color(0xFF061019),
            Color(0xFF081722),
            Color(0xFF07131D),
          ],
          glowColors: [
            Color(0xFF3ECFFF),
            Color(0xFF5EA9FF),
            Color(0xFF89E8FF),
          ],
          dark: true,
        );
      case GenreKey.murim:
        return const _GradientBackground(
          colors: [
            Color(0xFFF4F0E4),
            Color(0xFFECE7D7),
            Color(0xFFEEF0E5),
          ],
          glowColors: [
            Color(0xFFD9DFC3),
            Color(0xFFE7D8B4),
            Color(0xFFD7DFCF),
          ],
        );
      case GenreKey.horror:
        return const _GradientBackground(
          colors: [
            Color(0xFF060606),
            Color(0xFF11090B),
            Color(0xFF070707),
          ],
          glowColors: [
            Color(0xFF7D1F2A),
            Color(0xFF2A3034),
            Color(0xFF4B0F17),
          ],
          dark: true,
        );
    }
  }
}

class _GradientBackground extends StatelessWidget {
  final List<Color> colors;
  final List<Color> glowColors;
  final bool dark;

  const _GradientBackground({
    required this.colors,
    required this.glowColors,
    this.dark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: colors,
              ),
            ),
          ),
        ),
        Positioned(
          top: -120,
          left: -120,
          child: _Orb(
            color: dark
                ? glowColors[0].withOpacity(0.18)
                : glowColors[0].withOpacity(0.90),
            size: 320,
          ),
        ),
        Positioned(
          top: 80,
          right: -80,
          child: _Orb(
            color: dark
                ? glowColors[1].withOpacity(0.14)
                : glowColors[1].withOpacity(0.80),
            size: 280,
          ),
        ),
        Positioned(
          bottom: -90,
          left: 80,
          child: _Orb(
            color: dark
                ? glowColors[2].withOpacity(0.12)
                : glowColors[2].withOpacity(0.80),
            size: 300,
          ),
        ),
      ],
    );
  }
}

class _Orb extends StatelessWidget {
  final Color color;
  final double size;

  const _Orb({
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: 110,
              spreadRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}