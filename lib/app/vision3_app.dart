// lib/app/vision3_app.dart
import 'package:flutter/material.dart';
import '../data/watch_data.dart';
import '../pages/home_page.dart';
import '../pages/continue_watching_page.dart';
import '../pages/rankings_page.dart';
import '../pages/discover_page.dart';
import '../pages/media_shell_page.dart';
import '../pages/watch_page.dart';
import '../pages/writer_page.dart';
import '../pages/market_page.dart';

class Vision3App extends StatelessWidget {
  const Vision3App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vision3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF050608),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name ?? '/');

        if (uri.path == '/') {
          return MaterialPageRoute(
            builder: (_) => const HomePage(),
          );
        }

        if (uri.path == '/continue-watching') {
          return MaterialPageRoute(
            builder: (_) => const ContinueWatchingPage(),
          );
        }

        if (uri.path == '/rankings') {
          return MaterialPageRoute(
            builder: (_) => const RankingsPage(),
          );
        }

        if (uri.path == '/discover') {
          return MaterialPageRoute(
            builder: (_) => const DiscoverPage(activeGenre: GenreKey.rofan),
          );
        }

        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'discover') {
          final genre = genreFromString(uri.pathSegments[1]) ?? GenreKey.rofan;
          return MaterialPageRoute(
            builder: (_) => DiscoverPage(activeGenre: genre),
          );
        }

        if (uri.path == '/movies') {
          return MaterialPageRoute(
            builder: (_) => const MediaShellPage(
              activeGenre: GenreKey.rofan,
              mode: MediaMode.movies,
            ),
          );
        }

        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'movies') {
          final genre = genreFromString(uri.pathSegments[1]) ?? GenreKey.rofan;
          return MaterialPageRoute(
            builder: (_) => MediaShellPage(
              activeGenre: genre,
              mode: MediaMode.movies,
            ),
          );
        }

        if (uri.path == '/series') {
          return MaterialPageRoute(
            builder: (_) => const MediaShellPage(
              activeGenre: GenreKey.rofan,
              mode: MediaMode.series,
            ),
          );
        }

        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'series') {
          final genre = genreFromString(uri.pathSegments[1]) ?? GenreKey.rofan;
          return MaterialPageRoute(
            builder: (_) => MediaShellPage(
              activeGenre: genre,
              mode: MediaMode.series,
            ),
          );
        }

        if (uri.path == '/market') {
          return MaterialPageRoute(
            builder: (_) => const MarketPage(),
          );
        }

        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'watch') {
          final slug = uri.pathSegments[1];
          final title = getWatchTitleBySlug(slug);

          if (title != null) {
            return MaterialPageRoute(
              builder: (_) => WatchPage(
                title: title,
                episodeNumber:
                    int.tryParse(uri.queryParameters['episode'] ?? ''),
                returnTo: uri.queryParameters['returnTo'],
              ),
            );
          }
        }

        if (uri.pathSegments.length == 3 &&
            uri.pathSegments.first == 'watch' &&
            uri.pathSegments[2] == 'writer') {
          final slug = uri.pathSegments[1];
          final title = getWatchTitleBySlug(slug);

          if (title != null) {
            return MaterialPageRoute(
              builder: (_) => WriterPage(
                title: title,
                episodeNumber:
                    int.tryParse(uri.queryParameters['episode'] ?? ''),
                returnTo: uri.queryParameters['returnTo'],
              ),
            );
          }
        }

        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      },
    );
  }
}