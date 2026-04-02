// lib/pages/watch_page.dart
import 'package:flutter/material.dart';
import '../data/watch_data.dart';
import '../watch/watch_background.dart';
import '../watch/watch_theme.dart';

class WatchPage extends StatelessWidget {
  final WatchTitle title;
  final int? episodeNumber;
  final String? returnTo;

  const WatchPage({
    super.key,
    required this.title,
    this.episodeNumber,
    this.returnTo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = themeByGenre[title.genre]!;
    final hallButtonStyle = hallButtonStyleByGenre[title.genre]!;
    final selectedEpisode = getSelectedEpisode(
      title.episodes,
      episodeNumber,
    );
    final currentIndex = title.episodes.indexWhere(
      (episode) => episode.number == selectedEpisode.number,
    );

    final nextEpisodes = currentIndex >= 0
        ? title.episodes.skip(currentIndex + 1).take(3).toList()
        : title.episodes.skip(1).take(3).toList();

    final protagonistName =
        title.cast.isNotEmpty ? title.cast.first : '${title.title} Lead';

    final protagonistImage =
        protagonistImageByName[protagonistName] ?? 'assets/images/main5.png';

    final writerName = writerNameByGenre[title.genre]!;
    final writerTitle = writerTitleByGenre[title.genre]!;
    final writerDesc = writerDescByGenre[title.genre]!;
    final genreLabel = genreLabelMap[title.genre]!;
    final hallRoute = '/${title.mode.name}/${genreToPath(title.genre)}';
    final backRoute = returnTo ?? hallRoute;

    final recommendedMovieTitles = title.mode == WatchMode.movies
        ? title.relatedSlugs
            .map(getWatchTitleBySlug)
            .whereType<WatchTitle>()
            .where((item) => item.mode == WatchMode.movies && item.slug != title.slug)
            .toList()
        : <WatchTitle>[];

    final fallbackMovieTitles =
        title.mode == WatchMode.movies && recommendedMovieTitles.length < 3
            ? watchCatalog
                .where(
                  (item) =>
                      item.mode == WatchMode.movies &&
                      item.slug != title.slug &&
                      !recommendedMovieTitles.any((picked) => picked.slug == item.slug),
                )
                .take(3 - recommendedMovieTitles.length)
                .toList()
            : <WatchTitle>[];

    final movieRecommendations = [
      ...recommendedMovieTitles,
      ...fallbackMovieTitles,
    ].take(3).toList();

    return Scaffold(
      body: Stack(
        children: [
          WatchBackground(genre: title.genre),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1560),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          _HallPillButton(
                            label: '← 이전으로',
                            style: hallButtonStyle,
                            onTap: () {
                              if (Navigator.canPop(context)) {
                                Navigator.pop(context);
                              } else {
                                Navigator.pushNamed(context, backRoute);
                              }
                            },
                          ),
                          _ThemeChip(
                            text: '$genreLabel Hall',
                            theme: theme,
                          ),
                          _ThemeChip(
                            text: selectedEpisode.number == 1
                                ? 'Episode 01'
                                : '${selectedEpisode.number}화',
                            theme: theme,
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        title.meta,
                        style: TextStyle(
                          color: theme.accent,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        title.title,
                        style: TextStyle(
                          color: theme.title,
                          fontSize: 38,
                          fontWeight: FontWeight.w800,
                          height: 1.06,
                        ),
                      ),
                      const SizedBox(height: 20),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final wide = constraints.maxWidth >= 1200;

                          if (wide) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 155,
                                  child: _MainWatchColumn(
                                    title: title,
                                    selectedEpisode: selectedEpisode,
                                    theme: theme,
                                    hallButtonStyle: hallButtonStyle,
                                    protagonistName: protagonistName,
                                    protagonistImage: protagonistImage,
                                    writerName: writerName,
                                    writerTitle: writerTitle,
                                    writerDesc: writerDesc,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  flex: 45,
                                  child: _RightInfoColumn(
                                    title: title,
                                    selectedEpisode: selectedEpisode,
                                    nextEpisodes: nextEpisodes,
                                    movieRecommendations: movieRecommendations,
                                    theme: theme,
                                    hallButtonStyle: hallButtonStyle,
                                  ),
                                ),
                              ],
                            );
                          }

                          return Column(
                            children: [
                              _MainWatchColumn(
                                title: title,
                                selectedEpisode: selectedEpisode,
                                theme: theme,
                                hallButtonStyle: hallButtonStyle,
                                protagonistName: protagonistName,
                                protagonistImage: protagonistImage,
                                writerName: writerName,
                                writerTitle: writerTitle,
                                writerDesc: writerDesc,
                              ),
                              const SizedBox(height: 16),
                              _RightInfoColumn(
                                title: title,
                                selectedEpisode: selectedEpisode,
                                nextEpisodes: nextEpisodes,
                                movieRecommendations: movieRecommendations,
                                theme: theme,
                                hallButtonStyle: hallButtonStyle,
                              ),
                            ],
                          );
                        },
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
}

class _MainWatchColumn extends StatelessWidget {
  final WatchTitle title;
  final WatchEpisode selectedEpisode;
  final WatchThemeStyle theme;
  final HallButtonStyle hallButtonStyle;
  final String protagonistName;
  final String protagonistImage;
  final String writerName;
  final String writerTitle;
  final String writerDesc;

  const _MainWatchColumn({
    required this.title,
    required this.selectedEpisode,
    required this.theme,
    required this.hallButtonStyle,
    required this.protagonistName,
    required this.protagonistImage,
    required this.writerName,
    required this.writerTitle,
    required this.writerDesc,
  });

  @override
  Widget build(BuildContext context) {
    final currentWatchPath = '/watch/${title.slug}?episode=${selectedEpisode.number}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _GlassPanel(
          theme: theme,
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        assetFromPublicPath(selectedEpisode.image),
                        fit: BoxFit.cover,
                      ),
                      Container(color: Colors.black.withOpacity(0.22)),
                      const Center(
                        child: Icon(
                          Icons.play_circle_fill_rounded,
                          size: 88,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 20, 22, 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: title.badges
                          .map((badge) => _ThemeChip(text: badge, theme: theme))
                          .toList(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      selectedEpisode.title,
                      style: TextStyle(
                        color: theme.title,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      selectedEpisode.summary,
                      style: TextStyle(
                        color: theme.body,
                        fontSize: 15,
                        height: 1.7,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _MetaPill(label: title.rating, theme: theme),
                        _MetaPill(label: title.year, theme: theme),
                        _MetaPill(label: selectedEpisode.duration, theme: theme),
                        _MetaPill(label: title.status, theme: theme),
                        _MetaPill(label: title.point, theme: theme),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      title.tagline,
                      style: TextStyle(
                        color: theme.accent,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      title.description,
                      style: TextStyle(
                        color: theme.body,
                        fontSize: 15,
                        height: 1.8,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _SolidActionButton(
                          label: '작품 정보 보기',
                          style: hallButtonStyle,
                          onTap: () {},
                        ),
                        _OutlineActionButton(
                          label: '작가 페이지',
                          style: hallButtonStyle,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/watch/${title.slug}/writer?episode=${selectedEpisode.number}&returnTo=${Uri.encodeComponent(currentWatchPath)}',
                            );
                          },
                        ),
                        _OutlineActionButton(
                          label: '전체 에피소드',
                          style: hallButtonStyle,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _GlassPanel(
          theme: theme,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '주요 인물',
                style: TextStyle(
                  color: theme.accent,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image.asset(
                      protagonistImage,
                      width: 112,
                      height: 136,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          protagonistName,
                          style: TextStyle(
                            color: theme.title,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          protagonistRoleByGenre[title.genre]!,
                          style: TextStyle(
                            color: theme.accent,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          protagonistDescByGenre[title.genre]!,
                          style: TextStyle(
                            color: theme.body,
                            fontSize: 14,
                            height: 1.7,
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
        const SizedBox(height: 16),
        _GlassPanel(
          theme: theme,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Writer',
                style: TextStyle(
                  color: theme.accent,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                writerName,
                style: TextStyle(
                  color: theme.title,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                writerTitle,
                style: TextStyle(
                  color: theme.accent,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                writerDesc,
                style: TextStyle(
                  color: theme.body,
                  fontSize: 14,
                  height: 1.8,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RightInfoColumn extends StatelessWidget {
  final WatchTitle title;
  final WatchEpisode selectedEpisode;
  final List<WatchEpisode> nextEpisodes;
  final List<WatchTitle> movieRecommendations;
  final WatchThemeStyle theme;
  final HallButtonStyle hallButtonStyle;

  const _RightInfoColumn({
    required this.title,
    required this.selectedEpisode,
    required this.nextEpisodes,
    required this.movieRecommendations,
    required this.theme,
    required this.hallButtonStyle,
  });

  @override
  Widget build(BuildContext context) {
    final currentWatchPath = '/watch/${title.slug}?episode=${selectedEpisode.number}';

    return Column(
      children: [
        _GlassPanel(
          theme: theme,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Episode',
                style: TextStyle(
                  color: theme.accent,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '${selectedEpisode.number}화',
                style: TextStyle(
                  color: theme.title,
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                selectedEpisode.title,
                style: TextStyle(
                  color: theme.title,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                selectedEpisode.summary,
                style: TextStyle(
                  color: theme.body,
                  fontSize: 14,
                  height: 1.7,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        if (title.mode == WatchMode.series)
          _GlassPanel(
            theme: theme,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Next Episodes',
                  style: TextStyle(
                    color: theme.accent,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '이어서 볼 다음 화',
                  style: TextStyle(
                    color: theme.title,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 14),
                if (nextEpisodes.isEmpty)
                  Text(
                    '이어서 볼 다음 화가 아직 없어.',
                    style: TextStyle(
                      color: theme.body,
                      fontSize: 14,
                      height: 1.7,
                    ),
                  )
                else
                  Column(
                    children: nextEpisodes.map((episode) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _EpisodeCard(
                          title: title,
                          episode: episode,
                          theme: theme,
                          hallButtonStyle: hallButtonStyle,
                          currentWatchPath: currentWatchPath,
                        ),
                      );
                    }).toList(),
                  ),
              ],
            ),
          )
        else
          _GlassPanel(
            theme: theme,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recommended Movies',
                            style: TextStyle(
                              color: theme.accent,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '같이 보면 좋은 영화',
                            style: TextStyle(
                              color: theme.title,
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _OutlineActionButton(
                      label: '더 보기',
                      style: hallButtonStyle,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/${title.mode.name}/${genreToPath(title.genre)}',
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  children: movieRecommendations.map((relatedTitle) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: _MovieRecommendationCard(
                        title: relatedTitle,
                        theme: theme,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/watch/${relatedTitle.slug}?returnTo=${Uri.encodeComponent(currentWatchPath)}',
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _EpisodeCard extends StatelessWidget {
  final WatchTitle title;
  final WatchEpisode episode;
  final WatchThemeStyle theme;
  final HallButtonStyle hallButtonStyle;
  final String currentWatchPath;

  const _EpisodeCard({
    required this.title,
    required this.episode,
    required this.theme,
    required this.hallButtonStyle,
    required this.currentWatchPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.surface.withOpacity(0.32),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: theme.shellBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(22)),
            child: Image.asset(
              assetFromPublicPath(episode.image),
              width: 112,
              height: 112,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${episode.number}화',
                    style: TextStyle(
                      color: theme.accent,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    episode.title,
                    style: TextStyle(
                      color: theme.title,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    episode.summary,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: theme.body,
                      fontSize: 13,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        episode.duration,
                        style: TextStyle(
                          color: theme.body,
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      _HallPillButton(
                        label: '${episode.number}화 재생',
                        style: hallButtonStyle,
                        compact: true,
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/watch/${title.slug}?episode=${episode.number}&returnTo=${Uri.encodeComponent(currentWatchPath)}',
                          );
                        },
                      ),
                    ],
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

class _MovieRecommendationCard extends StatelessWidget {
  final WatchTitle title;
  final WatchThemeStyle theme;
  final VoidCallback onTap;

  const _MovieRecommendationCard({
    required this.title,
    required this.theme,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: theme.shellBorder),
          color: theme.shell,
        ),
        child: AspectRatio(
          aspectRatio: 3 / 4,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                assetFromPublicPath(title.coverImage),
                fit: BoxFit.cover,
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.04),
                      Color.fromRGBO(0, 0, 0, 0.18),
                      Color.fromRGBO(0, 0, 0, 0.88),
                    ],
                    stops: [0.0, 0.42, 1.0],
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
                    border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.12)),
                    color: const Color.fromRGBO(0, 0, 0, 0.35),
                  ),
                  child: const Text(
                    'MOVIE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 18,
                right: 18,
                bottom: 18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title.subtitle,
                      style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.72),
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

class _GlassPanel extends StatelessWidget {
  final WatchThemeStyle theme;
  final Widget child;
  final EdgeInsetsGeometry padding;

  const _GlassPanel({
    required this.theme,
    required this.child,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: theme.shell,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: theme.shellBorder),
      ),
      child: child,
    );
  }
}

class _ThemeChip extends StatelessWidget {
  final String text;
  final WatchThemeStyle theme;

  const _ThemeChip({
    required this.text,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.chipBackground,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: theme.chipBorder),
        boxShadow: theme.chipShadow,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: theme.chipText,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.1,
        ),
      ),
    );
  }
}

class _MetaPill extends StatelessWidget {
  final String label;
  final WatchThemeStyle theme;

  const _MetaPill({
    required this.label,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: theme.surface.withOpacity(0.45),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: theme.shellBorder),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: theme.title,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _HallPillButton extends StatelessWidget {
  final String label;
  final HallButtonStyle style;
  final VoidCallback onTap;
  final bool compact;

  const _HallPillButton({
    required this.label,
    required this.style,
    required this.onTap,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 12 : 16,
          vertical: compact ? 8 : 11,
        ),
        decoration: BoxDecoration(
          color: style.background,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: style.borderColor),
          boxShadow: style.boxShadow,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: style.color,
            fontSize: compact ? 11 : 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _SolidActionButton extends StatelessWidget {
  final String label;
  final HallButtonStyle style;
  final VoidCallback onTap;

  const _SolidActionButton({
    required this.label,
    required this.style,
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
          color: style.background,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: style.borderColor),
          boxShadow: style.boxShadow,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: style.color,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _OutlineActionButton extends StatelessWidget {
  final String label;
  final HallButtonStyle style;
  final VoidCallback onTap;

  const _OutlineActionButton({
    required this.label,
    required this.style,
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
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: style.borderColor),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: style.color,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

String assetFromPublicPath(String path) {
  if (path.startsWith('/')) {
    return 'assets$path';
  }
  return path;
}