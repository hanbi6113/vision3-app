// lib/pages/series_page.dart
import 'package:flutter/material.dart';
import '../data/watch_data.dart';
import 'media_shell_page.dart';

class SeriesPage extends StatelessWidget {
  final GenreKey activeGenre;

  const SeriesPage({
    super.key,
    required this.activeGenre,
  });

  @override
  Widget build(BuildContext context) {
    return MediaShellPage(
      activeGenre: activeGenre,
      mode: MediaMode.series,
    );
  }
}