// lib/pages/movies_page.dart
import 'package:flutter/material.dart';
import '../data/watch_data.dart';
import 'media_shell_page.dart';

class MoviesPage extends StatelessWidget {
  final GenreKey activeGenre;

  const MoviesPage({
    super.key,
    required this.activeGenre,
  });

  @override
  Widget build(BuildContext context) {
    return MediaShellPage(
      activeGenre: activeGenre,
      mode: MediaMode.movies,
    );
  }
}