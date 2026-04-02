// lib/widgets/page_hero_shell.dart
import 'package:flutter/material.dart';

class PageHeroShell extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String description;
  final Widget? trailing;
  final List<String> filters;
  final int activeIndex;

  const PageHeroShell({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.description,
    this.trailing,
    required this.filters,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(9, 11, 18, 0.94),
                  Color(0xFF050608),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -120,
          left: -40,
          child: _GlowOrb(
            size: 420,
            color: const Color.fromRGBO(82, 122, 255, 0.16),
          ),
        ),
        Positioned(
          top: -40,
          right: 40,
          child: _GlowOrb(
            size: 260,
            color: const Color.fromRGBO(132, 42, 255, 0.14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 16,
                runSpacing: 16,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eyebrow,
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.45),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2.8,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.w600,
                            height: 1.08,
                            letterSpacing: -1,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          description,
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.65),
                            fontSize: 15,
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (trailing != null) trailing!,
                ],
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: List.generate(filters.length, (index) {
                  final active = index == activeIndex;
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: active
                          ? const Color.fromRGBO(255, 255, 255, 0.10)
                          : Colors.transparent,
                      border: Border.all(
                        color: active
                            ? const Color.fromRGBO(255, 255, 255, 0.12)
                            : const Color.fromRGBO(255, 255, 255, 0.10),
                      ),
                    ),
                    child: Text(
                      filters[index],
                      style: TextStyle(
                        color: active
                            ? Colors.white
                            : const Color.fromRGBO(255, 255, 255, 0.60),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GlowOrb extends StatelessWidget {
  final double size;
  final Color color;

  const _GlowOrb({
    required this.size,
    required this.color,
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
              blurRadius: size / 2.2,
              spreadRadius: size / 7,
            ),
          ],
        ),
      ),
    );
  }
}