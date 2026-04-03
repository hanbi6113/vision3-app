// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../widgets/vision_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<String> imagePool = List.generate(
    20,
    (i) => 'assets/images/img${i + 1}.jpg',
  );

  static String pickImage(int index) => imagePool[index % imagePool.length];

  static final Map<String, String> heroMain = {
    'label': 'VISION3 ORIGINAL',
    'title': '세이렌',
    'meta': '로맨스 판타지 · 2026 · 12+',
    'desc': '황궁 속 금지된 사랑, 운명을 거스르는 두 사람의 이야기',
    'image': pickImage(0),
  };

  static final List<Map<String, String>> continueWatching = [
    {
      'badge': 'SERIES',
      'title': 'Glass Midnight',
      'subtitle': 'EP 07 · Neo-noir Series',
      'info': '74% 시청 완료',
      'remainText': '16분 남음',
      'progress': '74%',
      'image': pickImage(1),
      'href': '/series',
    },
    {
      'badge': 'SERIES',
      'title': 'Ash Protocol',
      'subtitle': 'EP 03 · Sci-Fi Thriller',
      'info': '48% 시청 완료',
      'remainText': '31분 남음',
      'progress': '48%',
      'image': pickImage(2),
      'href': '/series',
    },
    {
      'badge': 'SERIES',
      'title': 'Silent Harbor',
      'subtitle': 'EP 05 · Mystery Film',
      'info': '63% 시청 완료',
      'remainText': '22분 남음',
      'progress': '63%',
      'image': pickImage(3),
      'href': '/series',
    },
    {
      'badge': 'SERIES',
      'title': 'Velvet Burn',
      'subtitle': 'EP 02 · Original Drama',
      'info': '29% 시청 완료',
      'remainText': '39분 남음',
      'progress': '29%',
      'image': pickImage(4),
      'href': '/series',
    },
  ];

  static final List<Map<String, dynamic>> topTen = [
    {
      'rank': 1,
      'title': 'Glass Midnight',
      'subtitle': 'Neo-noir Series',
      'image': pickImage(5),
    },
    {
      'rank': 2,
      'title': 'Ash Protocol',
      'subtitle': 'Sci-Fi Thriller',
      'image': pickImage(6),
    },
    {
      'rank': 3,
      'title': 'Silent Harbor',
      'subtitle': 'Mystery Film',
      'image': pickImage(7),
    },
    {
      'rank': 4,
      'title': 'Velvet Burn',
      'subtitle': 'Original Drama',
      'image': pickImage(8),
    },
    {
      'rank': 5,
      'title': 'Moon Archive',
      'subtitle': 'SF Drama',
      'image': pickImage(9),
    },
  ];

  static final List<Map<String, String>> trendingNow = [
    {
      'badge': 'NEW',
      'title': 'Night Bloom',
      'subtitle': 'Original Series',
      'image': pickImage(10),
    },
    {
      'badge': 'HOT',
      'title': 'Crimson Shore',
      'subtitle': 'Thriller Film',
      'image': pickImage(11),
    },
    {
      'badge': "EDITOR'S PICK",
      'title': 'After Silence',
      'subtitle': 'Mystery Drama',
      'image': pickImage(12),
    },
    {
      'badge': 'TRENDING',
      'title': 'Blue Corridor',
      'subtitle': 'Sci-Fi Series',
      'image': pickImage(13),
    },
    {
      'badge': 'TOP 10',
      'title': 'Last Passenger',
      'subtitle': 'Drama Film',
      'image': pickImage(14),
    },
    {
      'badge': 'NEW',
      'title': 'Neon Chamber',
      'subtitle': 'Action Series',
      'image': pickImage(15),
    },
  ];

  static final List<Map<String, String>> discoverFree = [
    {
      'title': '무료 1화 공개작',
      'subtitle': '지금 가볍게 시작하기 좋은 작품',
      'image': pickImage(16),
    },
    {
      'title': '웹툰 · 소설 기반 추천',
      'subtitle': '다음 메인 시청으로 이어지는 진입 카드',
      'image': pickImage(17),
    },
    {
      'title': '입문용 Discovery Picks',
      'subtitle': '짧게 둘러보다가 바로 유입되는 흐름',
      'image': pickImage(18),
    },
    {
      'title': 'Creator Spotlight',
      'subtitle': '가볍게 발견하고 저장하는 무료 탐색',
      'image': pickImage(19),
    },
  ];

  static const Map<String, String> marketFeatureVideo = {
    'title': 'Market',
    'cta': '마켓 보러 가기',
    'video': 'assets/videos/market/market4.mp4',
  };

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;
    final topInset = media.padding.top;
    final isMobile = screenWidth < 700;

    final heroCardHeight = isMobile ? 620.0 : 700.0;
    final heroTitleSize = isMobile ? 42.0 : 64.0;
    final heroMetaSize = isMobile ? 13.0 : 15.0;
    final heroDescSize = isMobile ? 14.0 : 16.0;

    return VisionScaffold(
      currentPath: '/',
      body: Container(
        color: const Color(0xFF050608),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: heroCardHeight + topInset + 18,
                child: Stack(
                  children: [
                    const Positioned.fill(child: _HomeTopBackground()),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, topInset + 8, 12, 10),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 900),
                          child: SizedBox(
                            height: heroCardHeight,
                            child: _MainHeroCard(
                              isMobile: isMobile,
                              heroTitleSize: heroTitleSize,
                              heroMetaSize: heroMetaSize,
                              heroDescSize: heroDescSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _SectionBlock(
              title: '계속 시청하기',
              reserveActionSpace: true,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isCompact = constraints.maxWidth < 700;
                  final cardHeight = 214.0;
                  final viewportFraction = isCompact ? 0.94 : 0.58;

                  return SizedBox(
                    height: cardHeight,
                    child: PageView.builder(
                      controller: PageController(
                        viewportFraction: viewportFraction,
                      ),
                      itemCount: continueWatching.length,
                      padEnds: false,
                      itemBuilder: (context, index) {
                        final item = continueWatching[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: _ContinueWatchingCard(item: item),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            _SectionBlock(
              title: 'Top 10 in Vision3',
              action: '순위 보기',
              onTap: () => Navigator.pushNamed(context, '/rankings'),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isCompact = constraints.maxWidth < 700;
                  final cardHeight = isCompact ? 288.0 : 336.0;
                  final viewportFraction = isCompact ? 0.48 : 0.24;

                  return SizedBox(
                    height: cardHeight,
                    child: PageView.builder(
                      controller: PageController(
                        viewportFraction: viewportFraction,
                      ),
                      itemCount: topTen.length,
                      padEnds: false,
                      itemBuilder: (context, index) {
                        final item = topTen[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: _TopTenCard(item: item),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            _SectionBlock(
              title: '지금 인기 콘텐츠',
              action: '더 보기',
              onTap: () => Navigator.pushNamed(context, '/rankings'),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isCompact = constraints.maxWidth < 700;
                  final cardHeight = isCompact ? 288.0 : 336.0;
                  final viewportFraction = isCompact ? 0.48 : 0.24;

                  return SizedBox(
                    height: cardHeight,
                    child: PageView.builder(
                      controller: PageController(
                        viewportFraction: viewportFraction,
                      ),
                      itemCount: trendingNow.length,
                      padEnds: false,
                      itemBuilder: (context, index) {
                        final item = trendingNow[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: _PosterCard(item: item),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            _SectionBlock(
              title: 'Discover Free',
              action: 'Discover 이동',
              onTap: () => Navigator.pushNamed(context, '/discover'),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isCompact = constraints.maxWidth < 700;
                  final cardHeight = isCompact ? 320.0 : 262.0;
                  final viewportFraction = isCompact ? 0.86 : 0.42;

                  return SizedBox(
                    height: cardHeight,
                    child: PageView.builder(
                      controller: PageController(
                        viewportFraction: viewportFraction,
                      ),
                      itemCount: discoverFree.length,
                      padEnds: false,
                      itemBuilder: (context, index) {
                        final item = discoverFree[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: _DiscoverFreeCard(item: item),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1280),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 38),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _SectionHeader(title: 'Market'),
                        const SizedBox(height: 18),
                        _MarketFeatureCard(
                          title: marketFeatureVideo['title']!,
                          cta: marketFeatureVideo['cta']!,
                          video: marketFeatureVideo['video']!,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MainHeroCard extends StatelessWidget {
  final bool isMobile;
  final double heroTitleSize;
  final double heroMetaSize;
  final double heroDescSize;

  const _MainHeroCard({
    required this.isMobile,
    required this.heroTitleSize,
    required this.heroMetaSize,
    required this.heroDescSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.10),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.34),
            blurRadius: 42,
            offset: Offset(0, 18),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            HomePage.heroMain['image']!,
            fit: BoxFit.cover,
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.02),
                  Color.fromRGBO(0, 0, 0, 0.10),
                  Color.fromRGBO(0, 0, 0, 0.86),
                ],
                stops: [0.0, 0.38, 1.0],
              ),
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.24),
                  Color.fromRGBO(0, 0, 0, 0.04),
                  Color.fromRGBO(0, 0, 0, 0.14),
                ],
                stops: [0.0, 0.48, 1.0],
              ),
            ),
          ),
          Positioned(
            left: 18,
            right: 18,
            bottom: 18,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 0.16),
                    ),
                    color: const Color.fromRGBO(0, 0, 0, 0.34),
                  ),
                  child: Text(
                    HomePage.heroMain['label']!,
                    style: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.90),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  HomePage.heroMain['meta']!,
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 0.78),
                    fontSize: heroMetaSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  HomePage.heroMain['title']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: heroTitleSize,
                    fontWeight: FontWeight.w800,
                    height: 0.98,
                    letterSpacing: -1.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  HomePage.heroMain['desc']!,
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 0.84),
                    fontSize: heroDescSize,
                    height: 1.55,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _HeroActionButton(
                      label: '▶ 재생',
                      onTap: () {},
                    ),
                    const SizedBox(width: 8),
                    _HeroActionButton(
                      label: '1화 무료 보기',
                      highlight: true,
                      onTap: () => Navigator.pushNamed(context, '/discover'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Expanded(
                      child: _HeroInfoTile(
                        label: 'MAIN MODE',
                        title: 'OTT First',
                        desc: '프리미엄 중심',
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: _HeroInfoTile(
                        label: 'DISCOVERY',
                        title: 'Free Entry',
                        desc: '무료 픽',
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: _HeroInfoTile(
                        label: 'EXTENSION',
                        title: 'Market',
                        desc: '세계관 확장',
                      ),
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

class _HeroActionButton extends StatelessWidget {
  final String label;
  final bool highlight;
  final VoidCallback onTap;

  const _HeroActionButton({
    required this.label,
    required this.onTap,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    final background = highlight
        ? const Color.fromRGBO(25, 182, 208, 0.20)
        : const Color.fromRGBO(255, 255, 255, 0.12);

    final borderColor = highlight
        ? const Color.fromRGBO(51, 214, 243, 0.42)
        : const Color.fromRGBO(255, 255, 255, 0.16);

    final textColor = highlight ? const Color(0xFFD7FCFF) : Colors.white;

    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          color: background,
          border: Border.all(color: borderColor),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: textColor,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _HeroInfoTile extends StatelessWidget {
  final String label;
  final String title;
  final String desc;

  const _HeroInfoTile({
    required this.label,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.12),
        ),
        color: const Color.fromRGBO(0, 0, 0, 0.28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.48),
              fontSize: 9,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            desc,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.60),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeTopBackground extends StatelessWidget {
  const _HomeTopBackground();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0A0D14),
                  Color(0xFF07090D),
                  Color(0xFF050608),
                ],
                stops: [0.0, 0.46, 1.0],
              ),
            ),
          ),
        ),
        Positioned(
          left: -120,
          top: -90,
          child: _GlowOrb(
            size: 340,
            color: Color.fromRGBO(31, 201, 232, 0.16),
          ),
        ),
        Positioned(
          right: -80,
          top: -60,
          child: _GlowOrb(
            size: 260,
            color: Color.fromRGBO(74, 112, 255, 0.14),
          ),
        ),
        Positioned(
          right: 60,
          top: 160,
          child: _GlowOrb(
            size: 220,
            color: Color.fromRGBO(255, 255, 255, 0.04),
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(10, 12, 18, 0.78),
                  Color.fromRGBO(5, 6, 8, 0.00),
                  Color(0xFF050608),
                ],
                stops: [0.0, 0.26, 1.0],
              ),
            ),
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

class _SectionBlock extends StatelessWidget {
  final String title;
  final String? action;
  final VoidCallback? onTap;
  final bool reserveActionSpace;
  final Widget child;

  const _SectionBlock({
    required this.title,
    required this.child,
    this.action,
    this.onTap,
    this.reserveActionSpace = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionHeader(
                  title: title,
                  action: action,
                  onTap: onTap,
                  reserveActionSpace: reserveActionSpace,
                ),
                const SizedBox(height: 18),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? action;
  final VoidCallback? onTap;
  final bool reserveActionSpace;

  const _SectionHeader({
    required this.title,
    this.action,
    this.onTap,
    this.reserveActionSpace = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.6,
          ),
        ),
        const Spacer(),
        if (action != null)
          InkWell(
            borderRadius: BorderRadius.circular(999),
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: const Color.fromRGBO(255, 255, 255, 0.10),
                ),
                color: const Color.fromRGBO(255, 255, 255, 0.04),
              ),
              child: Text(
                action!,
                style: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.70),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        else if (reserveActionSpace)
          const SizedBox(
            width: 92,
            height: 42,
          ),
      ],
    );
  }
}

class _ContinueWatchingCard extends StatelessWidget {
  final Map<String, String> item;

  const _ContinueWatchingCard({
    required this.item,
  });

  double _progressValue(String value) {
    final parsed = double.tryParse(value.replaceAll('%', ''));
    if (parsed == null) return 0;
    return (parsed / 100).clamp(0, 1);
  }

  @override
  Widget build(BuildContext context) {
    final progress = item['progress'] ?? '0%';
    final progressValue = _progressValue(progress);

    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: () => Navigator.pushNamed(
        context,
        item['href'] ?? '/series',
      ),
      child: Container(
        width: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: const Color.fromRGBO(255, 255, 255, 0.10),
          ),
          color: const Color.fromRGBO(255, 255, 255, 0.04),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.28),
              blurRadius: 18,
              offset: Offset(0, 10),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            SizedBox(
              width: 142,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    item['image']!,
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color.fromRGBO(0, 0, 0, 0.50),
                          Color.fromRGBO(0, 0, 0, 0.00),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12,
                    right: 12,
                    bottom: 12,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: LinearProgressIndicator(
                        value: progressValue,
                        minHeight: 6,
                        backgroundColor: const Color.fromRGBO(
                          255,
                          255,
                          255,
                          0.22,
                        ),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 0.08),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                          color: const Color.fromRGBO(255, 255, 255, 0.10),
                        ),
                      ),
                      child: Text(
                        item['badge'] ?? 'SERIES',
                        style: const TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.82),
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      item['title'] ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['subtitle'] ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.64),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item['info'] ?? '$progress 시청 완료',
                      style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.82),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item['remainText'] ?? '',
                            style: const TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.56),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            color: const Color.fromRGBO(255, 255, 255, 0.12),
                            border: Border.all(
                              color: const Color.fromRGBO(255, 255, 255, 0.12),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.play_arrow_rounded,
                                size: 16,
                                color: Colors.white,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '이어보기',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopTenCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const _TopTenCard({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.10),
        ),
        color: const Color.fromRGBO(255, 255, 255, 0.03),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            item['image'] as String,
            fit: BoxFit.cover,
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.04),
                  Color.fromRGBO(0, 0, 0, 0.16),
                  Color.fromRGBO(0, 0, 0, 0.88),
                ],
                stops: [0.0, 0.40, 1.0],
              ),
            ),
          ),
          Positioned(
            left: 14,
            top: 12,
            child: Container(
              width: 42,
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromRGBO(0, 0, 0, 0.40),
                border: Border.all(
                  color: const Color.fromRGBO(255, 255, 255, 0.16),
                ),
              ),
              child: Text(
                '${item['rank']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PosterCard extends StatelessWidget {
  final Map<String, String> item;

  const _PosterCard({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.10),
        ),
        color: const Color.fromRGBO(255, 255, 255, 0.03),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            item['image']!,
            fit: BoxFit.cover,
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.04),
                  Color.fromRGBO(0, 0, 0, 0.14),
                  Color.fromRGBO(0, 0, 0, 0.86),
                ],
                stops: [0.0, 0.40, 1.0],
              ),
            ),
          ),
          Positioned(
            left: 14,
            top: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: const Color.fromRGBO(0, 0, 0, 0.34),
                border: Border.all(
                  color: const Color.fromRGBO(255, 255, 255, 0.12),
                ),
              ),
              child: Text(
                item['badge']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DiscoverFreeCard extends StatelessWidget {
  final Map<String, String> item;

  const _DiscoverFreeCard({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.10),
        ),
        color: const Color.fromRGBO(255, 255, 255, 0.03),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            item['image']!,
            fit: BoxFit.cover,
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.66),
                  Color.fromRGBO(0, 0, 0, 0.20),
                  Color.fromRGBO(0, 0, 0, 0.58),
                ],
                stops: [0.0, 0.45, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MarketFeatureCard extends StatefulWidget {
  final String title;
  final String cta;
  final String video;

  const _MarketFeatureCard({
    required this.title,
    required this.cta,
    required this.video,
  });

  @override
  State<_MarketFeatureCard> createState() => _MarketFeatureCardState();
}

class _MarketFeatureCardState extends State<_MarketFeatureCard> {
  late final VideoPlayerController _controller;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.video);
    _initVideo();
  }

  Future<void> _initVideo() async {
    try {
      await _controller.setLooping(true);
      await _controller.setVolume(0);
      await _controller.initialize();
      await _controller.play();

      if (!mounted) return;
      setState(() {
        _isReady = true;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _isReady = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 620,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.10),
        ),
        color: const Color.fromRGBO(255, 255, 255, 0.03),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (_isReady && _controller.value.isInitialized)
            FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            )
          else
            Container(
              color: const Color(0xFF0B0F17),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2.2,
              ),
            ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.72),
                  Color.fromRGBO(0, 0, 0, 0.26),
                  Color.fromRGBO(0, 0, 0, 0.62),
                ],
                stops: [0.0, 0.45, 1.0],
              ),
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.08),
                  Color.fromRGBO(0, 0, 0, 0.16),
                  Color.fromRGBO(0, 0, 0, 0.82),
                ],
                stops: [0.0, 0.36, 1.0],
              ),
            ),
          ),
          Positioned(
            left: 22,
            right: 22,
            bottom: 22,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: const Color.fromRGBO(255, 255, 255, 0.16),
                      ),
                      color: const Color.fromRGBO(0, 0, 0, 0.30),
                    ),
                    child: const Text(
                      'WORLD EXPANSION',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      height: 0.98,
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '작품 감상을 넘어 굿즈, 세계관 확장, 팬 경험까지 연결되는 Vision3 Market 공간.',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.78),
                      fontSize: 14,
                      height: 1.55,
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    borderRadius: BorderRadius.circular(999),
                    onTap: () => Navigator.pushNamed(context, '/market'),
                    child: Container(
                      height: 46,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        color: const Color.fromRGBO(255, 255, 255, 0.12),
                        border: Border.all(
                          color: const Color.fromRGBO(255, 255, 255, 0.14),
                        ),
                      ),
                      child: Text(
                        widget.cta,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 