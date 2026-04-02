// lib/data/watch_data.dart
enum GenreKey { rofan, romance, sf, murim, horror }
enum WatchMode { series, movies }

GenreKey? genreFromString(String value) {
  switch (value) {
    case 'rofan':
      return GenreKey.rofan;
    case 'romance':
      return GenreKey.romance;
    case 'sf':
      return GenreKey.sf;
    case 'murim':
      return GenreKey.murim;
    case 'horror':
      return GenreKey.horror;
    default:
      return null;
  }
}

String genreToPath(GenreKey genre) {
  switch (genre) {
    case GenreKey.rofan:
      return 'rofan';
    case GenreKey.romance:
      return 'romance';
    case GenreKey.sf:
      return 'sf';
    case GenreKey.murim:
      return 'murim';
    case GenreKey.horror:
      return 'horror';
  }
}

String genreLabel(GenreKey genre) {
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

class ContinueWatchingItem {
  final String title;
  final String subtitle;
  final String image;
  final String href;
  final String progress;

  const ContinueWatchingItem({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.href,
    required this.progress,
  });
}

class RankingItem {
  final int rank;
  final String title;
  final String subtitle;
  final String image;
  final String href;

  const RankingItem({
    required this.rank,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.href,
  });
}

class WatchEpisode {
  final int number;
  final String title;
  final String summary;
  final String duration;
  final String image;
  final bool isFree;

  const WatchEpisode({
    required this.number,
    required this.title,
    required this.summary,
    required this.duration,
    required this.image,
    this.isFree = false,
  });
}

class WatchTitle {
  final String slug;
  final String title;
  final String subtitle;
  final String tagline;
  final String meta;
  final String description;
  final WatchMode mode;
  final GenreKey genre;
  final String coverImage;
  final String video;
  final String rating;
  final String year;
  final String runtime;
  final String status;
  final String point;
  final List<String> badges;
  final List<WatchEpisode> episodes;
  final List<String> cast;
  final List<String> relatedSlugs;

  const WatchTitle({
    required this.slug,
    required this.title,
    required this.subtitle,
    required this.tagline,
    required this.meta,
    required this.description,
    required this.mode,
    required this.genre,
    required this.coverImage,
    required this.video,
    required this.rating,
    required this.year,
    required this.runtime,
    required this.status,
    required this.point,
    required this.badges,
    required this.episodes,
    required this.cast,
    required this.relatedSlugs,
  });
}

final List<String> imagePool =
    List.generate(20, (i) => 'assets/images/img${i + 1}.jpg');

final List<String> videoPool =
    List.generate(10, (i) => 'assets/videos/market/market${i + 1}.mp4');

String pickImage(int index) => imagePool[index % imagePool.length];
String pickVideo(int index) => videoPool[index % videoPool.length];

String assetFromPublicPath(String path) {
  if (path.startsWith('/')) {
    return 'assets$path';
  }
  return path;
}

final Map<String, String> protagonistImageByName = {
  'Min Rowan': 'assets/images/main1.png',
  'Jae Hyun': 'assets/images/main2.png',
  'Ian Rho': 'assets/images/main3.png',
  'Seo Mujin': 'assets/images/main4.png',
  'Yuna Seo': 'assets/images/main5.png',
  'Cha Yerin': 'assets/images/main6.jpg',
  'Mira Han': 'assets/images/main7.jpg',
  'Elin Hart': 'assets/images/main8.jpg',
};

final Map<WatchMode, Map<GenreKey, String>> watchEntrySlugByMode = {
  WatchMode.series: {
    GenreKey.rofan: 'crown-of-starlight',
    GenreKey.romance: 'the-last-scene-of-summer',
    GenreKey.sf: 'ash-protocol',
    GenreKey.murim: 'blade-of-mist',
    GenreKey.horror: 'red-moon-ritual',
  },
  WatchMode.movies: {
    GenreKey.rofan: 'moonlit-throne',
    GenreKey.romance: 'late-summer-letter',
    GenreKey.sf: 'orbit-zero',
    GenreKey.murim: 'sword-of-dusk',
    GenreKey.horror: 'black-veil-archive',
  },
};

final Map<GenreKey, List<String>> discoverFreeSlugByGenre = {
  GenreKey.rofan: ['crown-of-starlight'],
  GenreKey.romance: ['the-last-scene-of-summer'],
  GenreKey.sf: ['ash-protocol'],
  GenreKey.murim: ['blade-of-mist'],
  GenreKey.horror: ['red-moon-ritual'],
};

final continueWatchingList = <ContinueWatchingItem>[
  ContinueWatchingItem(
    title: 'Glass Midnight',
    subtitle: 'EP 07 · 74% 시청',
    progress: '74%',
    image: pickImage(1),
    href: '/watch/glass-midnight',
  ),
  ContinueWatchingItem(
    title: 'Ash Protocol',
    subtitle: 'EP 03 · 48% 시청',
    progress: '48%',
    image: pickImage(2),
    href: '/watch/ash-protocol',
  ),
  ContinueWatchingItem(
    title: 'Silent Harbor',
    subtitle: 'EP 05 · 63% 시청',
    progress: '63%',
    image: pickImage(3),
    href: '/watch/silent-harbor',
  ),
  ContinueWatchingItem(
    title: 'Velvet Burn',
    subtitle: 'EP 02 · 29% 시청',
    progress: '29%',
    image: pickImage(4),
    href: '/watch/velvet-burn',
  ),
  ContinueWatchingItem(
    title: 'Moon Archive',
    subtitle: 'EP 09 · 82% 시청',
    progress: '82%',
    image: pickImage(5),
    href: '/watch/moon-archive',
  ),
  ContinueWatchingItem(
    title: 'Night Bloom',
    subtitle: 'EP 04 · 36% 시청',
    progress: '36%',
    image: pickImage(6),
    href: '/watch/night-bloom',
  ),
  ContinueWatchingItem(
    title: 'Blue Corridor',
    subtitle: 'EP 08 · 67% 시청',
    progress: '67%',
    image: pickImage(7),
    href: '/watch/blue-corridor',
  ),
  ContinueWatchingItem(
    title: 'Last Passenger',
    subtitle: 'EP 01 · 12% 시청',
    progress: '12%',
    image: pickImage(8),
    href: '/watch/last-passenger',
  ),
];

final rankingList = <RankingItem>[
  RankingItem(rank: 1, title: 'Glass Midnight', subtitle: 'Neo-noir Series', image: pickImage(5), href: '/watch/glass-midnight'),
  RankingItem(rank: 2, title: 'Ash Protocol', subtitle: 'Sci-Fi Thriller', image: pickImage(6), href: '/watch/ash-protocol'),
  RankingItem(rank: 3, title: 'Silent Harbor', subtitle: 'Mystery Film', image: pickImage(7), href: '/watch/silent-harbor'),
  RankingItem(rank: 4, title: 'Velvet Burn', subtitle: 'Original Drama', image: pickImage(8), href: '/watch/velvet-burn'),
  RankingItem(rank: 5, title: 'Moon Archive', subtitle: 'SF Drama', image: pickImage(9), href: '/watch/moon-archive'),
  RankingItem(rank: 6, title: 'Night Bloom', subtitle: 'Original Series', image: pickImage(10), href: '/watch/night-bloom'),
  RankingItem(rank: 7, title: 'Crimson Shore', subtitle: 'Thriller Film', image: pickImage(11), href: '/watch/crimson-shore'),
  RankingItem(rank: 8, title: 'After Silence', subtitle: 'Mystery Drama', image: pickImage(12), href: '/watch/after-silence'),
  RankingItem(rank: 9, title: 'Blue Corridor', subtitle: 'Sci-Fi Series', image: pickImage(13), href: '/watch/blue-corridor'),
  RankingItem(rank: 10, title: 'Last Passenger', subtitle: 'Drama Film', image: pickImage(14), href: '/watch/last-passenger'),
  RankingItem(rank: 11, title: 'Neon Chamber', subtitle: 'Action Series', image: pickImage(15), href: '/watch/neon-chamber'),
  RankingItem(rank: 12, title: 'Crown of Mist', subtitle: 'Fantasy Drama', image: pickImage(16), href: '/watch/crown-of-mist'),
];

final watchCatalog = <WatchTitle>[
  WatchTitle(
    slug: 'the-last-scene-of-summer',
    title: 'The Last Scene of Summer',
    subtitle: 'Vision3 Original',
    tagline: '사라진 여름의 마지막 장면을 다시 꺼내는 미스터리 드라마',
    meta: 'Drama · Mystery · 2026 · 16+',
    description:
        '한 장면의 감도, 긴장감 있는 서사, 그리고 시네마틱한 몰입. Vision3 메인에서 가장 강하게 밀어주는 대표작이야.',
    mode: WatchMode.series,
    genre: GenreKey.romance,
    coverImage: pickImage(0),
    video: pickVideo(0),
    rating: '16+',
    year: '2026',
    runtime: 'EP 01 · 58min',
    status: 'Now Streaming',
    point: 'Cinematic Mystery',
    badges: ['Vision3 Original', 'Main Hero', 'Recommended'],
    cast: ['Yuna Seo', 'Jae Hyun'],
    relatedSlugs: ['late-summer-letter', 'silent-harbor', 'after-silence'],
    episodes: [
      WatchEpisode(
        number: 1,
        title: 'The First Missing Frame',
        summary: '여름 축제의 마지막 밤, 사라진 한 장면이 모든 사건의 시작이 된다.',
        duration: '58min',
        image: pickImage(0),
        isFree: true,
      ),
      WatchEpisode(
        number: 2,
        title: 'Echo in the Harbor',
        summary: '사라진 기억의 조각을 항구 도시의 흔적 속에서 추적한다.',
        duration: '54min',
        image: pickImage(1),
      ),
      WatchEpisode(
        number: 3,
        title: 'Blue Motel',
        summary: '오래된 모텔의 단서가 잊고 있던 관계의 균열을 드러낸다.',
        duration: '56min',
        image: pickImage(2),
      ),
      WatchEpisode(
        number: 4,
        title: 'When Summer Ends',
        summary: '가장 아름다운 순간이 사실은 가장 위험한 시작이었다는 것이 드러난다.',
        duration: '61min',
        image: pickImage(3),
      ),
    ],
  ),
  WatchTitle(
    slug: 'glass-midnight',
    title: 'Glass Midnight',
    subtitle: 'Vision3 Original',
    tagline: '유리처럼 차가운 밤, 진실이 금이 가기 시작한다',
    meta: 'Drama · Mystery · 2026 · 16+',
    description: '차갑게 정리된 도시의 밤과 미스터리한 감정선을 밀도 있게 보여주는 대표 시리즈.',
    mode: WatchMode.series,
    genre: GenreKey.sf,
    coverImage: pickImage(1),
    video: pickVideo(1),
    rating: '16+',
    year: '2026',
    runtime: '52분',
    status: 'Now Streaming',
    point: 'Cinematic Tension',
    badges: ['Original', 'Top Pick', 'Sci-Fi'],
    cast: ['Ian Rho', 'Mira Han'],
    relatedSlugs: ['ash-protocol', 'blue-corridor', 'orbit-zero'],
    episodes: List.generate(
      8,
      (i) => WatchEpisode(
        number: i + 1,
        title: 'Episode ${i + 1}',
        summary: '도시의 균열이 조금씩 드러나는 핵심 에피소드.',
        duration: '52분',
        image: pickImage(i + 1),
        isFree: i == 0,
      ),
    ),
  ),
  WatchTitle(
    slug: 'ash-protocol',
    title: 'Ash Protocol',
    subtitle: 'Vision3 Series',
    tagline: '시스템의 오류는 언제나 사람보다 먼저 균열을 기억한다',
    meta: 'Sci-Fi Thriller · 2026 · 15+',
    description: '미래 도시의 시스템, 감정, 추적 서사가 결합된 SF 스릴러.',
    mode: WatchMode.series,
    genre: GenreKey.sf,
    coverImage: pickImage(2),
    video: pickVideo(2),
    rating: '15+',
    year: '2026',
    runtime: '49분',
    status: 'Streaming',
    point: 'System Thriller',
    badges: ['Sci-Fi', 'Thriller'],
    cast: ['Min Rowan', 'Jae Hyun'],
    relatedSlugs: ['glass-midnight', 'blue-corridor', 'orbit-zero'],
    episodes: List.generate(
      10,
      (i) => WatchEpisode(
        number: i + 1,
        title: 'Protocol ${i + 1}',
        summary: '통제와 감시 체계가 본격적으로 흔들리기 시작한다.',
        duration: '49분',
        image: pickImage(i + 3),
        isFree: i == 0,
      ),
    ),
  ),
  WatchTitle(
    slug: 'crown-of-starlight',
    title: 'Crown of Starlight',
    subtitle: 'Royal Fantasy',
    tagline: '황궁의 감정과 권력이 가장 화려하게 교차하는 순간',
    meta: 'Romance Fantasy · 2026 · 15+',
    description: '로판 장르 감성과 궁정 서사를 전면에 둔 대표작.',
    mode: WatchMode.series,
    genre: GenreKey.rofan,
    coverImage: pickImage(4),
    video: pickVideo(3),
    rating: '15+',
    year: '2026',
    runtime: '55분',
    status: 'Original',
    point: 'Royal Emotion',
    badges: ['Original', 'Rofan'],
    cast: ['Elin Hart', 'Cha Yerin'],
    relatedSlugs: ['moonlit-throne', 'velvet-burn', 'crown-of-mist'],
    episodes: List.generate(
      12,
      (i) => WatchEpisode(
        number: i + 1,
        title: 'Crown ${i + 1}',
        summary: '황궁의 감정선과 정략 구조가 점점 깊어진다.',
        duration: '55분',
        image: pickImage(i + 5),
        isFree: i == 0,
      ),
    ),
  ),
  WatchTitle(
    slug: 'blade-of-mist',
    title: 'Blade of Mist',
    subtitle: 'Murim Series',
    tagline: '안개 속에서 검의 방향이 다시 정해진다',
    meta: 'Murim · Action · 2026 · 15+',
    description: '문파와 검객의 흐름을 무게감 있게 보여주는 무협 시리즈.',
    mode: WatchMode.series,
    genre: GenreKey.murim,
    coverImage: pickImage(13),
    video: pickVideo(4),
    rating: '15+',
    year: '2026',
    runtime: '51분',
    status: 'Streaming',
    point: 'Blade Tension',
    badges: ['Murim', 'Action'],
    cast: ['Seo Mujin'],
    relatedSlugs: ['sword-of-dusk'],
    episodes: List.generate(
      8,
      (i) => WatchEpisode(
        number: i + 1,
        title: 'Mist ${i + 1}',
        summary: '강호의 흐름과 검의 방향이 다시 움직이기 시작한다.',
        duration: '51분',
        image: pickImage(12 + i),
        isFree: i == 0,
      ),
    ),
  ),
  WatchTitle(
    slug: 'red-moon-ritual',
    title: 'Red Moon Ritual',
    subtitle: 'Horror Series',
    tagline: '가장 늦은 밤, 의식은 이미 시작되었다',
    meta: 'Horror · Mystery · 2026 · 18+',
    description: '정적과 심리적 긴장감을 전면에 둔 공포 시리즈.',
    mode: WatchMode.series,
    genre: GenreKey.horror,
    coverImage: pickImage(17),
    video: pickVideo(5),
    rating: '18+',
    year: '2026',
    runtime: '47분',
    status: 'Streaming',
    point: 'Psychological Tension',
    badges: ['Horror', 'Late Night'],
    cast: ['Cha Yerin'],
    relatedSlugs: ['black-veil-archive'],
    episodes: List.generate(
      8,
      (i) => WatchEpisode(
        number: i + 1,
        title: 'Ritual ${i + 1}',
        summary: '의식의 흔적이 하나씩 드러나며 공기가 완전히 바뀌기 시작한다.',
        duration: '47분',
        image: pickImage(16 + (i % 4)),
        isFree: i == 0,
      ),
    ),
  ),
  WatchTitle(
    slug: 'silent-harbor',
    title: 'Silent Harbor',
    subtitle: 'Mystery Film',
    tagline: '침묵하는 항구가 모든 진실을 감추고 있다',
    meta: 'Mystery Film · 2026 · 15+',
    description: '물기 어린 공기감과 미스터리 톤을 앞세운 감성형 영화.',
    mode: WatchMode.movies,
    genre: GenreKey.romance,
    coverImage: pickImage(3),
    video: pickVideo(6),
    rating: '15+',
    year: '2026',
    runtime: '118min',
    status: 'Now Streaming',
    point: 'Harbor Mystery',
    badges: ['Film', 'Mystery'],
    cast: ['Yuna Seo'],
    relatedSlugs: ['late-summer-letter', 'after-silence'],
    episodes: const [
      WatchEpisode(
        number: 1,
        title: 'Feature Film',
        summary: '침묵하는 항구 도시에서 사라진 기억과 관계의 진실을 추적한다.',
        duration: '118min',
        image: 'assets/images/img3.jpg',
        isFree: true,
      ),
    ],
  ),
  WatchTitle(
    slug: 'velvet-burn',
    title: 'Velvet Burn',
    subtitle: 'Original Drama',
    tagline: '부드럽지만 위험한 감정의 온도',
    meta: 'Drama Film · 2026 · 15+',
    description: '우아한 비주얼과 위험한 감정선이 겹쳐지는 드라마 영화.',
    mode: WatchMode.movies,
    genre: GenreKey.rofan,
    coverImage: pickImage(4),
    video: pickVideo(7),
    rating: '15+',
    year: '2026',
    runtime: '121min',
    status: 'Original',
    point: 'Velvet Emotion',
    badges: ['Film', 'Drama'],
    cast: ['Elin Hart'],
    relatedSlugs: ['moonlit-throne', 'crown-of-mist'],
    episodes: const [
      WatchEpisode(
        number: 1,
        title: 'Feature Film',
        summary: '위험한 관계와 선택의 대가가 천천히 드러나는 영화.',
        duration: '121min',
        image: 'assets/images/img4.jpg',
        isFree: true,
      ),
    ],
  ),
  WatchTitle(
    slug: 'moon-archive',
    title: 'Moon Archive',
    subtitle: 'SF Drama',
    tagline: '기록되지 않은 달의 로그를 다시 열다',
    meta: 'SF Film · 2026 · 15+',
    description: '기록과 신호, 구조의 차가움을 앞세운 SF 영화.',
    mode: WatchMode.movies,
    genre: GenreKey.sf,
    coverImage: pickImage(5),
    video: pickVideo(8),
    rating: '15+',
    year: '2026',
    runtime: '114min',
    status: 'Streaming',
    point: 'Archive Signal',
    badges: ['Film', 'SF'],
    cast: ['Ian Rho'],
    relatedSlugs: ['orbit-zero', 'glass-midnight'],
    episodes: const [
      WatchEpisode(
        number: 1,
        title: 'Feature Film',
        summary: '사라진 기록과 달의 로그를 추적하는 SF 영화.',
        duration: '114min',
        image: 'assets/images/img5.jpg',
        isFree: true,
      ),
    ],
  ),
  WatchTitle(
    slug: 'night-bloom',
    title: 'Night Bloom',
    subtitle: 'Original Series',
    tagline: '밤이 피어나는 순간, 감정도 흔들리기 시작한다',
    meta: 'Original Series · 2026 · 15+',
    description: '밤의 공기와 인물 감정선을 묘하게 겹치는 오리지널 시리즈.',
    mode: WatchMode.series,
    genre: GenreKey.romance,
    coverImage: pickImage(6),
    video: pickVideo(9),
    rating: '15+',
    year: '2026',
    runtime: '50분',
    status: 'Original',
    point: 'Night Emotion',
    badges: ['Original', 'Series'],
    cast: ['Yuna Seo'],
    relatedSlugs: ['the-last-scene-of-summer'],
    episodes: List.generate(
      8,
      (i) => WatchEpisode(
        number: i + 1,
        title: 'Bloom ${i + 1}',
        summary: '밤이 깊어질수록 관계의 공기도 더 진하게 흔들린다.',
        duration: '50분',
        image: pickImage(6 + (i % 4)),
        isFree: i == 0,
      ),
    ),
  ),
  WatchTitle(
    slug: 'blue-corridor',
    title: 'Blue Corridor',
    subtitle: 'Sci-Fi Series',
    tagline: '푸른 복도 끝에서 모든 신호가 뒤집힌다',
    meta: 'Sci-Fi Series · 2026 · 15+',
    description: '차가운 인터페이스와 미래 복도 구조를 시네마틱하게 보여주는 시리즈.',
    mode: WatchMode.series,
    genre: GenreKey.sf,
    coverImage: pickImage(7),
    video: pickVideo(1),
    rating: '15+',
    year: '2026',
    runtime: '48분',
    status: 'Streaming',
    point: 'Signal Corridor',
    badges: ['Series', 'Sci-Fi'],
    cast: ['Min Rowan'],
    relatedSlugs: ['ash-protocol', 'glass-midnight'],
    episodes: List.generate(
      8,
      (i) => WatchEpisode(
        number: i + 1,
        title: 'Corridor ${i + 1}',
        summary: '복도 끝 신호를 추적할수록 시스템의 진실이 드러난다.',
        duration: '48분',
        image: pickImage(8 + (i % 4)),
        isFree: i == 0,
      ),
    ),
  ),
  WatchTitle(
    slug: 'last-passenger',
    title: 'Last Passenger',
    subtitle: 'Drama Film',
    tagline: '마지막 승객이 남긴 침묵의 기록',
    meta: 'Drama Film · 2026 · 12+',
    description: '잔잔하지만 오래 남는 감정선을 가진 드라마 영화.',
    mode: WatchMode.movies,
    genre: GenreKey.romance,
    coverImage: pickImage(8),
    video: pickVideo(2),
    rating: '12+',
    year: '2026',
    runtime: '112min',
    status: 'Streaming',
    point: 'Quiet Emotion',
    badges: ['Film', 'Drama'],
    cast: ['Yuna Seo'],
    relatedSlugs: ['silent-harbor', 'late-summer-letter'],
    episodes: const [
      WatchEpisode(
        number: 1,
        title: 'Feature Film',
        summary: '마지막 승객의 기록이 잊고 있던 감정을 다시 깨운다.',
        duration: '112min',
        image: 'assets/images/img8.jpg',
        isFree: true,
      ),
    ],
  ),
  WatchTitle(
    slug: 'crimson-shore',
    title: 'Crimson Shore',
    subtitle: 'Thriller Film',
    tagline: '핏빛 해안선에서 모든 관계가 뒤틀린다',
    meta: 'Thriller Film · 2026 · 18+',
    description: '스릴과 감정의 균열이 동시에 밀려오는 해안선 스릴러.',
    mode: WatchMode.movies,
    genre: GenreKey.horror,
    coverImage: pickImage(11),
    video: pickVideo(3),
    rating: '18+',
    year: '2026',
    runtime: '109min',
    status: 'Streaming',
    point: 'Crimson Thriller',
    badges: ['Film', 'Thriller'],
    cast: ['Cha Yerin'],
    relatedSlugs: ['black-veil-archive'],
    episodes: const [
      WatchEpisode(
        number: 1,
        title: 'Feature Film',
        summary: '붉은 해안선을 둘러싼 의심과 불안이 점점 커진다.',
        duration: '109min',
        image: 'assets/images/img11.jpg',
        isFree: true,
      ),
    ],
  ),
  WatchTitle(
    slug: 'after-silence',
    title: 'After Silence',
    subtitle: 'Mystery Drama',
    tagline: '침묵 이후에야 들리기 시작하는 마음의 잔향',
    meta: 'Mystery Drama · 2026 · 15+',
    description: '정적과 감정의 여운이 함께 남는 미스터리 드라마 영화.',
    mode: WatchMode.movies,
    genre: GenreKey.romance,
    coverImage: pickImage(12),
    video: pickVideo(4),
    rating: '15+',
    year: '2026',
    runtime: '116min',
    status: 'Streaming',
    point: 'Afterglow Mystery',
    badges: ['Film', 'Mystery'],
    cast: ['Yuna Seo'],
    relatedSlugs: ['silent-harbor', 'last-passenger'],
    episodes: const [
      WatchEpisode(
        number: 1,
        title: 'Feature Film',
        summary: '사라진 대화 뒤에 남은 침묵이 관계의 진실을 드러낸다.',
        duration: '116min',
        image: 'assets/images/img12.jpg',
        isFree: true,
      ),
    ],
  ),
  WatchTitle(
    slug: 'neon-chamber',
    title: 'Neon Chamber',
    subtitle: 'Action Series',
    tagline: '네온으로 가득한 공간에서 추적은 더 차갑게 시작된다',
    meta: 'Action Series · 2026 · 15+',
    description: '강한 인터페이스 무드와 추적 액션이 결합된 시리즈.',
    mode: WatchMode.series,
    genre: GenreKey.sf,
    coverImage: pickImage(15),
    video: pickVideo(5),
    rating: '15+',
    year: '2026',
    runtime: '46분',
    status: 'Streaming',
    point: 'Neon Action',
    badges: ['Series', 'Action'],
    cast: ['Ian Rho'],
    relatedSlugs: ['glass-midnight', 'ash-protocol'],
    episodes: List.generate(
      8,
      (i) => WatchEpisode(
        number: i + 1,
        title: 'Chamber ${i + 1}',
        summary: '네온 챔버 안에서 추적의 규칙이 완전히 바뀌기 시작한다.',
        duration: '46분',
        image: pickImage(12 + (i % 4)),
        isFree: i == 0,
      ),
    ),
  ),
  WatchTitle(
    slug: 'crown-of-mist',
    title: 'Crown of Mist',
    subtitle: 'Fantasy Drama',
    tagline: '안개 낀 왕좌 위에서 감정과 권력이 동시에 흔들린다',
    meta: 'Fantasy Drama · 2026 · 15+',
    description: '환상적 이미지와 궁정 감정선이 함께 작동하는 판타지 드라마.',
    mode: WatchMode.movies,
    genre: GenreKey.rofan,
    coverImage: pickImage(16),
    video: pickVideo(6),
    rating: '15+',
    year: '2026',
    runtime: '119min',
    status: 'Original',
    point: 'Fantasy Emotion',
    badges: ['Film', 'Fantasy'],
    cast: ['Elin Hart'],
    relatedSlugs: ['moonlit-throne', 'velvet-burn'],
    episodes: const [
      WatchEpisode(
        number: 1,
        title: 'Feature Film',
        summary: '안개 낀 왕좌와 관계의 균열이 동시에 깊어지는 영화.',
        duration: '119min',
        image: 'assets/images/img16.jpg',
        isFree: true,
      ),
    ],
  ),
  WatchTitle(
    slug: 'moonlit-throne',
    title: 'Moonlit Throne',
    subtitle: 'Royal Fantasy Film',
    tagline: '달빛 아래 왕좌의 균열이 드러난다',
    meta: 'Royal Fantasy Film · 2026 · 15+',
    description: '로판 영화 라인의 대표작으로 왕좌와 감정의 긴장을 다룬다.',
    mode: WatchMode.movies,
    genre: GenreKey.rofan,
    coverImage: pickImage(9),
    video: pickVideo(7),
    rating: '15+',
    year: '2026',
    runtime: '124min',
    status: 'Original',
    point: 'Royal Tension',
    badges: ['Film', 'Rofan'],
    cast: ['Cha Yerin', 'Elin Hart'],
    relatedSlugs: ['velvet-burn', 'crown-of-mist'],
    episodes: const [
      WatchEpisode(
        number: 1,
        title: 'Feature Film',
        summary: '달빛 아래 균열이 시작되며 모든 관계가 다시 정리된다.',
        duration: '124min',
        image: 'assets/images/img9.jpg',
        isFree: true,
      ),
    ],
  ),
  WatchTitle(
    slug: 'late-summer-letter',
    title: 'Late Summer Letter',
    subtitle: 'Romance Film',
    tagline: '늦여름의 편지가 결국 가장 오래 남는 마음을 꺼낸다',
    meta: 'Romance Film · 2026 · 12+',
    description: '감정선과 여운 중심의 로맨스 영화.',
    mode: WatchMode.movies,
    genre: GenreKey.romance,
    coverImage: pickImage(10),
    video: pickVideo(8),
    rating: '12+',
    year: '2026',
    runtime: '110min',
    status: 'Streaming',
    point: 'Late Emotion',
    badges: ['Film', 'Romance'],
    cast: ['Yuna Seo', 'Jae Hyun'],
    relatedSlugs: ['silent-harbor', 'after-silence'],
    episodes: const [
      WatchEpisode(
        number: 1,
        title: 'Feature Film',
        summary: '늦여름에 도착한 편지가 오랫동안 숨겨둔 감정을 흔든다.',
        duration: '110min',
        image: 'assets/images/img10.jpg',
        isFree: true,
      ),
    ],
  ),
  WatchTitle(
    slug: 'orbit-zero',
    title: 'Orbit Zero',
    subtitle: 'Sci-Fi Film',
    tagline: '제로 궤도에서 모든 로그가 다시 시작된다',
    meta: 'Sci-Fi Film · 2026 · 15+',
    description: '차가운 로그와 우주적 고립감이 중심인 SF 영화.',
    mode: WatchMode.movies,
    genre: GenreKey.sf,
    coverImage: pickImage(11),
    video: pickVideo(9),
    rating: '15+',
    year: '2026',
    runtime: '115min',
    status: 'Streaming',
    point: 'Zero Orbit',
    badges: ['Film', 'Sci-Fi'],
    cast: ['Ian Rho', 'Min Rowan'],
    relatedSlugs: ['moon-archive', 'glass-midnight'],
    episodes: const [
      WatchEpisode(
        number: 1,
        title: 'Feature Film',
        summary: '제로 궤도에서 남겨진 마지막 로그가 인물들을 다시 움직인다.',
        duration: '115min',
        image: 'assets/images/img11.jpg',
        isFree: true,
      ),
    ],
  ),
  WatchTitle(
    slug: 'sword-of-dusk',
    title: 'Sword of Dusk',
    subtitle: 'Murim Film',
    tagline: '해질 무렵, 검의 결이 마지막으로 흔들린다',
    meta: 'Murim Film · 2026 · 15+',
    description: '묵직한 무게감과 검의 흐름이 중심인 무협 영화.',
    mode: WatchMode.movies,
    genre: GenreKey.murim,
    coverImage: pickImage(14),
    video: pickVideo(0),
    rating: '15+',
    year: '2026',
    runtime: '117min',
    status: 'Streaming',
    point: 'Sword Tension',
    badges: ['Film', 'Murim'],
    cast: ['Seo Mujin'],
    relatedSlugs: ['blade-of-mist'],
    episodes: const [
      WatchEpisode(
        number: 1,
        title: 'Feature Film',
        summary: '해질 무렵 마지막 승부와 강호의 방향이 다시 정리된다.',
        duration: '117min',
        image: 'assets/images/img14.jpg',
        isFree: true,
      ),
    ],
  ),
  WatchTitle(
    slug: 'black-veil-archive',
    title: 'Black Veil Archive',
    subtitle: 'Horror Film',
    tagline: '검은 장막 뒤의 기록은 언제나 늦게 열린다',
    meta: 'Horror Film · 2026 · 18+',
    description: '기록물 구조와 심리적 긴장감 중심의 공포 영화.',
    mode: WatchMode.movies,
    genre: GenreKey.horror,
    coverImage: pickImage(18),
    video: pickVideo(1),
    rating: '18+',
    year: '2026',
    runtime: '111min',
    status: 'Streaming',
    point: 'Archive Horror',
    badges: ['Film', 'Horror'],
    cast: ['Cha Yerin'],
    relatedSlugs: ['red-moon-ritual', 'crimson-shore'],
    episodes: const [
      WatchEpisode(
        number: 1,
        title: 'Feature Film',
        summary: '검은 장막 뒤에 숨겨진 기록이 하나씩 불길하게 복원된다.',
        duration: '111min',
        image: 'assets/images/img18.jpg',
        isFree: true,
      ),
    ],
  ),
];

WatchTitle? getWatchTitleBySlug(String slug) {
  try {
    return watchCatalog.firstWhere((item) => item.slug == slug);
  } catch (_) {
    return null;
  }
}

WatchEpisode getSelectedEpisode(List<WatchEpisode> episodes, int? rawEpisode) {
  if (rawEpisode == null) return episodes.first;
  return episodes.firstWhere(
    (episode) => episode.number == rawEpisode,
    orElse: () => episodes.first,
  );
}