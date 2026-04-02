// lib/pages/writer_page.dart
import 'package:flutter/material.dart';
import '../data/watch_data.dart';
import '../watch/watch_background.dart';
import '../watch/watch_theme.dart';

class WriterPage extends StatelessWidget {
  final WatchTitle title;
  final String? returnTo;
  final int? episodeNumber;

  const WriterPage({
    super.key,
    required this.title,
    this.returnTo,
    this.episodeNumber,
  });

  List<WatchTitle> get writerWorks {
    final sameGenre = watchCatalog.where((item) => item.genre == title.genre).toList();
    sameGenre.sort((a, b) {
      final aScore = a.slug == title.slug ? 5 : 0;
      final bScore = b.slug == title.slug ? 5 : 0;
      return bScore.compareTo(aScore);
    });
    return sameGenre;
  }

  @override
  Widget build(BuildContext context) {
    final theme = themeByGenre[title.genre]!;
    final hallButtonStyle = hallButtonStyleByGenre[title.genre]!;
    final writerName = writerNameByGenre[title.genre]!;
    final writerDesc = writerDescByGenre[title.genre]!;

    return Scaffold(
      body: Stack(
        children: [
          WatchBackground(genre: title.genre),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1240),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _WriterBackButton(
                        style: hallButtonStyle,
                        onTap: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            Navigator.pushNamed(
                              context,
                              returnTo ?? '/watch/${title.slug}',
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 28),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              '$writerName 작가',
                              style: TextStyle(
                                color: theme.title,
                                fontSize: 36,
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 18),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 740),
                              child: Text(
                                writerDesc,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: theme.body,
                                  fontSize: 15,
                                  height: 1.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 42),
                      Center(
                        child: Text(
                          '작가 작품',
                          style: TextStyle(
                            color: theme.title,
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount = 1;
                          if (constraints.maxWidth >= 1100) {
                            crossAxisCount = 3;
                          } else if (constraints.maxWidth >= 720) {
                            crossAxisCount = 2;
                          }

                          return GridView.builder(
                            itemCount: writerWorks.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 1.45,
                            ),
                            itemBuilder: (context, index) {
                              final work = writerWorks[index];
                              return InkWell(
                                borderRadius: BorderRadius.circular(26),
                                onTap: () {
                                  Navigator.pushNamed(context, '/watch/${work.slug}');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: theme.shell,
                                    borderRadius: BorderRadius.circular(26),
                                    border: Border.all(color: theme.shellBorder),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.asset(
                                        assetFromPublicPath(work.coverImage),
                                        fit: BoxFit.cover,
                                      ),
                                      const DecoratedBox(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color.fromRGBO(0, 0, 0, 0.08),
                                              Color.fromRGBO(0, 0, 0, 0.22),
                                              Color.fromRGBO(0, 0, 0, 0.86),
                                            ],
                                            stops: [0.0, 0.42, 1.0],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 20,
                                        right: 20,
                                        bottom: 20,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              work.title,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              work.subtitle,
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
                              );
                            },
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

class _WriterBackButton extends StatelessWidget {
  final HallButtonStyle style;
  final VoidCallback onTap;

  const _WriterBackButton({
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
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: style.borderColor),
          color: style.background,
          boxShadow: style.boxShadow,
        ),
        child: Text(
          '← 이전으로',
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