/// 마라톤 슬라이드 데이터 모델
class MarathonSlide {
  final int id;
  final String? image;
  final String title;
  final String? subtitle;
  final String? badge;
  final String? date;
  final String? description;
  final List<Map<String, String>>? buttons;

  const MarathonSlide({
    required this.id,
    this.image,
    required this.title,
    this.subtitle,
    this.badge,
    this.date,
    this.description,
    this.buttons,
  });
}

/// 마라톤 슬라이드 데이터
class MarathonSlidesData {
  static const List<MarathonSlide> slides = [
    MarathonSlide(
      id: 1,
      image: 'assets/images/main banner.png',
      title: '',
      description: '',
      badge: '',
    ),
    MarathonSlide(
      id: 2,
      image: 'assets/images/main banner01.jpg',
      title: '서울국제마라톤',
      subtitle: '도시와 함께하는 달리기',
      badge: '대회 안내',
      date: '2024년 3월 17일',
      description: '서울의 아름다운 도시 풍경과 함께하는 마라톤',
      buttons: [
        {'text': '신청하기', 'action': 'apply'},
        {'text': '대회 요강', 'action': 'rules'},
        {'text': '신청 확인', 'action': 'confirm'},
      ],
    ),
    MarathonSlide(
      id: 3,
      image: 'assets/images/main banner02.jpg',
      title: '제주올레마라톤',
      subtitle: '자연과 함께하는 달리기',
      badge: '대회 안내',
      date: '2024년 5월 12일',
      description: '제주도의 아름다운 자연 풍경과 함께하는 마라톤',
      buttons: [
        {'text': '신청하기', 'action': 'apply'},
        {'text': '대회 요강', 'action': 'rules'},
        {'text': '신청 확인', 'action': 'confirm'},
      ],
    ),
    MarathonSlide(
      id: 4,
      image: 'assets/images/main banner03.jpg',
      title: '대구국제마라톤',
      subtitle: '문화와 함께하는 달리기',
      badge: '대회 안내',
      date: '2024년 10월 20일',
      description: '대구의 풍부한 문화와 함께하는 마라톤',
      buttons: [
        {'text': '신청하기', 'action': 'apply'},
        {'text': '대회 요강', 'action': 'rules'},
        {'text': '신청 확인', 'action': 'confirm'},
      ],
    ),
    MarathonSlide(
      id: 5,
      image: 'assets/images/main banner04.jpeg',
      title: '광주마라톤',
      subtitle: '빛과 함께하는 달리기',
      badge: '대회 안내',
      date: '2024년 11월 3일',
      description: '광주의 빛과 함께하는 마라톤',
      buttons: [
        {'text': '신청하기', 'action': 'apply'},
        {'text': '대회 요강', 'action': 'rules'},
        {'text': '신청 확인', 'action': 'confirm'},
      ],
    ),
  ];
}
