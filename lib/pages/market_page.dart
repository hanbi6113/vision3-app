// lib/pages/market_page.dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../widgets/vision_scaffold.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  static const List<MarketVideoItem> sponsorVideos = [
    MarketVideoItem(
      id: 1,
      brand: 'Atelier North',
      title: 'Scene-driven Brand Story',
      desc: '작품 감도와 잘 어울리는 프리미엄 라이프스타일 파트너 영상.',
      video: 'assets/videos/market/market1.mp4',
      href: 'https://example.com/partner-1',
      tag: 'Sponsored',
    ),
    MarketVideoItem(
      id: 2,
      brand: 'Lumière Lab',
      title: 'Visual Mood Campaign',
      desc: '짧은 장면 안에서 무드와 브랜드 이미지를 함께 보여주는 파트너 필름.',
      video: 'assets/videos/market/market2.mp4',
      href: 'https://example.com/partner-2',
      tag: 'Partner',
    ),
    MarketVideoItem(
      id: 3,
      brand: 'Noir Frame',
      title: 'Cinematic Collection',
      desc: 'OTT 메인 무드와 자연스럽게 이어지는 시네마틱 브랜드 영상.',
      video: 'assets/videos/market/market3.mp4',
      href: 'https://example.com/partner-3',
      tag: 'Sponsored',
    ),
    MarketVideoItem(
      id: 4,
      brand: 'Silent Form',
      title: 'Minimal Story Ad',
      desc: '과하게 광고 같지 않고 장면처럼 스며드는 미니멀 스폰서 콘텐츠.',
      video: 'assets/videos/market/market4.mp4',
      href: 'https://example.com/partner-4',
      tag: 'Partner',
    ),
    MarketVideoItem(
      id: 5,
      brand: 'Blue Current',
      title: 'Drop Highlight',
      desc: '새로운 드롭과 브랜드 톤을 세로 영상으로 빠르게 보여주는 피드형 콘텐츠.',
      video: 'assets/videos/market/market5.mp4',
      href: 'https://example.com/partner-5',
      tag: 'Sponsored',
    ),
    MarketVideoItem(
      id: 6,
      brand: 'Velour Note',
      title: 'Brand Mood Reel',
      desc: '작품 감상 후 자연스럽게 이어지는 브랜드 무드 릴스.',
      video: 'assets/videos/market/market6.mp4',
      href: 'https://example.com/partner-6',
      tag: 'Partner',
    ),
    MarketVideoItem(
      id: 7,
      brand: 'Frame Archive',
      title: 'Visual Sponsorship',
      desc: '포스터와 설정집 감도의 비주얼을 영상 중심으로 연결한 파트너 존.',
      video: 'assets/videos/market/market7.mp4',
      href: 'https://example.com/partner-7',
      tag: 'Sponsored',
    ),
    MarketVideoItem(
      id: 8,
      brand: 'Gloss Edition',
      title: 'Premium Story Feed',
      desc: '짧은 영상 안에 브랜드 무드와 세계관 소비를 같이 담은 피드.',
      video: 'assets/videos/market/market8.mp4',
      href: 'https://example.com/partner-8',
      tag: 'Partner',
    ),
    MarketVideoItem(
      id: 9,
      brand: 'Night Vessel',
      title: 'Curated Partner Film',
      desc: '마켓 안에서도 OTT 톤이 깨지지 않도록 정리한 큐레이션형 영상 카드.',
      video: 'assets/videos/market/market9.mp4',
      href: 'https://example.com/partner-9',
      tag: 'Sponsored',
    ),
    MarketVideoItem(
      id: 10,
      brand: 'Mono Signal',
      title: 'Featured Sponsor Story',
      desc: '브랜드 소개보다 영상 몰입을 먼저 주고, 관심이 생기면 외부 사이트로 이동시키는 구조.',
      video: 'assets/videos/market/market10.mp4',
      href: 'https://example.com/partner-10',
      tag: 'Featured',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return VisionScaffold(
      currentPath: '/market',
      body: Container(
        color: const Color(0xFF050608),
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: sponsorVideos.length,
          itemBuilder: (context, index) {
            final item = sponsorVideos[index];
            final isLast = index == sponsorVideos.length - 1;

            return _MarketReelSection(
              item: item,
              showScrollHint: !isLast,
            );
          },
        ),
      ),
    );
  }
}

class MarketVideoItem {
  final int id;
  final String brand;
  final String title;
  final String desc;
  final String video;
  final String href;
  final String tag;

  const MarketVideoItem({
    required this.id,
    required this.brand,
    required this.title,
    required this.desc,
    required this.video,
    required this.href,
    required this.tag,
  });
}

class _MarketReelSection extends StatefulWidget {
  final MarketVideoItem item;
  final bool showScrollHint;

  const _MarketReelSection({
    required this.item,
    required this.showScrollHint,
  });

  @override
  State<_MarketReelSection> createState() => _MarketReelSectionState();
}

class _MarketReelSectionState extends State<_MarketReelSection> {
  late final VideoPlayerController _bgController;
  late final VideoPlayerController _cardController;

  @override
  void initState() {
    super.initState();

    _bgController = VideoPlayerController.asset(widget.item.video)
      ..setLooping(true)
      ..setVolume(0)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
          _bgController.play();
        }
      });

    _cardController = VideoPlayerController.asset(widget.item.video)
      ..setLooping(true)
      ..setVolume(0)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
          _cardController.play();
        }
      });
  }

  @override
  void dispose() {
    _bgController.dispose();
    _cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: _bgController.value.isInitialized
              ? FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _bgController.value.size.width,
                    height: _bgController.value.size.height,
                    child: VideoPlayer(_bgController),
                  ),
                )
              : Container(color: Colors.black),
        ),

        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.12),
                  Color.fromRGBO(0, 0, 0, 0.22),
                  Color.fromRGBO(0, 0, 0, 0.62),
                  Color.fromRGBO(0, 0, 0, 0.90),
                ],
                stops: [0.0, 0.28, 0.68, 1.0],
              ),
            ),
          ),
        ),

        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topCenter,
                radius: 1.0,
                colors: [
                  Color.fromRGBO(92, 132, 255, 0.14),
                  Colors.transparent,
                ],
                stops: [0.0, 0.45],
              ),
            ),
          ),
        ),

        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: IgnorePointer(
            child: Container(
              height: 110,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.55),
                    Color.fromRGBO(0, 0, 0, 0.0),
                  ],
                ),
              ),
            ),
          ),
        ),

        SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 430),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(
                            color: const Color.fromRGBO(255, 255, 255, 0.10),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.45),
                              blurRadius: 80,
                              offset: Offset(0, 30),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: AspectRatio(
                          aspectRatio: 9 / 16,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              _cardController.value.isInitialized
                                  ? FittedBox(
                                      fit: BoxFit.cover,
                                      child: SizedBox(
                                        width: _cardController.value.size.width,
                                        height: _cardController.value.size.height,
                                        child: VideoPlayer(_cardController),
                                      ),
                                    )
                                  : Container(color: Colors.black),

                              Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromRGBO(0, 0, 0, 0.04),
                                      Color.fromRGBO(0, 0, 0, 0.14),
                                      Color.fromRGBO(0, 0, 0, 0.82),
                                    ],
                                    stops: [0.0, 0.34, 1.0],
                                  ),
                                ),
                              ),

                              Positioned(
                                left: 16,
                                top: 16,
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    _Badge(
                                      text: widget.item.tag,
                                      borderColor:
                                          const Color.fromRGBO(255, 255, 255, 0.15),
                                      backgroundColor:
                                          const Color.fromRGBO(0, 0, 0, 0.35),
                                      textColor:
                                          const Color.fromRGBO(255, 255, 255, 0.90),
                                    ),
                                    const _Badge(
                                      text: 'Brand Story',
                                      borderColor:
                                          Color.fromRGBO(34, 211, 238, 0.30),
                                      backgroundColor:
                                          Color.fromRGBO(34, 211, 238, 0.15),
                                      textColor: Color.fromRGBO(207, 250, 254, 1),
                                    ),
                                  ],
                                ),
                              ),

                              Positioned(
                                right: 16,
                                bottom: 24,
                                child: Column(
                                  children: const [
                                    _ActionCircle(icon: Icons.favorite_border_rounded),
                                    SizedBox(height: 14),
                                    _ActionCircle(icon: Icons.star_border_rounded),
                                    SizedBox(height: 14),
                                    _ActionCircle(icon: Icons.north_east_rounded),
                                  ],
                                ),
                              ),

                              Positioned(
                                left: 20,
                                right: 20,
                                bottom: 20,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 54),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.item.brand,
                                        style: const TextStyle(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 0.72),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        widget.item.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.w700,
                                          height: 1.15,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        widget.item.desc,
                                        style: const TextStyle(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 0.70),
                                          fontSize: 14,
                                          height: 1.7,
                                        ),
                                      ),
                                      const SizedBox(height: 18),
                                      Wrap(
                                        spacing: 10,
                                        runSpacing: 10,
                                        children: [
                                          _PrimaryButton(
                                            label: '사이트 이동',
                                            onTap: () {},
                                          ),
                                          _PrimaryButton(
                                            label: '더 알아보기',
                                            onTap: () {},
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
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        if (widget.showScrollHint)
          const Positioned(
            bottom: 18,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'SCROLL DOWN',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.45),
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 3.0,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;

  const _Badge({
    required this.text,
    required this.borderColor,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: borderColor),
        color: backgroundColor,
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.4,
        ),
      ),
    );
  }
}

class _ActionCircle extends StatelessWidget {
  final IconData icon;

  const _ActionCircle({
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.15),
        ),
        color: const Color.fromRGBO(0, 0, 0, 0.35),
      ),
      child: Icon(
        icon,
        color: const Color.fromRGBO(255, 255, 255, 0.90),
        size: 22,
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _PrimaryButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: const Color.fromRGBO(255, 255, 255, 0.12),
          ),
          color: const Color.fromRGBO(255, 255, 255, 0.10),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}