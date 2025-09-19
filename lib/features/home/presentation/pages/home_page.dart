import 'package:flutter/material.dart';
import '../../../../shared/widgets/common/app_header.dart';
import '../../../../shared/widgets/sections/sponsor_section.dart';
import '../../../../shared/widgets/sections/home_menu_section.dart';
import '../../../../shared/widgets/sections/marathon_hero_carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 상단 헤더
          const AppHeader(
            onHomeTap: null,    // TODO: 홈 페이지 새로고침
          ),
          
          // 히어로 섹션
          const MarathonHeroCarousel(),

          // 메인 메뉴 섹션 (세로 중앙 정렬, 영역 가득 채우고 내부에서 센터)
          Expanded(
            child: SizedBox.expand(
              child: const HomeMenuSection(),
            ),
          ),
          
          // Sponsor Section
          const SponsorSection(),
        ],
      ),
    );
  }
}
