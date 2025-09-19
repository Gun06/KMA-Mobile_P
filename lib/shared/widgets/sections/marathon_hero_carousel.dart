import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../buttons/hero_button.dart';
import '../../../features/home/data/models/marathon_slide.dart';

/// 마라톤 Hero Section 캐러셀 위젯 (shared/widgets/sections)
class MarathonHeroCarousel extends StatefulWidget {
  const MarathonHeroCarousel({super.key});

  @override
  State<MarathonHeroCarousel> createState() => _MarathonHeroCarouselState();
}

class _MarathonHeroCarouselState extends State<MarathonHeroCarousel>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  int _currentIndex = 0;
  final int _totalSlides = MarathonSlidesData.slides.length;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.9,
    );
    _animationController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    );
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _animationController.forward().then((_) {
      if (mounted) {
        _nextSlide();
        _animationController.reset();
        _startAutoPlay();
      }
    });
  }

  void _nextSlide() {
    final nextIndex = (_currentIndex + 1) % _totalSlides;
    _pageController.animateToPage(
      nextIndex,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOutCubic,
    );
  }

  void _previousSlide() {
    final prevIndex = (_currentIndex - 1 + _totalSlides) % _totalSlides;
    _pageController.animateToPage(
      prevIndex,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      margin: EdgeInsets.only(top: 10.h),
      color: AppColors.info.withOpacity(0.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: SizedBox(
              height: 180.h,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                  _animationController.reset();
                  _startAutoPlay();
                },
                itemCount: _totalSlides,
                itemBuilder: (context, index) {
                  return _buildSlideWithPeek(MarathonSlidesData.slides[index], index);
                },
              ),
            ),
          ),
          Positioned(
            bottom: 16.h,
            left: 0,
            right: 0,
            child: _buildPagination(),
          ),
        ],
      ),
    );
  }

  Widget _buildSlideWithPeek(MarathonSlide slide, int index) {
    final isCurrentSlide = index == _currentIndex;
    final scale = isCurrentSlide ? 1.0 : 0.95;
    final opacity = isCurrentSlide ? 1.0 : 0.9;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.symmetric(
        horizontal: isCurrentSlide ? 4.w : 8.w,
        vertical: isCurrentSlide ? 0 : 4.h,
      ),
      transform: Matrix4.identity()..scale(scale),
      child: Opacity(
        opacity: opacity,
        child: _buildSlideCard(slide, index),
      ),
    );
  }

  Widget _buildSlideCard(MarathonSlide slide, int index) {
    return GestureDetector(
      onTap: () {
        print('Slide ${slide.id} tapped');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  slide.image ?? 'assets/images/placeholder.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              if (slide.id != 1)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: _getGradient(slide.id),
                    ),
                  ),
                ),
              Positioned.fill(
                child: _buildSlideContent(slide, index),
              ),
              Positioned(
                right: 10.w,
                top: 10.h,
                child: _buildSlideCounter(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  LinearGradient _getGradient(int slideId) {
    if (slideId == 1) {
      return const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0x99000000),
          Color(0x66000000),
          Colors.transparent,
        ],
        stops: [0.0, 0.5, 1.0],
      );
    } else {
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0x66000000),
          Color(0x66000000),
        ],
      );
    }
  }

  Widget _buildSlideContent(MarathonSlide slide, int index) {
    if (slide.id == 1) {
      return _buildFirstSlideContent(slide);
    } else {
      return _buildOtherSlideContent(slide);
    }
  }

  Widget _buildFirstSlideContent(MarathonSlide slide) {
    return Container();
  }

  Widget _buildOtherSlideContent(MarathonSlide slide) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 4.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              slide.badge ?? '',
              style: AppTextStyles.labelSmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 10.sp,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            slide.title,
            style: AppTextStyles.h2.copyWith(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          if (slide.subtitle != null) ...[
            SizedBox(height: 4.h),
            Text(
              slide.subtitle!,
              style: AppTextStyles.h3.copyWith(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
          SizedBox(height: 8.h),
          if (slide.date != null)
            Text(
              slide.date!,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.white.withOpacity(0.9),
                fontSize: 12.sp,
              ),
            ),
          if (slide.buttons != null && slide.buttons!.isNotEmpty) ...[
            SizedBox(height: 12.h),
            Row(
              children: slide.buttons!.map((button) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 6.w),
                    child: _buildButton(button),
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildButton(Map<String, String> button) {
    final isPrimary = button['action'] == 'apply';
    return GestureDetector(
      onTap: () {
        print('Button ${button['action']} tapped');
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.info : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8.r),
          border: isPrimary
              ? null
              : Border.all(color: Colors.white.withOpacity(0.4), width: 1),
        ),
        child: Text(
          button['text']!,
          style: AppTextStyles.bodySmall.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 10.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _totalSlides,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          width: index == _currentIndex ? 20.w : 6.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: index == _currentIndex
                ? AppColors.primary
                : Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(3.r),
          ),
        ),
      ),
    );
  }

  Widget _buildSlideCounter() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 0.5),
      ),
      child: Text(
        '${_currentIndex + 1}/$_totalSlides',
        style: AppTextStyles.labelSmall.copyWith(
          color: Colors.white,
          fontSize: 8.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}


