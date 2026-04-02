// lib/widgets/ranking_poster_card.dart
import 'package:flutter/material.dart';

class RankingPosterCard extends StatelessWidget {
  final int rank;
  final String title;
  final String subtitle;
  final String image;
  final String href;

  const RankingPosterCard({
    super.key,
    required this.rank,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.href,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () => Navigator.pushNamed(context, href),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.03),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.10)),
        ),
        clipBehavior: Clip.antiAlias,
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(image, fit: BoxFit.cover),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.04),
                      Color.fromRGBO(0, 0, 0, 0.12),
                      Color.fromRGBO(0, 0, 0, 0.86),
                    ],
                    stops: [0.0, 0.42, 1.0],
                  ),
                ),
              ),
              Positioned(
                left: 16,
                top: 12,
                child: Text(
                  '$rank',
                  style: const TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(255, 255, 255, 0.90),
                    height: 1,
                  ),
                ),
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.70),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}