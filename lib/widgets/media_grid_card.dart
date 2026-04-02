// lib/widgets/media_grid_card.dart
import 'package:flutter/material.dart';

class MediaGridCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final String href;
  final String? progress;
  final String actionLabel;

  const MediaGridCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.href,
    this.progress,
    this.actionLabel = '이어서 재생',
  });

  double _progressValue(String value) {
    final parsed = double.tryParse(value.replaceAll('%', ''));
    if (parsed == null) return 0;
    return (parsed / 100).clamp(0, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.03),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.10),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 220,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(0, 0, 0, 0.08),
                        Color.fromRGBO(0, 0, 0, 0.24),
                        Color.fromRGBO(0, 0, 0, 0.82),
                      ],
                      stops: [0.0, 0.48, 1.0],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(255, 255, 255, 0.60),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                if (progress != null) ...[
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: LinearProgressIndicator(
                      value: _progressValue(progress!),
                      minHeight: 8,
                      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.10),
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$progress 시청 완료',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(255, 255, 255, 0.52),
                    ),
                  ),
                ],
                const SizedBox(height: 18),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _FilledPillButton(
                      label: actionLabel,
                      onTap: () => Navigator.pushNamed(context, href),
                    ),
                    _OutlinePillButton(
                      label: '상세 보기',
                      onTap: () => Navigator.pushNamed(context, href),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FilledPillButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _FilledPillButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          color: const Color.fromRGBO(255, 255, 255, 0.10),
          border: Border.all(
            color: const Color.fromRGBO(255, 255, 255, 0.12),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _OutlinePillButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _OutlinePillButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: const Color.fromRGBO(255, 255, 255, 0.10),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.60),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}