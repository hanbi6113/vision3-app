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

  static const Map<GenreKey, DiscoverGenreContent> discoverData = {
    GenreKey.rofan: DiscoverGenreContent(
      label: '로판',
      english: 'Royal Fantasy',
      heroEyebrow: 'Royal Fantasy Selection',
      heroTitle: '가장 화려한 세계 안에서, 가장 위험한 감정이 시작된다',
      heroDesc:
          '궁정의 권력, 정략으로 얽힌 관계, 비밀을 숨긴 인물들까지. 로판 카테고리에서는 눈길을 사로잡는 비주얼과 함께 오래 남는 감정선을 가진 작품들을 만나볼 수 있어. 사랑은 달콤하지만, 선택의 대가는 언제나 가볍지 않다.',
      heroNote: '화려한 세계관 속에서 시작되는 가장 치명적인 관계',
      protagonistName: '세라핀 벨루아',
      protagonistRole: '몰락 직전 공작가의 장녀',
      protagonistDesc:
          '가문을 지키기 위해 감정보다 판단을 먼저 배운 인물. 누구보다 냉정해 보이지만, 끝내 자기 사람을 버리지 못하는 약점이 그녀를 더 위험하게 만든다.',
      protagonistTags: ['궁정 서사', '정략 관계', '감정 절제'],
      storyTitle: '서사 설명',
      storyDesc:
          '몰락 직전의 가문, 피할 수 없는 계약, 그리고 감추고 싶은 진심. 이 이야기는 정략적인 관계에서 시작되지만, 결국 서로의 가장 약한 지점을 먼저 알아보게 되는 두 사람의 이야기다.',
      storyBeats: ['EP 01 계약의 밤', 'EP 04 균열이 생긴 연회', 'EP 08 선택의 대가'],
      stats: [
        DiscoverStat(label: 'Weekly Uploads', value: '124', desc: '이번 주 새롭게 공개된 로판 작품'),
        DiscoverStat(label: 'Shortlisted', value: '18', desc: '특별 추천으로 선정된 작품'),
        DiscoverStat(label: 'Mood Boards', value: '39', desc: '장면 무드 중심 큐레이션'),
      ],
      projectEyebrow: 'Featured Project',
      projectTitle: 'The Contract of Winter Rose',
      projectDesc:
          '서로를 믿을 수 없는 관계로 시작했지만, 가장 위태로운 순간마다 서로를 먼저 떠올리게 되는 이야기.',
      projectEpisode: 'EP 06 · 가면무도회 직전',
      projectStatus: 'Open Access',
      projectPoint: 'Emotional Tension',
      projectVisual: 'Rose court / candle / silk / palace hall',
      notes: [
        DiscoverNote(label: 'Relationship', title: '정략 관계에서 시작되는 감정', desc: '처음에는 계약이지만, 시간이 갈수록 서로의 가장 약한 지점을 먼저 알아보게 되는 구조야.'),
        DiscoverNote(label: 'Mood', title: '빛과 시선이 오래 남는 장면', desc: '장신구와 궁정의 화려함보다 표정, 거리감, 침묵이 더 중요하게 보이는 방식이야.'),
        DiscoverNote(label: 'Direction', title: '로맨틱하지만 위험한 톤', desc: '달콤함만 강조하지 않고 권력과 선택의 대가를 같이 보여줘서 더 매력적으로 느껴져.'),
      ],
      actions: ['황궁 서사', '정략 관계', '감정 중심', '로판 추천'],
      panels: [
        DiscoverPanel(tag: 'Royal Contract', title: '계약으로 시작된 밤', desc: '서로 다른 목적을 가진 두 인물이 한 테이블에 앉는 순간.', visual: 'rose / night / gold'),
        DiscoverPanel(tag: 'Court Tension', title: '연회장의 균열', desc: '모든 시선이 몰린 공간에서 관계의 온도가 미세하게 흔들리는 장면.', visual: 'hall / jewel / shadow'),
        DiscoverPanel(tag: 'Private Look', title: '말하지 못한 시선', desc: '표정은 평온하지만 시선이 먼저 흔들리는 관계의 시작.', visual: 'window / silk / close-up'),
      ],
      pageBg: Color(0xFF0D0914),
      glowA: Color.fromRGBO(214, 109, 163, 0.20),
      glowB: Color.fromRGBO(127, 107, 255, 0.15),
      border: Color.fromRGBO(255, 255, 255, 0.10),
      surface: Color.fromRGBO(255, 255, 255, 0.05),
      surfaceStrong: Color.fromRGBO(255, 255, 255, 0.08),
      accentText: Color(0xFFF2A8CB),
      accentTextDark: Color(0xFF1B0F1F),
      heroGradient: [Color(0xFF261432), Color(0xFF5C2F70), Color(0xFFD36F98)],
      cardGradient1: [Color(0xFF2B1638), Color(0xFF6B356F), Color(0xFFE18FB0)],
      cardGradient2: [Color(0xFF221430), Color(0xFF543065), Color(0xFFB86B99)],
      cardGradient3: [Color(0xFF32152D), Color(0xFF6F3758), Color(0xFFE38C9D)],
      titleColor: Color(0xFF6F4B67),
      bodyColor: Color(0xFF8F7186),
      chipBorder: Color(0xFFF7BFD6),
      chipBg: Color.fromRGBO(255, 255, 255, 0.75),
      chipText: Color(0xFFC76790),
      secondaryChipBorder: Color(0xFFF7CFE0),
      secondaryChipBg: Color.fromRGBO(255, 247, 251, 0.85),
      secondaryChipText: Color(0xFFB96B8B),
      primaryBtnBg: Color(0xFFFFA0C8),
      primaryBtnText: Colors.white,
      secondaryBtnBorder: Color(0xFFF7CFE0),
      secondaryBtnText: Color(0xFFB96B8B),
      infoBoxBorder: Color(0xFFF6D7E4),
      infoBoxBg: Color(0xFFFFF9FC),
      infoBoxText: Color(0xFFA56F86),
    ),
    GenreKey.romance: DiscoverGenreContent(
      label: '로맨스',
      english: 'Romance',
      heroEyebrow: 'Romance Selection',
      heroTitle: '한 장면의 온도 차이가, 한 사람의 마음을 바꾼다',
      heroDesc:
          '로맨스 카테고리에서는 화려한 사건보다 오래 남는 감정의 결을 만날 수 있어. 다시 마주친 사람, 끝나지 못한 관계, 말보다 시선이 먼저 흔들리는 순간들까지.',
      heroNote: '가까워지기 전의 망설임까지 설레게 만드는 이야기들',
      protagonistName: '서윤하',
      protagonistRole: '출판사 편집자',
      protagonistDesc: '감정을 쉽게 꺼내지 않는 사람. 하지만 잊었다고 믿었던 관계가 다시 눈앞에 나타난 순간부터, 그녀의 하루는 달라지기 시작한다.',
      protagonistTags: ['재회 로맨스', '감정선 중심', '시선의 온도'],
      storyTitle: '서사 설명',
      storyDesc: '끝났다고 생각했던 감정이 다시 현재의 시간 속으로 스며드는 이야기. 빠르게 달리지 않고 천천히 마음을 흔드는 방식으로 다가온다.',
      storyBeats: ['EP 01 다시 마주친 오후', 'EP 04 멀어진 이유', 'EP 09 말하지 못한 밤'],
      stats: [
        DiscoverStat(label: 'New Stories', value: '96', desc: '이번 주 새롭게 공개된 로맨스 작품'),
        DiscoverStat(label: 'Emotion Notes', value: '144', desc: '감정선이 돋보이는 장면 큐레이션'),
        DiscoverStat(label: 'Scene Picks', value: '22', desc: '가장 반응이 좋은 대표 장면'),
      ],
      projectEyebrow: 'Featured Project',
      projectTitle: 'The Moment We Stayed',
      projectDesc: '멀어진 뒤에야 더 선명해진 감정, 그리고 다시 마주한 지금에서야 시작되는 변화.',
      projectEpisode: 'EP 12 · 고백 직전',
      projectStatus: 'Open Access',
      projectPoint: 'Slow Emotion',
      projectVisual: 'rain / café / window / hands',
      notes: [
        DiscoverNote(label: 'Highlight', title: '가까워지기 직전이 가장 아름다운 순간', desc: '서로의 마음을 아직 확신하지 못할 때, 가장 섬세하고 떨리는 장면이 만들어진다.'),
        DiscoverNote(label: 'Must See', title: '다시 만났기 때문에 더 조심스러운 관계', desc: '한 번 지나간 관계는 처음보다 더 어렵다. 그래서 더 깊게 마음에 남는다.'),
      ],
      actions: ['신규 로맨스 작품 등록', '인물 관계 편집', '감정 장면 정리', '대표 대사 검토'],
      panels: [
        DiscoverPanel(tag: 'Emotion Edit', title: '관계도 정리', desc: '인물 사이의 감정이 어떻게 변하는지 가장 선명하게 보여주는 장면들.', visual: 'warm / relation'),
        DiscoverPanel(tag: 'Scene Build', title: '시선과 거리감 설계', desc: '대사보다 먼저 분위기가 설레는 작품들.', visual: 'soft / light'),
        DiscoverPanel(tag: 'Release Setup', title: '대표 컷 큐레이션', desc: '한 장면만으로도 로맨스의 온도가 느껴지는 대표 이미지들.', visual: 'gentle / room'),
      ],
      pageBg: Color(0xFFFAF6F2),
      glowA: Color.fromRGBO(234, 213, 216, 0.40),
      glowB: Color.fromRGBO(241, 221, 212, 0.30),
      border: Color(0xFFE8D7D8),
      surface: Color.fromRGBO(255, 255, 255, 0.70),
      surfaceStrong: Color.fromRGBO(255, 255, 255, 0.82),
      accentText: Color(0xFFB07A80),
      accentTextDark: Color(0xFF2C1F22),
      heroGradient: [Color(0xFFF2E6E3), Color(0xFFE6CFC8), Color(0xFFB7797F)],
      cardGradient1: [Color(0xFFF7ECE9), Color(0xFFE4C9C2), Color(0xFFC7928A)],
      cardGradient2: [Color(0xFFF2E6E3), Color(0xFFDAB9B4), Color(0xFFAD7A80)],
      cardGradient3: [Color(0xFFF7EEEC), Color(0xFFE2CBC7), Color(0xFFC19A92)],
      titleColor: Color(0xFF4F3A3F),
      bodyColor: Color(0xFF746166),
      chipBorder: Color(0xFFE5D4D6),
      chipBg: Color.fromRGBO(255, 255, 255, 0.78),
      chipText: Color(0xFFB07A80),
      secondaryChipBorder: Color(0xFFEAD8DA),
      secondaryChipBg: Color.fromRGBO(255, 248, 248, 0.85),
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
      heroEyebrow: 'Science Fiction Selection',
      heroTitle: '완벽해 보이는 세계일수록, 가장 치명적인 결함을 숨기고 있다',
      heroDesc: '거대한 도시, 정교한 시스템, 기억과 기록의 조작까지. SF의 질문은 늘 하나다. 정말 완벽한 세계는 가능한가?',
      heroNote: '차가운 세계관 속에서 더 선명해지는 인간의 균열',
      protagonistName: '윤 카이',
      protagonistRole: '기억 복원 센터 분석가',
      protagonistDesc: '도시의 오류 로그를 추적하다가, 시스템보다 더 위험한 진실을 먼저 감지하게 되는 인물.',
      protagonistTags: ['미래 도시', '기억 복원', '시스템 스릴'],
      storyTitle: '서사 설명',
      storyDesc: '완벽해 보이는 시스템이 무너지는 순간, 인간의 선택이 더 크게 드러난다.',
      storyBeats: ['EP 01 프로토콜 오류', 'EP 04 기억 복원 로그', 'EP 07 시스템 임계점'],
      stats: [
        DiscoverStat(label: 'System Picks', value: '84', desc: '미래 세계관 중심 추천'),
        DiscoverStat(label: 'Core Logs', value: '19', desc: '강한 서사 코어'),
        DiscoverStat(label: 'Interface Cuts', value: '33', desc: 'UI/시스템 무드 장면'),
      ],
      projectEyebrow: 'Featured Project',
      projectTitle: 'Protocol Zero',
      projectDesc: '복잡한 설명보다 인터페이스 무드와 구조의 차가움을 먼저 느끼게 하는 대표 SF 작품.',
      projectEpisode: 'EP 03 · 오류 발생 직전',
      projectStatus: 'Open Access',
      projectPoint: 'System Thriller',
      projectVisual: 'neon / interface / archive / city',
      notes: [
        DiscoverNote(label: 'System', title: '차가운 구조', desc: '정확하고 차가운 시스템이 오히려 더 큰 불안을 만드는 구조야.'),
        DiscoverNote(label: 'Memory', title: '복원되는 기억', desc: '기억의 조각이 연결될수록 인물의 판단이 더 복잡해져.'),
        DiscoverNote(label: 'Signal', title: '불안정한 신호', desc: '인터페이스와 로그가 서사의 긴장감을 시각적으로 밀어줘.'),
      ],
      actions: ['미래 도시', '인터페이스', '기억 복원', 'SF 추천'],
      panels: [
        DiscoverPanel(tag: 'System Log', title: '프로토콜 오류', desc: '질서 정연하던 구조가 미세하게 흔들리기 시작하는 장면.', visual: 'neon / grid'),
        DiscoverPanel(tag: 'Archive', title: '복원되는 기록', desc: '사라진 줄 알았던 정보가 다시 연결되며 판이 바뀌는 순간.', visual: 'screen / signal'),
        DiscoverPanel(tag: 'Threshold', title: '임계점 진입', desc: '더 이상 복구가 아니라 선택의 문제로 넘어가는 지점.', visual: 'core / light'),
      ],
      pageBg: Color(0xFF061019),
      glowA: Color.fromRGBO(62, 207, 255, 0.16),
      glowB: Color.fromRGBO(94, 169, 255, 0.14),
      border: Color(0xFF1B4D63),
      surface: Color.fromRGBO(9, 21, 32, 0.72),
      surfaceStrong: Color.fromRGBO(9, 21, 32, 0.90),
      accentText: Color(0xFF8AEFFF),
      accentTextDark: Color(0xFFE8F7FF),
      heroGradient: [Color(0xFF07131D), Color(0xFF0A2231), Color(0xFF144760)],
      cardGradient1: [Color(0xFF07131D), Color(0xFF12384B), Color(0xFF1E6C8B)],
      cardGradient2: [Color(0xFF081722), Color(0xFF103245), Color(0xFF1D5F7A)],
      cardGradient3: [Color(0xFF07131D), Color(0xFF0E2E42), Color(0xFF1B5672)],
      titleColor: Color(0xFFE8F7FF),
      bodyColor: Color(0xFF8FB4C3),
      chipBorder: Color(0xFF2AA8CF),
      chipBg: Colors.transparent,
      chipText: Color(0xFF8AEFFF),
      secondaryChipBorder: Color(0xFF24556D),
      secondaryChipBg: Colors.transparent,
      secondaryChipText: Color(0xFF9CEEFF),
      primaryBtnBg: Color(0x00000000),
      primaryBtnText: Color(0xFF8AEFFF),
      secondaryBtnBorder: Color(0xFF24556D),
      secondaryBtnText: Color(0xFF9CEEFF),
      infoBoxBorder: Color(0xFF214F63),
      infoBoxBg: Color(0x00000000),
      infoBoxText: Color(0xFF9CEEFF),
    ),
    GenreKey.murim: DiscoverGenreContent(
      label: '무협',
      english: 'Murim',
      heroEyebrow: 'Murim Selection',
      heroTitle: '검의 흐름과 강호의 질서가 다시 움직이기 시작한다',
      heroDesc: '문파, 검객, 강호의 흐름과 절제된 감정을 중심으로 무협 작품들을 정리했어.',
      heroNote: '강호의 기류와 검의 결이 먼저 보이는 장르',
      protagonistName: '서무진',
      protagonistRole: '몰락한 문파의 계승자',
      protagonistDesc: '적게 말하고 오래 버티는 인물. 절제된 감정과 선택이 세계관을 단단하게 만든다.',
      protagonistTags: ['검객', '문파', '강호'],
      storyTitle: '서사 설명',
      storyDesc: '무협은 단순 전투보다, 인물의 결과 문파의 역사, 강호의 흐름이 같이 보여야 밀도가 높아진다.',
      storyBeats: ['EP 01 파문된 이름', 'EP 03 강호 재입성', 'EP 07 검의 방향'],
      stats: [
        DiscoverStat(label: 'Murim Picks', value: '72', desc: '검객 서사 중심 큐레이션'),
        DiscoverStat(label: 'Clan Stories', value: '17', desc: '문파 서사 추천'),
        DiscoverStat(label: 'Blade Notes', value: '29', desc: '검의 장면 중심 편집'),
      ],
      projectEyebrow: 'Featured Project',
      projectTitle: 'The Return of Silent Blade',
      projectDesc: '화려함보다 절제와 무게감, 검의 방향과 세계관의 결을 먼저 느끼게 하는 대표 무협 작품.',
      projectEpisode: 'EP 05 · 강호 재입성',
      projectStatus: 'Open Access',
      projectPoint: 'Blade Tension',
      projectVisual: 'mountain / blade / wind / robe',
      notes: [
        DiscoverNote(label: 'Clan', title: '문파의 역사', desc: '세계관의 결을 만드는 건 현재 사건보다 오래된 문파의 시간감이야.'),
        DiscoverNote(label: 'Blade', title: '검의 방향', desc: '검을 드는 이유와 버리는 이유가 인물의 중심을 보여줘.'),
        DiscoverNote(label: 'Murim', title: '강호의 흐름', desc: '정적인 장면도 긴장감을 만들 수 있는 장르야.'),
      ],
      actions: ['검객 서사', '강호', '문파 비사', '무협 추천'],
      panels: [
        DiscoverPanel(tag: 'Blade Return', title: '돌아온 검객', desc: '떠났던 인물이 다시 강호에 발을 들이는 시작.', visual: 'mountain / fog'),
        DiscoverPanel(tag: 'Clan Path', title: '문파의 길', desc: '개인의 선택이 곧 문파의 흐름으로 이어지는 장면.', visual: 'temple / banner'),
        DiscoverPanel(tag: 'Wind Cut', title: '바람과 검', desc: '움직임보다 결이 먼저 보이는 무협 특유의 리듬.', visual: 'robe / sword'),
      ],
      pageBg: Color(0xFFF4F0E4),
      glowA: Color.fromRGBO(217, 223, 195, 0.42),
      glowB: Color.fromRGBO(231, 216, 180, 0.34),
      border: Color(0xFFDDD4BF),
      surface: Color.fromRGBO(247, 243, 232, 0.75),
      surfaceStrong: Color.fromRGBO(247, 243, 232, 0.90),
      accentText: Color(0xFF8C8F5F),
      accentTextDark: Color(0xFF1C1A14),
      heroGradient: [Color(0xFFECE7D7), Color(0xFFD5C8A3), Color(0xFF8D8B63)],
      cardGradient1: [Color(0xFFF0E9D9), Color(0xFFD8CAA7), Color(0xFF9A8758)],
      cardGradient2: [Color(0xFFE8E0CD), Color(0xFFCFC29D), Color(0xFF88744A)],
      cardGradient3: [Color(0xFFF2ECDD), Color(0xFFDCCDA8), Color(0xFFA18D60)],
      titleColor: Color(0xFF413A2C),
      bodyColor: Color(0xFF716958),
      chipBorder: Color(0xFFC7B78B),
      chipBg: Color.fromRGBO(245, 239, 222, 0.85),
      chipText: Color(0xFF7D6A3D),
      secondaryChipBorder: Color(0xFFD4C7A5),
      secondaryChipBg: Color.fromRGBO(251, 247, 236, 0.90),
      secondaryChipText: Color(0xFF8C7340),
      primaryBtnBg: Color(0xFF9A8A5F),
      primaryBtnText: Color(0xFF1C2015),
      secondaryBtnBorder: Color(0xFFD4C7A5),
      secondaryBtnText: Color(0xFF8C7340),
      infoBoxBorder: Color(0xFFD5C7A4),
      infoBoxBg: Color(0xFFFBF7EC),
      infoBoxText: Color(0xFF7A6840),
    ),
    GenreKey.horror: DiscoverGenreContent(
      label: '공포',
      english: 'Horror',
      heroEyebrow: 'Horror Selection',
      heroTitle: '보이지 않는 이상 징후가 가장 먼저 공기를 바꾸기 시작한다',
      heroDesc: '정적, 심리적 긴장, 기록물 구조, 폐쇄 공간의 불안감을 중심으로 공포 장르를 정리했어.',
      heroNote: '정적과 암시가 더 오래 남는 장르',
      protagonistName: '차유진',
      protagonistRole: '기록을 추적하는 생존자',
      protagonistDesc: '설명되지 않는 징후를 끝까지 따라가며 진실에 가까워지는 시선을 가진 인물이야.',
      protagonistTags: ['폐쇄 공간', '이상 징후', '기록물 구조'],
      storyTitle: '서사 설명',
      storyDesc: '공포는 강한 자극보다 여백, 정적, 설명되지 않는 불안이 더 오래 남을 때 힘이 생긴다.',
      storyBeats: ['EP 01 첫 번째 기록', 'EP 03 닫힌 공간', 'EP 06 이상 징후'],
      stats: [
        DiscoverStat(label: 'Horror Picks', value: '63', desc: '심리적 긴장 중심 추천'),
        DiscoverStat(label: 'Dark Files', value: '14', desc: '기록물 구조 추천'),
        DiscoverStat(label: 'Late Night Cuts', value: '26', desc: '심야 큐레이션 장면'),
      ],
      projectEyebrow: 'Featured Project',
      projectTitle: 'The Closed Corridor',
      projectDesc: '갑작스러운 쇼크보다 조용한 암시와 폐쇄적인 공기감을 먼저 체감하게 만드는 대표 공포 작품.',
      projectEpisode: 'EP 04 · 닫힌 복도',
      projectStatus: 'Open Access',
      projectPoint: 'Psychological Tension',
      projectVisual: 'dark hall / recorder / closed door / shadow',
      notes: [
        DiscoverNote(label: 'Silence', title: '정적인 공기', desc: '아무 일도 없어 보이는 순간이 오히려 더 큰 긴장을 만들어.'),
        DiscoverNote(label: 'Record', title: '기록물 구조', desc: '남겨진 기록이 서사를 조금씩 더 불길하게 만드는 방식이야.'),
        DiscoverNote(label: 'Sign', title: '이상 징후', desc: '작고 반복되는 징후가 공포의 핵심 리듬이 돼.'),
      ],
      actions: ['심리 스릴', '폐쇄 공간', '기록물 구조', '공포 추천'],
      panels: [
        DiscoverPanel(tag: 'Dark Hall', title: '닫힌 복도', desc: '보이지 않는 기척이 이미 공기를 바꿔 놓은 공간.', visual: 'hall / door'),
        DiscoverPanel(tag: 'Record File', title: '남겨진 기록', desc: '기록을 읽을수록 더 많은 질문만 남는 구조.', visual: 'tape / file'),
        DiscoverPanel(tag: 'Late Sign', title: '늦게 도착한 징후', desc: '이상 징후는 항상 설명보다 먼저 도착한다.', visual: 'shadow / static'),
      ],
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
    final fallback = fallbackSlug != null ? getWatchTitleBySlug(fallbackSlug) : null;
    return fallback != null ? [fallback] : [];
  }

  @override
  Widget build(BuildContext context) {
    final content = discoverData[activeGenre]!;
    final currentImages = genreImages[activeGenre]!;
    final discoverBasePath = '/discover/${genreToPath(activeGenre)}';
    final discoverSeriesTitles = getDiscoverSeriesTitles(activeGenre);
    final repeatedTitles = repeatToLength(discoverSeriesTitles, 10);
    final heroTitle = repeatedTitles.isNotEmpty ? repeatedTitles[0] : null;

    final heroImage = heroTitle?.coverImage != null
        ? assetFromPublicPath(heroTitle!.coverImage)
        : currentImages[0];

    final heroWatchHref = heroTitle != null
        ? '/watch/${heroTitle.slug}?returnTo=${Uri.encodeComponent(discoverBasePath)}'
        : discoverBasePath;

    final freeEpisodeHref = heroTitle != null
        ? '/watch/${heroTitle.slug}?returnTo=${Uri.encodeComponent(discoverBasePath)}'
        : discoverBasePath;

    final posterImages = List<String>.generate(
      12,
      (index) => repeatedTitles.isNotEmpty
          ? assetFromPublicPath(repeatedTitles[index % repeatedTitles.length].coverImage)
          : currentImages[index % currentImages.length],
    );

    final theme = _DiscoverShellTheme.fromContent(activeGenre, content);

    return VisionScaffold(
      currentPath: '/discover',
      body: Stack(
        children: [
          Positioned.fill(
            child: _DiscoverBackdrop(
              genre: activeGenre,
              theme: theme,
            ),
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
                      _DiscoverGenreTabs(
                        activeGenre: activeGenre,
                        theme: theme,
                      ),
                      const SizedBox(height: 18),
                      _DiscoverHeroCard(
                        image: heroImage,
                        theme: theme,
                        watchHref: heroWatchHref,
                        browseHref: discoverBasePath,
                      ),
                      const SizedBox(height: 24),
                      _DiscoverSectionTitle(
                        title: '무료 공개작',
                        subtitle: content.heroNote,
                        theme: theme,
                      ),
                      const SizedBox(height: 14),
                      _PosterOnlyShelf(
                        images: posterImages.take(4).toList(),
                        theme: theme,
                        posterWidth: 250,
                      ),
                      const SizedBox(height: 26),
                      _DiscoverSectionTitle(
                        title: '지금 많이 보는 작품',
                        subtitle: content.projectPoint,
                        theme: theme,
                      ),
                      const SizedBox(height: 14),
                      _PosterOnlyShelf(
                        images: posterImages.take(6).toList(),
                        theme: theme,
                        posterWidth: 220,
                      ),
                      const SizedBox(height: 26),
                      _DiscoverSectionTitle(
                        title: 'Discover Grid',
                        subtitle: '장르 무드와 입문 흐름을 포스터 중심으로 확장',
                        theme: theme,
                      ),
                      const SizedBox(height: 14),
                      _PosterOnlyShelf(
                        images: posterImages.skip(2).take(6).toList(),
                        theme: theme,
                        posterWidth: 220,
                      ),
                      const SizedBox(height: 26),
                      _DiscoverSectionTitle(
                        title: '장르 무드 포스터',
                        subtitle: content.storyTitle,
                        theme: theme,
                      ),
                      const SizedBox(height: 14),
                      _PosterOnlyShelf(
                        images: List<String>.generate(
                          6,
                          (index) => currentImages[index % currentImages.length],
                        ),
                        theme: theme,
                        posterWidth: 230,
                      ),
                      const SizedBox(height: 26),
                      _DiscoverSectionTitle(
                        title: '추천 포스터',
                        subtitle: content.projectStatus,
                        theme: theme,
                      ),
                      const SizedBox(height: 14),
                      _PosterOnlyShelf(
                        images: posterImages.reversed.take(4).toList(),
                        theme: theme,
                        posterWidth: 250,
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

class _DiscoverShellTheme {
  final Color pageBg;
  final Color glowA;
  final Color glowB;
  final Color border;
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

  const _DiscoverShellTheme({
    required this.pageBg,
    required this.glowA,
    required this.glowB,
    required this.border,
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

  factory _DiscoverShellTheme.fromContent(
    GenreKey genre,
    DiscoverGenreContent content,
  ) {
    switch (genre) {
      case GenreKey.rofan:
        return _DiscoverShellTheme(
          pageBg: content.pageBg,
          glowA: content.glowA,
          glowB: content.glowB,
          border: content.border,
          surfaceStrong: content.surfaceStrong,
          accentText: content.accentText,
          titleColor: content.titleColor,
          bodyColor: content.bodyColor,
          activeChipBg: const Color(0xFFFFF0F7),
          activeChipBorder: const Color(0xFFF6BFD8),
          activeChipText: const Color(0xFFC76790),
          inactiveChipBorder: const Color.fromRGBO(255, 255, 255, 0.70),
          inactiveChipText: const Color(0xFFB46B89),
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
        return _DiscoverShellTheme(
          pageBg: content.pageBg,
          glowA: content.glowA,
          glowB: content.glowB,
          border: content.border,
          surfaceStrong: content.surfaceStrong,
          accentText: content.accentText,
          titleColor: content.titleColor,
          bodyColor: content.bodyColor,
          activeChipBg: const Color(0xFFF8F1F2),
          activeChipBorder: const Color(0xFFE6D2D6),
          activeChipText: const Color(0xFFA86F74),
          inactiveChipBorder: const Color.fromRGBO(255, 255, 255, 0.72),
          inactiveChipText: const Color(0xFF9A7278),
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
        return _DiscoverShellTheme(
          pageBg: content.pageBg,
          glowA: content.glowA,
          glowB: content.glowB,
          border: content.border,
          surfaceStrong: content.surfaceStrong,
          accentText: content.accentText,
          titleColor: content.titleColor,
          bodyColor: content.bodyColor,
          activeChipBg: Colors.transparent,
          activeChipBorder: const Color(0xFF2AA8CF),
          activeChipText: const Color(0xFF8AEFFF),
          inactiveChipBorder: const Color(0xFF1F5168),
          inactiveChipText: const Color(0xFF7EA6B8),
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
        return _DiscoverShellTheme(
          pageBg: content.pageBg,
          glowA: content.glowA,
          glowB: content.glowB,
          border: content.border,
          surfaceStrong: content.surfaceStrong,
          accentText: content.accentText,
          titleColor: content.titleColor,
          bodyColor: content.bodyColor,
          activeChipBg: const Color(0xFFF2ECDC),
          activeChipBorder: const Color(0xFFC6BA92),
          activeChipText: const Color(0xFF695C37),
          inactiveChipBorder: const Color.fromRGBO(255, 255, 255, 0.65),
          inactiveChipText: const Color(0xFF84785B),
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
        return _DiscoverShellTheme(
          pageBg: content.pageBg,
          glowA: content.glowA,
          glowB: content.glowB,
          border: content.border,
          surfaceStrong: content.surfaceStrong,
          accentText: content.accentText,
          titleColor: content.titleColor,
          bodyColor: content.bodyColor,
          activeChipBg: const Color(0xFF140D0F),
          activeChipBorder: const Color(0xFF6F2A34),
          activeChipText: const Color(0xFFE7C3C8),
          inactiveChipBorder: const Color(0xFF1A1012),
          inactiveChipText: const Color(0xFF8F7F82),
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

class _DiscoverBackdrop extends StatelessWidget {
  final GenreKey genre;
  final _DiscoverShellTheme theme;

  const _DiscoverBackdrop({
    required this.genre,
    required this.theme,
  });

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
                    Color(0xFFFFF8FC),
                    Color(0xFFFFF6FB),
                    Color(0xFFFFF8FC),
                    Color(0xFFF8FBFF),
                  ],
                  stops: [0.0, 0.28, 0.62, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            left: -185,
            top: -250,
            child: _BackdropGlow(size: 700, color: Color(0x33FFD8EC)),
          ),
          Positioned(
            right: -185,
            top: -230,
            child: _BackdropGlow(size: 680, color: Color(0x33EEF9FF)),
          ),
          Positioned(
            left: 90,
            bottom: -120,
            child: _BackdropGlow(size: 340, color: Color(0x33E7DCFF)),
          ),
          Positioned(
            right: 70,
            bottom: -100,
            child: _BackdropGlow(size: 320, color: Color(0x33DFF4FF)),
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

  const _BackdropGlow({
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
              spreadRadius: size / 8,
            ),
          ],
        ),
      ),
    );
  }
}

class _DiscoverGenreTabs extends StatelessWidget {
  final GenreKey activeGenre;
  final _DiscoverShellTheme theme;

  const _DiscoverGenreTabs({
    required this.activeGenre,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: GenreKey.values.map((genre) {
        final active = genre == activeGenre;

        return InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: () => Navigator.pushReplacementNamed(
            context,
            '/discover/${genreToPath(genre)}',
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: active ? theme.activeChipBg : Colors.transparent,
              border: Border.all(
                color: active ? theme.activeChipBorder : theme.inactiveChipBorder,
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

class _DiscoverHeroCard extends StatelessWidget {
  final String image;
  final _DiscoverShellTheme theme;
  final String watchHref;
  final String browseHref;

  const _DiscoverHeroCard({
    required this.image,
    required this.theme,
    required this.watchHref,
    required this.browseHref,
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
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
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
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _DiscoverActionButton(
                  label: '1화 무료 보기',
                  theme: theme,
                  primary: true,
                  onTap: () => Navigator.pushNamed(context, watchHref),
                ),
                _DiscoverActionButton(
                  label: '무료 공개작 둘러보기',
                  theme: theme,
                  primary: false,
                  onTap: () => Navigator.pushNamed(context, browseHref),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DiscoverActionButton extends StatelessWidget {
  final String label;
  final _DiscoverShellTheme theme;
  final bool primary;
  final VoidCallback onTap;

  const _DiscoverActionButton({
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

    final textColor = primary ? theme.heroButtonText : theme.heroSecondaryButtonText;

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

class _DiscoverSectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final _DiscoverShellTheme theme;

  const _DiscoverSectionTitle({
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

class _PosterOnlyShelf extends StatelessWidget {
  final List<String> images;
  final _DiscoverShellTheme theme;
  final double posterWidth;

  const _PosterOnlyShelf({
    required this.images,
    required this.theme,
    required this.posterWidth,
  });

  @override
  Widget build(BuildContext context) {
    final posterHeight = posterWidth / (2 / 3);

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
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
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

String assetFromPublicPath(String path) {
  if (path.startsWith('/')) {
    return 'assets$path';
  }
  return path;
}
