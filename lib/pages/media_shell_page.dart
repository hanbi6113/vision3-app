// lib/pages/media_shell_page.dart
import 'package:flutter/material.dart';

import '../data/watch_data.dart';
import '../widgets/vision_scaffold.dart';
import 'discover_page.dart';

enum MediaMode { series, movies, discover }

class MediaShellPage extends StatelessWidget {
  final GenreKey activeGenre;
  final MediaMode mode;

  const MediaShellPage({
    super.key,
    required this.activeGenre,
    required this.mode,
  });

  static const Map<GenreKey, _GenreCopy> _seriesCopy = {
    GenreKey.rofan: _GenreCopy(
      hallName: 'Royal Fantasy Drama Hall',
      hallDesc: '황궁의 긴장감과 감정선을 더 화려하게 보여주는 프리미엄 드라마 상영관.',
      continueLabel: '궁정 드라마 이어보기',
      trendingLabel: '지금 가장 주목받는 궁정 드라마',
      shelfA: '오늘의 황궁 드라마',
      shelfB: '관계선이 강한 드라마',
      editorLabel: '황궁 드라마 하이라이트',
      upcomingLabel: '곧 공개될 궁정 드라마',
    ),
    GenreKey.romance: _GenreCopy(
      hallName: 'Romance Drama Hall',
      hallDesc: '조용한 감정선과 여운이 오래 남는 작품을 모은 프리미엄 로맨스 드라마 관.',
      continueLabel: '감정선 드라마 이어보기',
      trendingLabel: '오늘의 로맨스 드라마 인기작',
      shelfA: '여운이 남는 드라마',
      shelfB: '지금 많이 보는 관계 서사',
      editorLabel: '로맨스 드라마 하이라이트',
      upcomingLabel: '곧 공개될 로맨스 드라마',
    ),
    GenreKey.sf: _GenreCopy(
      hallName: 'Science Fiction Drama Hall',
      hallDesc: '미래 도시와 시스템 서사를 더 강하게 몰입해서 보는 프리미엄 SF 드라마 관.',
      continueLabel: '시스템 드라마 이어보기',
      trendingLabel: '지금 가장 반응이 큰 SF 드라마',
      shelfA: 'System Drama Picks',
      shelfB: 'Archive Drama Selection',
      editorLabel: 'Signal Drama Highlight',
      upcomingLabel: '곧 공개될 미래 드라마',
    ),
    GenreKey.murim: _GenreCopy(
      hallName: 'Murim Drama Hall',
      hallDesc: '문파와 검객의 흐름을 더 묵직하게 보여주는 프리미엄 무협 드라마 상영관.',
      continueLabel: '강호 드라마 이어보기',
      trendingLabel: '지금 가장 강한 무협 드라마',
      shelfA: '문파 드라마 추천',
      shelfB: '검객 서사 모음',
      editorLabel: '강호 드라마 하이라이트',
      upcomingLabel: '곧 공개될 무협 드라마',
    ),
    GenreKey.horror: _GenreCopy(
      hallName: 'Horror Drama Hall',
      hallDesc: '불길한 정적과 심리적 긴장을 더 진하게 체감하게 하는 프리미엄 공포 드라마 관.',
      continueLabel: '이상 징후 드라마 이어보기',
      trendingLabel: 'Tonight’s Horror Drama Picks',
      shelfA: '가장 반응이 큰 공포 드라마',
      shelfB: '불길한 드라마 큐레이션',
      editorLabel: '심야 드라마 하이라이트',
      upcomingLabel: '곧 공개될 공포 드라마',
    ),
  };

  static const Map<GenreKey, _GenreCopy> _movieCopy = {
    GenreKey.rofan: _GenreCopy(
      hallName: 'Royal Fantasy Movie Hall',
      hallDesc: '황궁의 긴장감과 감정선을 더 화려하게 보여주는 프리미엄 영화 상영관.',
      continueLabel: '황궁 영화 이어보기',
      trendingLabel: '지금 가장 주목받는 궁정 영화',
      shelfA: '오늘의 황궁 영화',
      shelfB: '관계선이 강한 영화',
      editorLabel: '황궁 영화 하이라이트',
      upcomingLabel: '곧 공개될 궁정 영화',
    ),
    GenreKey.romance: _GenreCopy(
      hallName: 'Romance Movie Hall',
      hallDesc: '조용한 감정선과 여운이 오래 남는 작품을 모은 프리미엄 로맨스 영화 관.',
      continueLabel: '감정선 영화 이어보기',
      trendingLabel: '오늘의 로맨스 영화 인기작',
      shelfA: '여운이 남는 영화',
      shelfB: '지금 많이 보는 감정 영화',
      editorLabel: '로맨스 영화 하이라이트',
      upcomingLabel: '곧 공개될 로맨스 영화',
    ),
    GenreKey.sf: _GenreCopy(
      hallName: 'Science Fiction Movie Hall',
      hallDesc: '미래 도시와 시스템 서사를 더 강하게 몰입해서 보는 프리미엄 SF 영화 관.',
      continueLabel: '시스템 영화 이어보기',
      trendingLabel: '지금 가장 반응이 큰 SF 영화',
      shelfA: 'System Movie Picks',
      shelfB: 'Archive Movie Selection',
      editorLabel: 'Signal Movie Highlight',
      upcomingLabel: '곧 공개될 미래 영화',
    ),
    GenreKey.murim: _GenreCopy(
      hallName: 'Murim Movie Hall',
      hallDesc: '문파와 검객의 흐름을 더 묵직하게 보여주는 프리미엄 무협 영화 상영관.',
      continueLabel: '강호 영화 이어보기',
      trendingLabel: '지금 가장 강한 무협 영화',
      shelfA: '문파 영화 추천',
      shelfB: '검객 서사 모음',
      editorLabel: '강호 영화 하이라이트',
      upcomingLabel: '곧 공개될 무협 영화',
    ),
    GenreKey.horror: _GenreCopy(
      hallName: 'Horror Movie Hall',
      hallDesc: '불길한 정적과 심리적 긴장을 더 진하게 체감하게 하는 프리미엄 공포 영화 관.',
      continueLabel: '이상 징후 영화 이어보기',
      trendingLabel: 'Tonight’s Horror Movie Picks',
      shelfA: '가장 반응이 큰 공포 영화',
      shelfB: '불길한 영화 큐레이션',
      editorLabel: '심야 영화 하이라이트',
      upcomingLabel: '곧 공개될 공포 영화',
    ),
  };

  String get _path {
    switch (mode) {
      case MediaMode.series:
        return '/series';
      case MediaMode.movies:
        return '/movies';
      case MediaMode.discover:
        return '/discover';
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = DiscoverPage.discoverData[activeGenre]!;
    final copy = (mode == MediaMode.movies
        ? _movieCopy
        : _seriesCopy)[activeGenre]!;
    final theme = _ShellTheme.fromContent(activeGenre, content);
    final currentImages = DiscoverPage.genreImages[activeGenre]!;

    final routeBase = mode == MediaMode.movies
        ? 'movies'
        : mode == MediaMode.discover
        ? 'discover'
        : 'series';
    final hallPath = '/$routeBase/${genreToPath(activeGenre)}';

    final watchMode = mode == MediaMode.movies
        ? WatchMode.movies
        : WatchMode.series;
    final watchSlug = watchEntrySlugByMode[watchMode]?[activeGenre];
    final freeDiscoverSlug =
        (discoverFreeSlugByGenre[activeGenre]?.isNotEmpty ?? false)
        ? discoverFreeSlugByGenre[activeGenre]!.first
        : watchEntrySlugByMode[WatchMode.series]?[activeGenre];

    final watchHref = watchSlug != null
        ? '/watch/$watchSlug?returnTo=${Uri.encodeComponent(hallPath)}'
        : hallPath;
    final freeEpisodeHref = freeDiscoverSlug != null
        ? '/watch/$freeDiscoverSlug?returnTo=${Uri.encodeComponent(hallPath)}'
        : hallPath;

    final posterImages = List<String>.generate(
      8,
      (index) => currentImages[index % currentImages.length],
    );

    final continueItems = _buildContinueItems(
      activeGenre: activeGenre,
      mode: mode,
      content: content,
      images: currentImages,
      href: watchHref,
    );

    return VisionScaffold(
      currentPath: _path,
      body: Stack(
        children: [
          Positioned.fill(
            child: _GenreBackdrop(genre: activeGenre, theme: theme),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1480),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _GenreTabs(
                        activeGenre: activeGenre,
                        mode: mode,
                        theme: theme,
                      ),
                      const SizedBox(height: 18),
                      _HeroCard(
                        image: currentImages.first,
                        theme: theme,
                        watchHref: watchHref,
                        freeHref: freeEpisodeHref,
                      ),
                      const SizedBox(height: 24),
                      _SectionTitle(
                        title: copy.continueLabel,
                        subtitle: content.heroNote,
                        theme: theme,
                      ),
                      const SizedBox(height: 14),
                      _ContinueWatchingShelf(
                        items: continueItems,
                        theme: theme,
                      ),
                      const SizedBox(height: 26),
                      _SectionTitle(
                        title: copy.trendingLabel,
                        subtitle: mode == MediaMode.series
                            ? 'Top Drama'
                            : 'Top Movie',
                        theme: theme,
                      ),
                      const SizedBox(height: 14),
                      _HorizontalPosterOnlyShelf(
                        images: List<String>.generate(
                          5,
                          (index) =>
                              currentImages[index % currentImages.length],
                        ),
                        theme: theme,
                        posterWidth: 210,
                        posterAspectRatio: 2 / 3,
                      ),
                      const SizedBox(height: 26),
                      _SectionTitle(
                        title: copy.shelfA,
                        subtitle: content.projectPoint,
                        theme: theme,
                      ),
                      const SizedBox(height: 14),
                      _HorizontalPosterOnlyShelf(
                        images: posterImages,
                        theme: theme,
                        posterWidth: 250,
                        posterAspectRatio: 2 / 3,
                      ),
                      const SizedBox(height: 26),
                      _SectionTitle(
                        title: copy.shelfB,
                        subtitle: content.storyTitle,
                        theme: theme,
                      ),
                      const SizedBox(height: 14),
                      _HorizontalPosterOnlyShelf(
                        images: List<String>.generate(
                          6,
                          (index) =>
                              currentImages[(index + 1) % currentImages.length],
                        ),
                        theme: theme,
                        posterWidth: 250,
                        posterAspectRatio: 2 / 3,
                      ),
                      const SizedBox(height: 26),
                      _SectionTitle(
                        title: copy.editorLabel,
                        subtitle: content.projectStatus,
                        theme: theme,
                      ),
                      const SizedBox(height: 14),
                      _HorizontalPosterOnlyShelf(
                        images: [
                          currentImages.length > 1
                              ? currentImages[1]
                              : currentImages.first,
                          ...posterImages.take(3),
                        ],
                        theme: theme,
                        posterWidth: 250,
                        posterAspectRatio: 2 / 3,
                      ),
                      const SizedBox(height: 26),
                      _SectionTitle(
                        title: copy.upcomingLabel,
                        subtitle: mode == MediaMode.series
                            ? 'Upcoming Drama Slate'
                            : 'Upcoming Movie Slate',
                        theme: theme,
                      ),
                      const SizedBox(height: 14),
                      _HorizontalPosterOnlyShelf(
                        images: posterImages.take(4).toList(),
                        theme: theme,
                        posterWidth: 230,
                        posterAspectRatio: 2 / 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<_ContinueWatchingItem> _buildContinueItems({
    required GenreKey activeGenre,
    required MediaMode mode,
    required DiscoverGenreContent content,
    required List<String> images,
    required String href,
  }) {
    final genreName = genreLabel(activeGenre);
    final progressValues = [0.78, 0.64, 0.52, 0.41, 0.33];

    return List<_ContinueWatchingItem>.generate(5, (index) {
      final progress = progressValues[index % progressValues.length];
      final image = images[index % images.length];

      if (mode == MediaMode.movies) {
        final watchedMinutes = (progress * 120).round();
        final remainMinutes = (120 - watchedMinutes).clamp(12, 99);

        return _ContinueWatchingItem(
          badge: 'MOVIE',
          title: index == 0
              ? content.storyTitle
              : '$genreName Selection ${index + 1}',
          subtitle: '$genreName Hall · 시네마틱 큐레이션',
          info: '$watchedMinutes분 시청 완료',
          remainText: '$remainMinutes분 남음',
          progress: progress,
          image: image,
          href: href,
        );
      }

      final episode = index + 2;
      final remainMinutes = (58 - (progress * 30).round()).clamp(8, 34);

      return _ContinueWatchingItem(
        badge: 'SERIES',
        title: index == 0
            ? content.storyTitle
            : '$genreName Episode Track ${index + 1}',
        subtitle: 'EP $episode · $genreName Drama',
        info: '${(progress * 100).round()}% 시청 완료',
        remainText: '$remainMinutes분 남음',
        progress: progress,
        image: image,
        href: href,
      );
    });
  }
}

class _GenreCopy {
  final String hallName;
  final String hallDesc;
  final String continueLabel;
  final String trendingLabel;
  final String shelfA;
  final String shelfB;
  final String editorLabel;
  final String upcomingLabel;

  const _GenreCopy({
    required this.hallName,
    required this.hallDesc,
    required this.continueLabel,
    required this.trendingLabel,
    required this.shelfA,
    required this.shelfB,
    required this.editorLabel,
    required this.upcomingLabel,
  });
}

class _ContinueWatchingItem {
  final String badge;
  final String title;
  final String subtitle;
  final String info;
  final String remainText;
  final double progress;
  final String image;
  final String href;

  const _ContinueWatchingItem({
    required this.badge,
    required this.title,
    required this.subtitle,
    required this.info,
    required this.remainText,
    required this.progress,
    required this.image,
    required this.href,
  });
}

class _ShellTheme {
  final Color pageBg;
  final Color glowA;
  final Color glowB;
  final Color border;
  final Color surface;
  final Color surfaceStrong;
  final Color accentText;
  final Color titleColor;
  final Color bodyColor;
  final Color activeChipBg;
  final Color activeChipBorder;
  final Color activeChipText;
  final Color inactiveChipBorder;
  final Color inactiveChipText;

  final List<Color> heroButtonGradient;
  final Color heroButtonText;
  final Color heroSecondaryButtonBg;
  final Color heroSecondaryButtonBorder;
  final Color heroSecondaryButtonText;
  final List<Color> heroPhotoOverlay;

  const _ShellTheme({
    required this.pageBg,
    required this.glowA,
    required this.glowB,
    required this.border,
    required this.surface,
    required this.surfaceStrong,
    required this.accentText,
    required this.titleColor,
    required this.bodyColor,
    required this.activeChipBg,
    required this.activeChipBorder,
    required this.activeChipText,
    required this.inactiveChipBorder,
    required this.inactiveChipText,
    required this.heroButtonGradient,
    required this.heroButtonText,
    required this.heroSecondaryButtonBg,
    required this.heroSecondaryButtonBorder,
    required this.heroSecondaryButtonText,
    required this.heroPhotoOverlay,
  });

  factory _ShellTheme.fromContent(
    GenreKey genre,
    DiscoverGenreContent content,
  ) {
    switch (genre) {
      case GenreKey.rofan:
        return _ShellTheme(
          pageBg: content.pageBg,
          glowA: content.glowA,
          glowB: content.glowB,
          border: content.border,
          surface: content.surface,
          surfaceStrong: content.surfaceStrong,
          accentText: content.accentText,
          titleColor: content.titleColor,
          bodyColor: content.bodyColor,
          activeChipBg: content.surfaceStrong,
          activeChipBorder: content.accentText.withOpacity(0.55),
          activeChipText: content.titleColor,
          inactiveChipBorder: content.border.withOpacity(0.8),
          inactiveChipText: content.bodyColor,
          heroButtonGradient: const [Color(0xFFFF9CC3), Color(0xFFFFC7DF)],
          heroButtonText: Colors.white,
          heroSecondaryButtonBg: const Color.fromRGBO(255, 255, 255, 0.80),
          heroSecondaryButtonBorder: const Color(0xFFF6C8DA),
          heroSecondaryButtonText: const Color(0xFFBB7391),
          heroPhotoOverlay: const [
            Color.fromRGBO(255, 250, 251, 0.92),
            Color.fromRGBO(255, 250, 251, 0.28),
            Color.fromRGBO(255, 250, 251, 0.08),
          ],
        );
      case GenreKey.romance:
        return _ShellTheme(
          pageBg: content.pageBg,
          glowA: content.glowA,
          glowB: content.glowB,
          border: content.border,
          surface: content.surface,
          surfaceStrong: content.surfaceStrong,
          accentText: content.accentText,
          titleColor: content.titleColor,
          bodyColor: content.bodyColor,
          activeChipBg: content.surfaceStrong,
          activeChipBorder: content.accentText.withOpacity(0.55),
          activeChipText: content.titleColor,
          inactiveChipBorder: content.border.withOpacity(0.8),
          inactiveChipText: content.bodyColor,
          heroButtonGradient: const [Color(0xFFB7797F), Color(0xFFD4A29A)],
          heroButtonText: Colors.white,
          heroSecondaryButtonBg: const Color.fromRGBO(255, 255, 255, 0.78),
          heroSecondaryButtonBorder: const Color(0xFFE4D2D3),
          heroSecondaryButtonText: const Color(0xFF8D6B70),
          heroPhotoOverlay: const [
            Color.fromRGBO(250, 246, 246, 0.84),
            Color.fromRGBO(250, 246, 246, 0.22),
            Color.fromRGBO(250, 246, 246, 0.06),
          ],
        );
      case GenreKey.sf:
        return _ShellTheme(
          pageBg: content.pageBg,
          glowA: content.glowA,
          glowB: content.glowB,
          border: content.border,
          surface: content.surface,
          surfaceStrong: content.surfaceStrong,
          accentText: content.accentText,
          titleColor: content.titleColor,
          bodyColor: content.bodyColor,
          activeChipBg: content.surfaceStrong,
          activeChipBorder: content.accentText.withOpacity(0.55),
          activeChipText: content.titleColor,
          inactiveChipBorder: content.border.withOpacity(0.8),
          inactiveChipText: content.bodyColor,
          heroButtonGradient: const [Color(0x142AA8CF), Color(0x142AA8CF)],
          heroButtonText: const Color(0xFF8AEFFF),
          heroSecondaryButtonBg: Colors.transparent,
          heroSecondaryButtonBorder: const Color(0xFF214F63),
          heroSecondaryButtonText: const Color(0xFF7EA6B8),
          heroPhotoOverlay: const [
            Color.fromRGBO(8, 19, 29, 0.48),
            Color.fromRGBO(8, 19, 29, 0.18),
            Color.fromRGBO(8, 19, 29, 0.04),
          ],
        );
      case GenreKey.murim:
        return _ShellTheme(
          pageBg: content.pageBg,
          glowA: content.glowA,
          glowB: content.glowB,
          border: content.border,
          surface: content.surface,
          surfaceStrong: content.surfaceStrong,
          accentText: content.accentText,
          titleColor: content.titleColor,
          bodyColor: content.bodyColor,
          activeChipBg: content.surfaceStrong,
          activeChipBorder: content.accentText.withOpacity(0.55),
          activeChipText: content.titleColor,
          inactiveChipBorder: content.border.withOpacity(0.8),
          inactiveChipText: content.bodyColor,
          heroButtonGradient: const [Color(0xFF7C8B5D), Color(0xFFB79C64)],
          heroButtonText: const Color(0xFF1C2015),
          heroSecondaryButtonBg: const Color(0xFFF6F1E3),
          heroSecondaryButtonBorder: const Color(0xFFCDBF98),
          heroSecondaryButtonText: const Color(0xFF7A6840),
          heroPhotoOverlay: const [
            Color.fromRGBO(248, 243, 231, 0.68),
            Color.fromRGBO(248, 243, 231, 0.20),
            Color.fromRGBO(248, 243, 231, 0.06),
          ],
        );
      case GenreKey.horror:
        return _ShellTheme(
          pageBg: content.pageBg,
          glowA: content.glowA,
          glowB: content.glowB,
          border: content.border,
          surface: content.surface,
          surfaceStrong: content.surfaceStrong,
          accentText: content.accentText,
          titleColor: content.titleColor,
          bodyColor: content.bodyColor,
          activeChipBg: content.surfaceStrong,
          activeChipBorder: content.accentText.withOpacity(0.55),
          activeChipText: content.titleColor,
          inactiveChipBorder: content.border.withOpacity(0.8),
          inactiveChipText: content.bodyColor,
          heroButtonGradient: const [Color(0xFF5A141F), Color(0xFF9B3040)],
          heroButtonText: Colors.white,
          heroSecondaryButtonBg: const Color(0xFF120E0F),
          heroSecondaryButtonBorder: const Color(0xFF4D2D33),
          heroSecondaryButtonText: const Color(0xFFD0B0B5),
          heroPhotoOverlay: const [
            Color.fromRGBO(16, 12, 13, 0.60),
            Color.fromRGBO(16, 12, 13, 0.24),
            Color.fromRGBO(16, 12, 13, 0.08),
          ],
        );
    }
  }
}

class _GenreBackdrop extends StatelessWidget {
  final GenreKey genre;
  final _ShellTheme theme;

  const _GenreBackdrop({required this.genre, required this.theme});

  @override
  Widget build(BuildContext context) {
    if (genre == GenreKey.rofan) {
      return Stack(
        children: const [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFFF9FD),
                    Color(0xFFFFF3FB),
                    Color(0xFFFDF5FF),
                    Color(0xFFF8FBFF),
                  ],
                  stops: [0.0, 0.28, 0.62, 1.0],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(-0.15, -0.85),
                  radius: 1.15,
                  colors: [
                    Color(0x2EFFE1F0),
                    Color(0x18F7D7FF),
                    Colors.transparent,
                  ],
                  stops: [0.0, 0.28, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            left: -220,
            top: -360,
            child: _BackdropGlow(size: 760, color: Color(0x3DFFD5E8)),
          ),
          Positioned(
            left: 80,
            top: -170,
            child: _BackdropGlow(size: 460, color: Color(0x24FFF7FB)),
          ),
          Positioned(
            right: -210,
            top: -230,
            child: _BackdropGlow(size: 700, color: Color(0x36EAF2FF)),
          ),
          Positioned(
            left: 110,
            bottom: -140,
            child: _BackdropGlow(size: 380, color: Color(0x2EDFD9FF)),
          ),
          Positioned(
            right: 40,
            bottom: -120,
            child: _BackdropGlow(size: 360, color: Color(0x26D8F3FF)),
          ),
        ],
      );
    }

    return Stack(
      children: [
        Positioned.fill(child: ColoredBox(color: theme.pageBg)),
        Positioned(
          top: -120,
          left: -80,
          child: _BackdropGlow(size: 320, color: theme.glowA),
        ),
        Positioned(
          top: -60,
          right: -40,
          child: _BackdropGlow(size: 260, color: theme.glowB),
        ),
      ],
    );
  }
}

class _BackdropGlow extends StatelessWidget {
  final double size;
  final Color color;

  const _BackdropGlow({required this.size, required this.color});

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

// lib/pages/media_shell_page.dart
class _GenreTabs extends StatelessWidget {
  final GenreKey activeGenre;
  final MediaMode mode;
  final _ShellTheme theme;

  const _GenreTabs({
    required this.activeGenre,
    required this.mode,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: GenreKey.values.map((genre) {
        final active = genre == activeGenre;
        final routeBase = switch (mode) {
          MediaMode.series => '/series',
          MediaMode.movies => '/movies',
          MediaMode.discover => '/discover',
        };

        return InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: () => Navigator.pushReplacementNamed(
            context,
            '$routeBase/${genreToPath(genre)}',
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: active ? theme.activeChipBg : Colors.transparent,
              border: Border.all(
                color: active
                    ? theme.activeChipBorder
                    : theme.inactiveChipBorder,
                width: active ? 1.4 : 1,
              ),
              boxShadow: active
                  ? [
                      BoxShadow(
                        color: theme.accentText.withOpacity(0.20),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ]
                  : null,
            ),
            child: Text(
              genreLabel(genre),
              style: TextStyle(
                color: active ? theme.activeChipText : theme.inactiveChipText,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _HeroCard extends StatelessWidget {
  final String image;
  final _ShellTheme theme;
  final String watchHref;
  final String freeHref;

  const _HeroCard({
    required this.image,
    required this.theme,
    required this.watchHref,
    required this.freeHref,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 560,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: theme.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(image, fit: BoxFit.cover),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: theme.heroPhotoOverlay,
                stops: const [0.12, 0.48, 1.0],
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 24,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _ActionButton(
                    label: '재생',
                    theme: theme,
                    primary: true,
                    onTap: () => Navigator.pushNamed(context, watchHref),
                  ),
                  _ActionButton(
                    label: '1화 무료 보기',
                    theme: theme,
                    primary: false,
                    onTap: () => Navigator.pushNamed(context, freeHref),
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

class _ActionButton extends StatelessWidget {
  final String label;
  final _ShellTheme theme;
  final bool primary;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.theme,
    required this.primary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = primary
        ? BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: theme.heroButtonGradient,
            ),
            boxShadow: [
              BoxShadow(
                color: theme.heroButtonGradient.last.withOpacity(0.28),
                blurRadius: 22,
                offset: const Offset(0, 10),
              ),
            ],
          )
        : BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: theme.heroSecondaryButtonBg,
            border: Border.all(color: theme.heroSecondaryButtonBorder),
          );

    final textColor = primary
        ? theme.heroButtonText
        : theme.heroSecondaryButtonText;

    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
        decoration: decoration,
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final _ShellTheme theme;

  const _SectionTitle({
    required this.title,
    required this.subtitle,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subtitle,
          style: TextStyle(
            color: theme.accentText,
            fontSize: 12,
            fontWeight: FontWeight.w800,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: theme.titleColor,
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _ContinueWatchingShelf extends StatelessWidget {
  final List<_ContinueWatchingItem> items;
  final _ShellTheme theme;

  const _ContinueWatchingShelf({required this.items, required this.theme});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 214,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return _ContinueWatchingCard(item: items[index], theme: theme);
        },
      ),
    );
  }
}

class _ContinueWatchingCard extends StatelessWidget {
  final _ContinueWatchingItem item;
  final _ShellTheme theme;

  const _ContinueWatchingCard({required this.item, required this.theme});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: () => Navigator.pushNamed(context, item.href),
      child: Container(
        width: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: theme.border),
          color: theme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 18,
              offset: const Offset(0, 10),
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
                  Image.asset(item.image, fit: BoxFit.cover),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.45),
                          Colors.transparent,
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
                        value: item.progress,
                        minHeight: 6,
                        backgroundColor: Colors.white.withOpacity(0.26),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          theme.accentText,
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
                        color: theme.surfaceStrong,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: theme.border),
                      ),
                      child: Text(
                        item.badge,
                        style: TextStyle(
                          color: theme.accentText,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: theme.titleColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: theme.bodyColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.info,
                      style: TextStyle(
                        color: theme.accentText,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.remainText,
                            style: TextStyle(
                              color: theme.bodyColor,
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
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: theme.heroButtonGradient,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.play_arrow_rounded,
                                size: 16,
                                color: theme.heroButtonText,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '이어보기',
                                style: TextStyle(
                                  color: theme.heroButtonText,
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

class _HorizontalPosterOnlyShelf extends StatelessWidget {
  final List<String> images;
  final _ShellTheme theme;
  final double posterWidth;
  final double posterAspectRatio;

  const _HorizontalPosterOnlyShelf({
    required this.images,
    required this.theme,
    required this.posterWidth,
    required this.posterAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    final posterHeight = posterWidth / posterAspectRatio;

    return SizedBox(
      height: posterHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          return SizedBox(
            width: posterWidth,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: theme.border),
                color: theme.surfaceStrong,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(images[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
