// lib/pages/discover_page.dart
import 'package:flutter/material.dart';

import '../data/watch_data.dart';
import '../widgets/vision_scaffold.dart';

class DiscoverPage extends StatelessWidget {
  final GenreKey activeGenre;

  const DiscoverPage({
    super.key,
    required this.activeGenre,
  });

  static const Map<GenreKey, List<String>> genreImages = {
    GenreKey.rofan: [
      'assets/images/img1.jpg',
      'assets/images/img2.jpg',
      'assets/images/img3.jpg',
      'assets/images/img4.jpg',
    ],
    GenreKey.romance: [
      'assets/images/img5.jpg',
      'assets/images/img6.jpg',
      'assets/images/img7.jpg',
      'assets/images/img8.jpg',
    ],
    GenreKey.sf: [
      'assets/images/img9.jpg',
      'assets/images/img10.jpg',
      'assets/images/img11.jpg',
      'assets/images/img12.jpg',
    ],
    GenreKey.murim: [
      'assets/images/img13.jpg',
      'assets/images/img14.jpg',
      'assets/images/img15.jpg',
      'assets/images/img16.jpg',
    ],
    GenreKey.horror: [
      'assets/images/img17.jpg',
      'assets/images/img18.jpg',
      'assets/images/img19.jpg',
      'assets/images/img20.jpg',
    ],
  };

  static const List<String> freeCtas = [
    '1화 무료 보기',
    '무료 시작',
    '지금 보기',
    '입문하기',
  ];

  static const Map<GenreKey, DiscoverGenreContent> discoverData = {
    GenreKey.rofan: DiscoverGenreContent(
      label: '로판',
      english: 'Royal Fantasy',
      heroEyebrow: 'Royal Fantasy',
      heroTitle: '화려한 세계 안에서 가장 위험한 감정이 시작된다',
      heroDesc: '궁정의 권력과 정략 관계, 그리고 숨겨진 진심까지. 로판 장르를 가볍게 시작할 수 있도록 정리한 무료 입문 페이지야.',
      heroNote: '화려한 세계관 속 치명적인 관계',
      protagonistName: '세라핀 벨루아',
      protagonistRole: '몰락 직전 공작가의 장녀',
      protagonistDesc: '냉정해 보이지만 끝내 자기 사람을 버리지 못하는 인물.',
      protagonistTags: ['궁정 서사', '정략 관계', '감정 절제'],
      storyTitle: '서사 설명',
      storyDesc: '계약과 선택, 그리고 감정을 숨긴 두 사람이 서로의 약한 지점을 먼저 알아보게 되는 이야기.',
      storyBeats: ['EP 01 계약의 밤'],
      stats: [DiscoverStat(label: 'Weekly Uploads', value: '124', desc: '이번 주 새롭게 공개된 로판 작품')],
      projectEyebrow: 'Featured Title',
      projectTitle: 'The Contract of Winter Rose',
      projectDesc: '계약으로 시작됐지만 점점 더 운명처럼 뒤틀리는 대표 로판 작품.',
      projectEpisode: 'EP 06 · 가면무도회 직전',
      projectStatus: '지금 가장 주목받는 회차',
      projectPoint: '계약으로 시작된 관계가 바뀌는 순간',
      projectVisual: 'royal gradient',
      notes: [DiscoverNote(label: 'Highlight', title: '시선 하나로 분위기가 바뀌는 순간', desc: '설명보다 공기와 눈빛이 먼저 감정을 전하는 장면들이 강하다.')],
      actions: ['신규 로판 작품 등록'],
      panels: [DiscoverPanel(tag: 'Tone Design', title: '궁정 텐션 보드', desc: '권력과 로맨스가 공존하는 대표 장면들.', visual: 'royal hall')],
      pageBg: Color(0xFFFFF8FC),
      glowA: Color.fromRGBO(255, 196, 224, 0.34),
      glowB: Color.fromRGBO(213, 233, 255, 0.28),
      border: Color(0xFFF0DCE6),
      surface: Color.fromRGBO(255, 255, 255, 0.78),
      surfaceStrong: Color.fromRGBO(255, 255, 255, 0.92),
      accentText: Color(0xFFC76790),
      accentTextDark: Color(0xFF1B0F1F),
      heroGradient: [Color(0xFFFCEAF3), Color(0xFFFADBE9), Color(0xFFF7B4CD)],
      cardGradient1: [Color(0xFFFDF2F7), Color(0xFFF6DCE8), Color(0xFFEFC0D5)],
      cardGradient2: [Color(0xFFFDF4F8), Color(0xFFF8E2EB), Color(0xFFF1C8D9)],
      cardGradient3: [Color(0xFFFEF6FA), Color(0xFFF7E5EE), Color(0xFFF0CFDE)],
      titleColor: Color(0xFF5B3A4A),
      bodyColor: Color(0xFF866978),
      chipBorder: Color(0xFFF1C9D9),
      chipBg: Color.fromRGBO(255, 255, 255, 0.90),
      chipText: Color(0xFFC76790),
      secondaryChipBorder: Color(0xFFF3D4E1),
      secondaryChipBg: Color.fromRGBO(255, 250, 252, 0.96),
      secondaryChipText: Color(0xFFB96B8B),
      primaryBtnBg: Color(0xFFFFA0C8),
      primaryBtnText: Colors.white,
      secondaryBtnBorder: Color(0xFFF6C8DA),
      secondaryBtnText: Color(0xFFBB7391),
      infoBoxBorder: Color(0xFFF1D8E4),
      infoBoxBg: Color(0xFFFFFBFD),
      infoBoxText: Color(0xFFA56F86),
    ),
    GenreKey.romance: DiscoverGenreContent(
      label: '로맨스',
      english: 'Romance',
      heroEyebrow: 'Romance',
      heroTitle: '가까워지기 전의 망설임까지 설레게 만드는 이야기',
      heroDesc: '재회, 거리감, 늦은 고백처럼 조용하지만 오래 남는 감정선을 가진 작품들을 가볍게 시작할 수 있게 모아뒀어.',
      heroNote: '조용하지만 깊게 스며드는 로맨스',
      protagonistName: '서윤하',
      protagonistRole: '출판사 편집자',
      protagonistDesc: '끝났다고 생각했던 관계가 다시 눈앞에 나타나면서 하루가 달라지기 시작한다.',
      protagonistTags: ['재회 로맨스', '감정선 중심', '시선의 온도'],
      storyTitle: '서사 설명',
      storyDesc: '익숙해서 더 조심스러운 관계가 천천히 다시 움직이기 시작하는 이야기.',
      storyBeats: ['EP 01 다시 마주친 오후'],
      stats: [DiscoverStat(label: 'New Stories', value: '96', desc: '이번 주 공개된 로맨스 작품')],
      projectEyebrow: 'Featured Title',
      projectTitle: 'The Moment We Stayed',
      projectDesc: '대사보다 침묵과 거리감이 더 설레는 대표 로맨스.',
      projectEpisode: 'EP 12 · 고백 직전',
      projectStatus: '지금 가장 많은 반응을 얻는 회차',
      projectPoint: '말하지 못한 감정이 가장 크게 들리는 순간',
      projectVisual: 'romance gradient',
      notes: [DiscoverNote(label: 'Highlight', title: '가까워지기 직전의 떨림', desc: '관계가 확실해지기 전의 미묘한 공기가 가장 설렌다.')],
      actions: ['신규 로맨스 작품 등록'],
      panels: [DiscoverPanel(tag: 'Emotion Edit', title: '관계도 정리', desc: '인물 사이의 감정 변화가 잘 드러나는 장면들.', visual: 'emotion map')],
      pageBg: Color(0xFFFAF6F2),
      glowA: Color.fromRGBO(234, 213, 216, 0.42),
      glowB: Color.fromRGBO(241, 221, 212, 0.32),
      border: Color(0xFFE8D7D8),
      surface: Color.fromRGBO(255, 255, 255, 0.78),
      surfaceStrong: Color.fromRGBO(255, 255, 255, 0.90),
      accentText: Color(0xFFB07A80),
      accentTextDark: Color(0xFF2C1F22),
      heroGradient: [Color(0xFFF6ECEA), Color(0xFFEEDCDA), Color(0xFFD8B0AB)],
      cardGradient1: [Color(0xFFF8EFED), Color(0xFFE9D6D2), Color(0xFFD6B4AF)],
      cardGradient2: [Color(0xFFF7F0EE), Color(0xFFECE0DC), Color(0xFFDDBCB7)],
      cardGradient3: [Color(0xFFF9F2F1), Color(0xFFEFE3DF), Color(0xFFE1C6C1)],
      titleColor: Color(0xFF4F3A3F),
      bodyColor: Color(0xFF746166),
      chipBorder: Color(0xFFE5D4D6),
      chipBg: Color.fromRGBO(255, 255, 255, 0.88),
      chipText: Color(0xFFB07A80),
      secondaryChipBorder: Color(0xFFEAD8DA),
      secondaryChipBg: Color.fromRGBO(255, 248, 248, 0.96),
      secondaryChipText: Color(0xFF9F7378),
      primaryBtnBg: Color(0xFFB7797F),
      primaryBtnText: Colors.white,
      secondaryBtnBorder: Color(0xFFEAD8DA),
      secondaryBtnText: Color(0xFF9F7378),
      infoBoxBorder: Color(0xFFE8D7D8),
      infoBoxBg: Color(0xFFFCF8F8),
      infoBoxText: Color(0xFF8E6D72),
    ),
    GenreKey.sf: DiscoverGenreContent(
      label: 'SF',
      english: 'Science Fiction',
      heroEyebrow: 'Science Fiction',
      heroTitle: '완벽해 보이는 세계일수록 더 치명적인 결함을 숨긴다',
      heroDesc: '미래 도시, 기억 조작, 시스템 이탈 같은 설정을 가진 작품들을 무겁지 않게 둘러볼 수 있는 시작 페이지야.',
      heroNote: '차가운 세계관 속 더 선명해지는 균열',
      protagonistName: '윤 카이',
      protagonistRole: '기억 복원 센터 분석가',
      protagonistDesc: '삭제돼서는 안 될 기억의 공백을 발견한 뒤 시스템 전체를 의심하게 된다.',
      protagonistTags: ['기억 복원', '도시형 느와르', '시스템 이탈'],
      storyTitle: '서사 설명',
      storyDesc: '기억과 기록이 통제되는 도시에서 진실을 추적하는 이야기.',
      storyBeats: ['EP 01 누락된 기록'],
      stats: [DiscoverStat(label: 'Future Worlds', value: '67', desc: '주목받는 SF 세계관')],
      projectEyebrow: 'Featured Title',
      projectTitle: 'Memory District 07',
      projectDesc: '작은 오류 하나가 도시 전체를 흔드는 대표 SF 작품.',
      projectEpisode: 'EP 04 · 접근 금지 구역',
      projectStatus: '지금 가장 주목받는 전개',
      projectPoint: '삭제된 기억 하나가 만든 균열',
      projectVisual: 'sf gradient',
      notes: [DiscoverNote(label: 'Highlight', title: '완벽한 통제의 균열', desc: '보이지 않는 규칙이 가장 무섭다.')],
      actions: ['신규 SF 작품 등록'],
      panels: [DiscoverPanel(tag: 'World Build', title: '도시 규칙 설계', desc: '질서정연한 미래와 그 안의 균열.', visual: 'neon city')],
      pageBg: Color(0xFF071019),
      glowA: Color.fromRGBO(66, 202, 255, 0.20),
      glowB: Color.fromRGBO(98, 123, 255, 0.14),
      border: Color.fromRGBO(255, 255, 255, 0.10),
      surface: Color.fromRGBO(255, 255, 255, 0.05),
      surfaceStrong: Color.fromRGBO(255, 255, 255, 0.08),
      accentText: Color(0xFF65DCFF),
      accentTextDark: Color(0xFF07131A),
      heroGradient: [Color(0xFF081826), Color(0xFF134263), Color(0xFF43D2FF)],
      cardGradient1: [Color(0xFF091521), Color(0xFF155072), Color(0xFF5CE7FF)],
      cardGradient2: [Color(0xFF07131C), Color(0xFF194260), Color(0xFF75E6FF)],
      cardGradient3: [Color(0xFF08141D), Color(0xFF0F4763), Color(0xFF60F3FF)],
      titleColor: Color(0xFFE8F7FF),
      bodyColor: Color(0xFF8FB4C3),
      chipBorder: Color(0xFF2AA8CF),
      chipBg: Colors.transparent,
      chipText: Color(0xFF8AEFFF),
      secondaryChipBorder: Color(0xFF24556D),
      secondaryChipBg: Colors.transparent,
      secondaryChipText: Color(0xFF9CEEFF),
      primaryBtnBg: Color(0xFF0B2531),
      primaryBtnText: Color(0xFF8AEFFF),
      secondaryBtnBorder: Color(0xFF214F63),
      secondaryBtnText: Color(0xFF7EA6B8),
      infoBoxBorder: Color(0xFF214F63),
      infoBoxBg: Colors.transparent,
      infoBoxText: Color(0xFF9CEEFF),
    ),
    GenreKey.murim: DiscoverGenreContent(
      label: '무협',
      english: 'Murim',
      heroEyebrow: 'Murim',
      heroTitle: '강한 자만 살아남는 세계에서 끝내 남는 건 선택의 무게다',
      heroDesc: '검과 문파, 귀환 서사를 가진 작품들을 무겁지 않게 시작할 수 있도록 정리했어.',
      heroNote: '기세와 결심이 오래 남는 무협',
      protagonistName: '진무결',
      protagonistRole: '파문당한 검객',
      protagonistDesc: '쫓겨난 뒤 이름 없는 검객으로 살지만 다시 무림의 중심으로 끌려 들어간다.',
      protagonistTags: ['복귀 서사', '문파 정치', '검객'],
      storyTitle: '서사 설명',
      storyDesc: '복수보다 더 큰 선택과 책임을 묻는 무협 이야기.',
      storyBeats: ['EP 01 산문을 떠난 날'],
      stats: [DiscoverStat(label: 'New Entries', value: '53', desc: '이번 주 공개된 무협 작품')],
      projectEyebrow: 'Featured Title',
      projectTitle: 'Blade of the Silent Peak',
      projectDesc: '기세와 호흡이 먼저 기억되는 대표 무협 작품.',
      projectEpisode: 'EP 07 · 검을 다시 든 밤',
      projectStatus: '지금 가장 강한 반응을 얻는 회차',
      projectPoint: '칼보다 더 묵직한 선택의 순간',
      projectVisual: 'murim gradient',
      notes: [DiscoverNote(label: 'Highlight', title: '정적이 길수록 검이 더 강해진다', desc: '기술보다 쉼과 기세가 먼저 남는다.')],
      actions: ['신규 무협 작품 등록'],
      panels: [DiscoverPanel(tag: 'Action Rhythm', title: '검술 호흡 정리', desc: '속도보다 무게감이 살아 있는 액션.', visual: 'sword / stance')],
      pageBg: Color(0xFFF8F4E8),
      glowA: Color.fromRGBO(184, 168, 102, 0.28),
      glowB: Color.fromRGBO(146, 176, 118, 0.22),
      border: Color(0xFFDBCFAE),
      surface: Color.fromRGBO(255, 251, 240, 0.84),
      surfaceStrong: Color.fromRGBO(255, 251, 240, 0.94),
      accentText: Color(0xFF8C7340),
      accentTextDark: Color(0xFF18140C),
      heroGradient: [Color(0xFFF4EED8), Color(0xFFE4D4A5), Color(0xFFB79C64)],
      cardGradient1: [Color(0xFFF7F1DE), Color(0xFFE7DAB6), Color(0xFFC9B27A)],
      cardGradient2: [Color(0xFFF7F2E2), Color(0xFFE9DDBB), Color(0xFFBDAA76)],
      cardGradient3: [Color(0xFFF8F3E6), Color(0xFFEDE3C9), Color(0xFFC6B683)],
      titleColor: Color(0xFF413A2C),
      bodyColor: Color(0xFF716958),
      chipBorder: Color(0xFFC7B78B),
      chipBg: Color.fromRGBO(245, 239, 222, 0.88),
      chipText: Color(0xFF7D6A3D),
      secondaryChipBorder: Color(0xFFD4C7A5),
      secondaryChipBg: Color.fromRGBO(251, 247, 236, 0.94),
      secondaryChipText: Color(0xFF8C7340),
      primaryBtnBg: Color(0xFF7C8B5D),
      primaryBtnText: Color(0xFF1C2015),
      secondaryBtnBorder: Color(0xFFCDBF98),
      secondaryBtnText: Color(0xFF7A6840),
      infoBoxBorder: Color(0xFFD5C7A4),
      infoBoxBg: Color(0xFFFBF7EC),
      infoBoxText: Color(0xFF7A6840),
    ),
    GenreKey.horror: DiscoverGenreContent(
      label: '공포',
      english: 'Horror',
      heroEyebrow: 'Horror',
      heroTitle: '가장 조용한 순간에 가장 불길한 일이 시작된다',
      heroDesc: '폐쇄 공간, 기록물, 이상 징후처럼 직접 보여주지 않아도 불안이 남는 작품들로 구성했어.',
      heroNote: '보고 난 뒤가 더 무서운 이야기들',
      protagonistName: '한서우',
      protagonistRole: '실종 사건 기록 아카이브 직원',
      protagonistDesc: '사라진 사람들의 기록을 정리하던 중 자신의 일상도 기록과 닮아가기 시작한다.',
      protagonistTags: ['기록물 구조', '폐쇄 공간', '심리 압박'],
      storyTitle: '서사 설명',
      storyDesc: '설명할 수 없는 이상함이 천천히 일상을 잠식해 가는 심리 공포.',
      storyBeats: ['EP 01 불 꺼진 복도'],
      stats: [DiscoverStat(label: 'Dark Entries', value: '41', desc: '이번 주 공개된 공포 작품')],
      projectEyebrow: 'Featured Title',
      projectTitle: 'Night Log 07',
      projectDesc: '아무것도 보이지 않는데 분명히 지나간 것 같은 불안을 끝까지 끌고 가는 작품.',
      projectEpisode: 'EP 08 · 지하 주차장 시퀀스',
      projectStatus: '지금 가장 강한 반응을 얻는 회차',
      projectPoint: '설명보다 먼저 도착하는 공포',
      projectVisual: 'horror gradient',
      notes: [DiscoverNote(label: 'Highlight', title: '보이지 않기 때문에 더 무서운 순간', desc: '실체보다 기척과 패턴이 먼저 불안을 만든다.')],
      actions: ['신규 공포 작품 등록'],
      panels: [DiscoverPanel(tag: 'Tension Design', title: '폐쇄 공간 연출', desc: '복도와 문만으로도 불안을 만드는 구성.', visual: 'hall / door')],
      pageBg: Color(0xFF060606),
      glowA: Color.fromRGBO(125, 31, 42, 0.20),
      glowB: Color.fromRGBO(42, 48, 52, 0.16),
      border: Color(0xFF24181B),
      surface: Color.fromRGBO(13, 11, 12, 0.82),
      surfaceStrong: Color.fromRGBO(13, 11, 12, 0.92),
      accentText: Color(0xFFC97882),
      accentTextDark: Color(0xFFF1EBEB),
      heroGradient: [Color(0xFF060606), Color(0xFF160B0E), Color(0xFF4B1822)],
      cardGradient1: [Color(0xFF0A0808), Color(0xFF241014), Color(0xFF6A2631)],
      cardGradient2: [Color(0xFF090707), Color(0xFF1D0D11), Color(0xFF522029)],
      cardGradient3: [Color(0xFF090808), Color(0xFF201015), Color(0xFF61232E)],
      titleColor: Color(0xFFF1EBEB),
      bodyColor: Color(0xFF9D8F91),
      chipBorder: Color(0xFF6C3139),
      chipBg: Color.fromRGBO(18, 13, 15, 0.90),
      chipText: Color(0xFFD7B2B8),
      secondaryChipBorder: Color(0xFF4F2B31),
      secondaryChipBg: Color.fromRGBO(15, 11, 12, 0.90),
      secondaryChipText: Color(0xFFD5B0B6),
      primaryBtnBg: Color(0xFF6B2631),
      primaryBtnText: Colors.white,
      secondaryBtnBorder: Color(0xFF4F2B31),
      secondaryBtnText: Color(0xFFD5B0B6),
      infoBoxBorder: Color(0xFF382126),
      infoBoxBg: Color(0xFF100C0D),
      infoBoxText: Color(0xFFCCB2B6),
    ),
  };

  static List<T> repeatToLength<T>(List<T> items, int length) {
    if (items.isEmpty) return [];
    return List.generate(length, (index) => items[index % items.length]);
  }

  static List<WatchTitle> getDiscoverSeriesTitles(GenreKey genre) {
    final seriesTitles = (discoverFreeSlugByGenre[genre] ?? [])
        .map(getWatchTitleBySlug)
        .whereType<WatchTitle>()
        .where((item) => item.mode == WatchMode.series)
        .toList();

    if (seriesTitles.isNotEmpty) return seriesTitles;

    final fallbackSlug = watchEntrySlugByMode[WatchMode.series]?[genre];
    final fallback =
        fallbackSlug != null ? getWatchTitleBySlug(fallbackSlug) : null;
    return fallback != null ? [fallback] : [];
  }

  String _discoverBasePath(GenreKey genre) {
    return '/discover/${genreToPath(genre)}';
  }

  String _watchHref(GenreKey genre) {
    final slug = (discoverFreeSlugByGenre[genre]?.isNotEmpty ?? false)
        ? discoverFreeSlugByGenre[genre]!.first
        : watchEntrySlugByMode[WatchMode.series]?[genre];

    if (slug == null) return _discoverBasePath(genre);
    return '/watch/$slug?returnTo=${Uri.encodeComponent(_discoverBasePath(genre))}';
  }

  String _moviesHref(GenreKey genre) {
    return '/movies/${genreToPath(genre)}';
  }

  String _seriesHref(GenreKey genre) {
    return '/series/${genreToPath(genre)}';
  }

  String _genreLabel(GenreKey genre) {
    switch (genre) {
      case GenreKey.rofan:
        return '로판';
      case GenreKey.romance:
        return '로맨스';
      case GenreKey.sf:
        return 'SF';
      case GenreKey.murim:
        return '무협';
      case GenreKey.horror:
        return '공포';
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = discoverData[activeGenre]!;
    final watchHref = _watchHref(activeGenre);
    final moviesHref = _moviesHref(activeGenre);
    final seriesHref = _seriesHref(activeGenre);

    return VisionScaffold(
      currentPath: '/discover',
      body: Container(
        decoration: BoxDecoration(
          color: content.pageBg,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              content.pageBg,
              content.surfaceStrong,
              content.pageBg,
            ],
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
            children: [
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 980),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DISCOVER',
                        style: TextStyle(
                          color: content.accentText,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${content.label} 무료 입문',
                        style: TextStyle(
                          color: content.titleColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          height: 1.06,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        content.heroDesc,
                        style: TextStyle(
                          color: content.bodyColor,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: GenreKey.values.map((genre) {
                          final active = genre == activeGenre;
                          return InkWell(
                            borderRadius: BorderRadius.circular(999),
                            onTap: () => Navigator.pushReplacementNamed(
                              context,
                              _discoverBasePath(genre),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(999),
                                color: active ? content.chipBg : content.secondaryChipBg,
                                border: Border.all(
                                  color: active ? content.chipBorder : content.secondaryChipBorder,
                                ),
                              ),
                              child: Text(
                                _genreLabel(genre),
                                style: TextStyle(
                                  color: active ? content.chipText : content.secondaryChipText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 18),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(color: content.border),
                          color: content.surfaceStrong,
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.10),
                              blurRadius: 18,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              content.heroEyebrow,
                              style: TextStyle(
                                color: content.accentText,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.4,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              content.heroTitle,
                              style: TextStyle(
                                color: content.titleColor,
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                height: 1.08,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              content.storyDesc,
                              style: TextStyle(
                                color: content.bodyColor,
                                fontSize: 14,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: content.protagonistTags.take(3).map((tag) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(999),
                                    border: Border.all(color: content.chipBorder),
                                    color: content.chipBg,
                                  ),
                                  child: Text(
                                    tag,
                                    style: TextStyle(
                                      color: content.chipText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 18),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                _ActionButton(
                                  label: DiscoverPage.freeCtas.first,
                                  filled: true,
                                  content: content,
                                  onTap: () => Navigator.pushNamed(context, watchHref),
                                ),
                                _ActionButton(
                                  label: '영화 보기',
                                  filled: false,
                                  content: content,
                                  onTap: () => Navigator.pushNamed(context, moviesHref),
                                ),
                                _ActionButton(
                                  label: '시리즈 보기',
                                  filled: false,
                                  content: content,
                                  onTap: () => Navigator.pushNamed(context, seriesHref),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final wide = constraints.maxWidth >= 760;
                          final items = [
                            _InfoPanelData(
                              title: content.heroNote,
                              desc: content.projectPoint,
                            ),
                            _InfoPanelData(
                              title: content.protagonistName,
                              desc: content.protagonistRole,
                            ),
                            _InfoPanelData(
                              title: content.storyTitle,
                              desc: content.storyBeats.first,
                            ),
                          ];

                          if (!wide) {
                            return Column(
                              children: items
                                  .map(
                                    (item) => Padding(
                                      padding: const EdgeInsets.only(bottom: 12),
                                      child: _InfoPanel(
                                        content: content,
                                        title: item.title,
                                        desc: item.desc,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                          }

                          return Row(
                            children: [
                              for (int i = 0; i < items.length; i++) ...[
                                Expanded(
                                  child: _InfoPanel(
                                    content: content,
                                    title: items[i].title,
                                    desc: items[i].desc,
                                  ),
                                ),
                                if (i != items.length - 1) const SizedBox(width: 12),
                              ],
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final bool filled;
  final DiscoverGenreContent content;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.filled,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bg = filled ? content.primaryBtnBg : content.surfaceStrong;
    final border = filled ? content.primaryBtnBg : content.secondaryBtnBorder;
    final text = filled ? content.primaryBtnText : content.secondaryBtnText;

    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          color: bg,
          border: Border.all(color: border),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: text,
            fontSize: 13,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _InfoPanelData {
  final String title;
  final String desc;

  const _InfoPanelData({
    required this.title,
    required this.desc,
  });
}

class _InfoPanel extends StatelessWidget {
  final DiscoverGenreContent content;
  final String title;
  final String desc;

  const _InfoPanel({
    required this.content,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: content.infoBoxBorder),
        color: content.infoBoxBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: content.titleColor,
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: TextStyle(
              color: content.infoBoxText,
              fontSize: 13,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}

class DiscoverGenreContent {
  final String label;
  final String english;
  final String heroEyebrow;
  final String heroTitle;
  final String heroDesc;
  final String heroNote;
  final String protagonistName;
  final String protagonistRole;
  final String protagonistDesc;
  final List<String> protagonistTags;
  final String storyTitle;
  final String storyDesc;
  final List<String> storyBeats;
  final List<DiscoverStat> stats;
  final String projectEyebrow;
  final String projectTitle;
  final String projectDesc;
  final String projectEpisode;
  final String projectStatus;
  final String projectPoint;
  final String projectVisual;
  final List<DiscoverNote> notes;
  final List<String> actions;
  final List<DiscoverPanel> panels;
  final Color pageBg;
  final Color glowA;
  final Color glowB;
  final Color border;
  final Color surface;
  final Color surfaceStrong;
  final Color accentText;
  final Color accentTextDark;
  final List<Color> heroGradient;
  final List<Color> cardGradient1;
  final List<Color> cardGradient2;
  final List<Color> cardGradient3;
  final Color titleColor;
  final Color bodyColor;
  final Color chipBorder;
  final Color chipBg;
  final Color chipText;
  final Color secondaryChipBorder;
  final Color secondaryChipBg;
  final Color secondaryChipText;
  final Color primaryBtnBg;
  final Color primaryBtnText;
  final Color secondaryBtnBorder;
  final Color secondaryBtnText;
  final Color infoBoxBorder;
  final Color infoBoxBg;
  final Color infoBoxText;

  const DiscoverGenreContent({
    required this.label,
    required this.english,
    required this.heroEyebrow,
    required this.heroTitle,
    required this.heroDesc,
    required this.heroNote,
    required this.protagonistName,
    required this.protagonistRole,
    required this.protagonistDesc,
    required this.protagonistTags,
    required this.storyTitle,
    required this.storyDesc,
    required this.storyBeats,
    required this.stats,
    required this.projectEyebrow,
    required this.projectTitle,
    required this.projectDesc,
    required this.projectEpisode,
    required this.projectStatus,
    required this.projectPoint,
    required this.projectVisual,
    required this.notes,
    required this.actions,
    required this.panels,
    required this.pageBg,
    required this.glowA,
    required this.glowB,
    required this.border,
    required this.surface,
    required this.surfaceStrong,
    required this.accentText,
    required this.accentTextDark,
    required this.heroGradient,
    required this.cardGradient1,
    required this.cardGradient2,
    required this.cardGradient3,
    required this.titleColor,
    required this.bodyColor,
    required this.chipBorder,
    required this.chipBg,
    required this.chipText,
    required this.secondaryChipBorder,
    required this.secondaryChipBg,
    required this.secondaryChipText,
    required this.primaryBtnBg,
    required this.primaryBtnText,
    required this.secondaryBtnBorder,
    required this.secondaryBtnText,
    required this.infoBoxBorder,
    required this.infoBoxBg,
    required this.infoBoxText,
  });
}

class DiscoverStat {
  final String label;
  final String value;
  final String desc;

  const DiscoverStat({
    required this.label,
    required this.value,
    required this.desc,
  });
}

class DiscoverNote {
  final String label;
  final String title;
  final String desc;

  const DiscoverNote({
    required this.label,
    required this.title,
    required this.desc,
  });
}

class DiscoverPanel {
  final String tag;
  final String title;
  final String desc;
  final String visual;

  const DiscoverPanel({
    required this.tag,
    required this.title,
    required this.desc,
    required this.visual,
  });
}
