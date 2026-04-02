// lib/pages/continue_watching_page.dart
import 'package:flutter/material.dart';
import '../data/watch_data.dart';
import '../widgets/vision_scaffold.dart';

class ContinueWatchingPage extends StatelessWidget {
  const ContinueWatchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return VisionScaffold(
      currentPath: '/continue-watching',
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
                                          'CONTINUE WATCHING',
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
                                          '계속 시청하기',
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
                                          '최근에 보던 작품을 바로 이어볼 수 있는 공간이야. 진도와 최근 시청 흐름을 기준으로 다시 이어지는 구조로 정리했어.',
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
                                  _FilterChip(label: '최근 본 순', active: true),
                                  _FilterChip(label: '진도 높은 순'),
                                  _FilterChip(label: '시리즈'),
                                  _FilterChip(label: '영화'),
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
                              int crossAxisCount = 1;
                              if (constraints.maxWidth >= 1200) {
                                crossAxisCount = 4;
                              } else if (constraints.maxWidth >= 760) {
                                crossAxisCount = 2;
                              }

                              return GridView.builder(
                                itemCount: continueWatchingList.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  mainAxisExtent: 392,
                                ),
                                itemBuilder: (context, index) {
                                  final item = continueWatchingList[index];
                                  return _ContinueCard(item: item);
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

class _ContinueCard extends StatelessWidget {
  final ContinueWatchingItem item;

  const _ContinueCard({
    required this.item,
  });

  double get progress {
    final value = double.tryParse(item.progress.replaceAll('%', '')) ?? 0;
    return value / 100;
  }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
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
                    item.subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(255, 255, 255, 0.60),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor:
                          const Color.fromRGBO(255, 255, 255, 0.10),
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${item.progress} 시청 완료',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(255, 255, 255, 0.52),
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