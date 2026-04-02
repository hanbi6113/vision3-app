// lib/watch/watch_theme.dart
import 'package:flutter/material.dart';
import '../data/watch_data.dart';

class WatchThemeStyle {
  final Color shell;
  final Color shellBorder;
  final Color title;
  final Color body;
  final Color accent;
  final Color chipBorder;
  final Color chipBackground;
  final Color chipText;
  final List<BoxShadow> chipShadow;
  final Color surface;

  const WatchThemeStyle({
    required this.shell,
    required this.shellBorder,
    required this.title,
    required this.body,
    required this.accent,
    required this.chipBorder,
    required this.chipBackground,
    required this.chipText,
    required this.chipShadow,
    required this.surface,
  });
}

class HallButtonStyle {
  final Color borderColor;
  final Color background;
  final Color color;
  final List<BoxShadow> boxShadow;

  const HallButtonStyle({
    required this.borderColor,
    required this.background,
    required this.color,
    this.boxShadow = const [],
  });
}

const Map<GenreKey, String> genreLabelMap = {
  GenreKey.rofan: '로판',
  GenreKey.romance: '로맨스',
  GenreKey.sf: 'SF',
  GenreKey.murim: '무협',
  GenreKey.horror: '공포',
};

final Map<GenreKey, WatchThemeStyle> themeByGenre = {
  GenreKey.rofan: const WatchThemeStyle(
    shell: Color.fromRGBO(255, 255, 255, 0.82),
    shellBorder: Color(0xFFF1D6DE),
    title: Color(0xFF6F4B67),
    body: Color(0xFF8F7186),
    accent: Color(0xFFD17FA2),
    chipBorder: Color(0xFFF7BFD6),
    chipBackground: Color.fromRGBO(255, 255, 255, 0.75),
    chipText: Color(0xFFC76790),
    chipShadow: [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.08),
        blurRadius: 4,
        offset: Offset(0, 1),
      ),
    ],
    surface: Color(0xFFFFF9FC),
  ),
  GenreKey.romance: const WatchThemeStyle(
    shell: Color.fromRGBO(255, 255, 255, 0.84),
    shellBorder: Color(0xFFE7D9D7),
    title: Color(0xFF4F3A3F),
    body: Color(0xFF746166),
    accent: Color(0xFFB07A80),
    chipBorder: Color(0xFFE5D4D6),
    chipBackground: Color.fromRGBO(255, 255, 255, 0.78),
    chipText: Color(0xFFB07A80),
    chipShadow: [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.08),
        blurRadius: 4,
        offset: Offset(0, 1),
      ),
    ],
    surface: Color(0xFFFFFAFA),
  ),
  GenreKey.sf: const WatchThemeStyle(
    shell: Colors.transparent,
    shellBorder: Color(0xFF1B4D63),
    title: Color(0xFFE8F7FF),
    body: Color(0xFF8FB4C3),
    accent: Color(0xFF8AEFFF),
    chipBorder: Color(0xFF2AA8CF),
    chipBackground: Colors.transparent,
    chipText: Color(0xFF8AEFFF),
    chipShadow: [
      BoxShadow(
        color: Color.fromRGBO(42, 168, 207, 0.12),
        blurRadius: 20,
        offset: Offset(0, 0),
      ),
    ],
    surface: Color(0xFF091520),
  ),
  GenreKey.murim: const WatchThemeStyle(
    shell: Color.fromRGBO(247, 243, 232, 0.86),
    shellBorder: Color(0xFFDDD4BF),
    title: Color(0xFF413A2C),
    body: Color(0xFF716958),
    accent: Color(0xFF8C8F5F),
    chipBorder: Color(0xFFC7B78B),
    chipBackground: Color.fromRGBO(245, 239, 222, 0.85),
    chipText: Color(0xFF7D6A3D),
    chipShadow: [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.08),
        blurRadius: 4,
        offset: Offset(0, 1),
      ),
    ],
    surface: Color(0xFFFAF6EE),
  ),
  GenreKey.horror: const WatchThemeStyle(
    shell: Color.fromRGBO(13, 11, 12, 0.92),
    shellBorder: Color(0xFF24181B),
    title: Color(0xFFF1EBEB),
    body: Color(0xFF968A8C),
    accent: Color(0xFFC97882),
    chipBorder: Color(0xFF6C3139),
    chipBackground: Color.fromRGBO(18, 13, 15, 0.90),
    chipText: Color(0xFFD7B2B8),
    chipShadow: [
      BoxShadow(
        color: Color.fromRGBO(108, 49, 57, 0.16),
        blurRadius: 18,
        offset: Offset(0, 0),
      ),
    ],
    surface: Color(0xFF0F0B0C),
  ),
};

final Map<GenreKey, HallButtonStyle> hallButtonStyleByGenre = {
  GenreKey.rofan: const HallButtonStyle(
    borderColor: Color(0xFFF6BFD8),
    background: Color(0xFFFFF0F7),
    color: Color(0xFFC76790),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(199, 103, 144, 0.10),
        blurRadius: 2,
        offset: Offset(0, 1),
      ),
    ],
  ),
  GenreKey.romance: const HallButtonStyle(
    borderColor: Color(0xFFE6D2D6),
    background: Color(0xFFF8F1F2),
    color: Color(0xFFA86F74),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(168, 111, 116, 0.08),
        blurRadius: 2,
        offset: Offset(0, 1),
      ),
    ],
  ),
  GenreKey.sf: const HallButtonStyle(
    borderColor: Color(0xFF2AA8CF),
    background: Colors.transparent,
    color: Color(0xFF8AEFFF),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(42, 168, 207, 0.14),
        blurRadius: 24,
        offset: Offset(0, 0),
      ),
    ],
  ),
  GenreKey.murim: const HallButtonStyle(
    borderColor: Color(0xFFC6BA92),
    background: Color(0xFFF2ECDC),
    color: Color(0xFF695C37),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(105, 92, 55, 0.10),
        blurRadius: 2,
        offset: Offset(0, 1),
      ),
    ],
  ),
  GenreKey.horror: const HallButtonStyle(
    borderColor: Color(0xFF6F2A34),
    background: Color(0xFF140D0F),
    color: Color(0xFFE7C3C8),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(111, 42, 52, 0.18),
        blurRadius: 22,
        offset: Offset(0, 0),
      ),
    ],
  ),
};

const Map<GenreKey, String> protagonistRoleByGenre = {
  GenreKey.rofan: '황궁의 균열 한가운데 선 핵심 인물',
  GenreKey.romance: '감정선의 중심을 이끄는 주인공',
  GenreKey.sf: '시스템의 균열을 추적하는 중심 인물',
  GenreKey.murim: '강호의 흐름을 바꾸는 검객',
  GenreKey.horror: '불길한 사건의 중심에 선 생존자',
};

const Map<GenreKey, String> protagonistDescByGenre = {
  GenreKey.rofan: '권력과 감정 사이에서 흔들리면서도 끝내 자신의 선택으로 서사를 끌고 가는 인물이야.',
  GenreKey.romance: '조용한 표정과 작은 선택들로 관계의 온도를 바꾸는, 가장 중요한 감정 축이 되는 인물이야.',
  GenreKey.sf: '차가운 구조 안에서도 인간적인 판단을 놓지 않는 인물이라 작품의 긴장감을 가장 크게 만들어.',
  GenreKey.murim: '절제된 감정과 무게감 있는 행동으로 세계관의 중심을 세우는 주인공이야.',
  GenreKey.horror: '설명되지 않는 공포 속에서 끝까지 버티며 진실에 가까워지는 시선을 가진 인물이야.',
};

const Map<GenreKey, String> writerNameByGenre = {
  GenreKey.rofan: '서윤하',
  GenreKey.romance: '한지우',
  GenreKey.sf: '윤시온',
  GenreKey.murim: '백도현',
  GenreKey.horror: '차유진',
};

const Map<GenreKey, String> writerTitleByGenre = {
  GenreKey.rofan: '황궁 관계선과 감정의 밀도를 설계한 메인 작가',
  GenreKey.romance: '조용한 여운과 감정의 결을 쌓아가는 메인 작가',
  GenreKey.sf: '미래 시스템과 서사 구조를 설계한 메인 작가',
  GenreKey.murim: '검의 흐름과 강호 서사를 정리한 메인 작가',
  GenreKey.horror: '정적과 심리적 긴장감을 설계한 메인 작가',
};

const Map<GenreKey, String> writerDescByGenre = {
  GenreKey.rofan: '관계의 시선, 권력의 균열, 로맨틱한 긴장을 한 화면 안에서 동시에 작동하게 만드는 스타일이 특징이야.',
  GenreKey.romance: '큰 사건보다 감정의 결, 타이밍, 말하지 못한 마음의 흐름을 밀도 있게 보여주는 스타일이야.',
  GenreKey.sf: '설정 설명에만 머무르지 않고 시스템과 인물의 선택을 연결해서 서사를 밀어가는 타입이야.',
  GenreKey.murim: '묵직한 대사와 절제된 장면 운영으로 세계관의 결을 단단하게 만드는 스타일이야.',
  GenreKey.horror: '강한 자극보다 여백, 정적, 불길한 암시로 공포를 오래 남게 만드는 연출 감각이 강해.',
};