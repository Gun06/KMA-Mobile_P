import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_text_styles.dart';

/// 스폰서 섹션 위젯
class SponsorSection extends StatefulWidget {
  const SponsorSection({super.key});

  @override
  State<SponsorSection> createState() => _SponsorSectionState();
}

class _SponsorSectionState extends State<SponsorSection>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  final List<String> _sponsorImages = [
    'assets/images/sponsor01.png',
    'assets/images/sponsor02.png',
    'assets/images/sponsor03.png',
    'assets/images/sponsor01.png',
    'assets/images/sponsor02.png',
    'assets/images/sponsor03.png',
    'assets/images/sponsor01.png',
    'assets/images/sponsor02.png',
    'assets/images/sponsor03.png',
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );

    _startAnimation();
  }

  void _startAnimation() {
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double sectionHeight = 80.h;
    return Container(
      height: sectionHeight,
      color: Colors.white,
      child: Stack(
        children: [
          _buildImageTrack(sectionHeight),
          _buildSponsorTitle(sectionHeight),
          _buildRightOverlay(sectionHeight),
          _buildBottomBorder(),
          _buildTopBorder(),
        ],
      ),
    );
  }

  Widget _buildImageTrack(double sectionHeight) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: ClipRect(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            final double imageSize = sectionHeight * 1.25;
            final double gap = 0;
            final double singleTrackWidth = imageSize * 9;
            final double imageHeight = imageSize;

            Widget buildTrack(String prefix) => SizedBox(
                  width: singleTrackWidth,
                  height: imageHeight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                        children: List.generate(9, (index) => _buildSponsorImage(
                          _sponsorImages[index],
                          '$prefix-$index',
                          addRightGap: false,
                          size: imageSize,
                          gap: gap,
                        )),
                  ),
                );

            double dx = -(_animationController.value * singleTrackWidth);
            dx = dx % singleTrackWidth;
            if (dx > 0) dx -= singleTrackWidth;

            dx -= singleTrackWidth / 2;
            dx = dx % singleTrackWidth;
            if (dx > 0) dx -= singleTrackWidth;

            final double dpr = MediaQuery.of(context).devicePixelRatio;
            dx = (dx * dpr).roundToDouble() / dpr;

            return Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                child: Stack(
                  children: [
                    Transform.translate(offset: Offset(dx, 0), child: buildTrack('s1')),
                    Transform.translate(offset: Offset(dx + singleTrackWidth, 0), child: buildTrack('s2')),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRightOverlay(double sectionHeight) {
    final double leftWidth = 50.w;
    final double rightWidth = leftWidth;
    return Positioned(
      right: 0,
      top: 0,
      bottom: 0,
      child: Container(
        width: rightWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Colors.white,
              Colors.white,
              Colors.white.withOpacity(0.0),
            ],
            stops: [0.0, 0.75, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildSponsorTitle(double sectionHeight) {
    final double leftWidth = 170.w;
    return Positioned(
      left: 0,
      top: 0,
      bottom: 0,
      child: Container(
        width: leftWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.white,
              Colors.white,
              Colors.white.withOpacity(0.0),
            ],
            stops: const [0.0, 0.7, 1.0],
          ),
        ),
        padding: EdgeInsets.only(left: 24.w),
        alignment: Alignment.centerLeft,
        child: Text(
          'SPONSOR',
          style: AppTextStyles.h2.copyWith(
            fontSize: (sectionHeight * 0.22).clamp(11.sp, 22.sp),
            fontWeight: FontWeight.w900,
            color: Colors.grey[900],
          ),
        ),
      ),
    );
  }

  Widget _buildSponsorImage(String imagePath, String key,
      {bool addRightGap = true, double? size, double? gap}) {
    return Container(
      key: ValueKey(key),
      height: size ?? 60.h,
      width: size ?? 60.h,
      margin: EdgeInsets.only(right: addRightGap ? (gap ?? 12.w) : 0),
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Center(
              child: Text(
                'SPONSOR',
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.grey[600],
                  fontSize: 8.sp,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomBorder() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: 2.h,
        color: Colors.grey[200],
      ),
    );
  }

  Widget _buildTopBorder() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        height: 2.h,
        color: Colors.grey[200],
      ),
    );
  }
}
