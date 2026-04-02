// lib/pages/rankings_page.dart
import 'package:flutter/material.dart';
import '../data/watch_data.dart';
import '../widgets/vision_scaffold.dart';

class RankingsPage extends StatelessWidget {
  const RankingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return VisionScaffold(
      currentPath: '/rankings',
      body: Container(
        color: const Color(0xFF050608),
        child: Stack(
          children: [
            const Positioned.fill(
              child: _TopGradientBackground(),
            ),
            SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1280),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 26, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                runSpacing: 16,
                                spacing: 16,
                                children: [
                                  ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxWidth: 760),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'RANKINGS',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 2.8,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.45),
                                          ),
                                        ),
                                        SizedBox(height: 14),
                                        Text(
                                          '인기순위',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 42,
                                            fontWeight: FontWeight.w700,
                                            height: 1.08,
                                            letterSpacing: -1,
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          '지금 Vision3에서 가장 많이 보고 있는 작품들을 모은 랭킹 페이지야. 메인 Top 10보다 더 넓게 보고 바로 재생할 수 있게 확장했어.',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.65),
                                            fontSize: 15,
                                            height: 1.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  _HeroNavButton(
                                    label: '메인으로 돌아가기',
                                    onTap: _goHome,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: const [
                                  _FilterChip(label: '전체', active: true),
                                  _FilterChip(label: '시리즈'),
                                  _FilterChip(label: '영화'),
                                  _FilterChip(label: '오늘 기준'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1280),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              int crossAxisCount = 2;
                              if (constraints.maxWidth >= 1400) {
                                crossAxisCount = 5;
                              } else if (constraints.maxWidth >= 1100) {
                                crossAxisCount = 4;
                              } else if (constraints.maxWidth >= 760) {
                                crossAxisCount = 3;
                              }

                              return GridView.builder(
                                itemCount: rankingList.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 0.67,
                                ),
                                itemBuilder: (context, index) {
                                  final item = rankingList[index];
                                  return _RankingCard(item: item);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _goHome(BuildContext context) {
    Navigator.pushNamed(context, '/');
  }
}

class _RankingCard extends StatelessWidget {
  final RankingItem item;

  const _RankingCard({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () => Navigator.pushNamed(context, item.href),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border:
              Border.all(color: const Color.fromRGBO(255, 255, 255, 0.10)),
          color: const Color.fromRGBO(255, 255, 255, 0.03),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              item.image,
              fit: BoxFit.cover,
            ),
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
                '${item.rank}',
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
                    item.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
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
    );
  }
}

class _TopGradientBackground extends StatelessWidget {
  const _TopGradientBackground();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Positioned(
          top: -120,
          left: -40,
          child: _GlowOrb(
            size: 420,
            color: Color.fromRGBO(82, 122, 255, 0.16),
          ),
        ),
        Positioned(
          top: -40,
          right: 40,
          child: _GlowOrb(
            size: 260,
            color: Color.fromRGBO(132, 42, 255, 0.14),
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
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
      ],
    );
  }
}

class _HeroNavButton extends StatelessWidget {
  final String label;
  final void Function(BuildContext context) onTap;

  const _HeroNavButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: () => onTap(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          color: const Color.fromRGBO(255, 255, 255, 0.10),
          border:
              Border.all(color: const Color.fromRGBO(255, 255, 255, 0.12)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool active;

  const _FilterChip({
    required this.label,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color:
            active ? const Color.fromRGBO(255, 255, 255, 0.10) : Colors.transparent,
        border: Border.all(
          color: active
              ? const Color.fromRGBO(255, 255, 255, 0.12)
              : const Color.fromRGBO(255, 255, 255, 0.10),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: active
              ? Colors.white
              : const Color.fromRGBO(255, 255, 255, 0.60),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
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
              spreadRadius: size / 8,
            ),
          ],
        ),
      ),
    );
  }
}