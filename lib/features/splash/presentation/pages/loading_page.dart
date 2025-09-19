import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/constants/app_constants.dart';
import '../controllers/loading_controller.dart';
import '../../../home/presentation/pages/home_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late LoadingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LoadingController(
      context: context,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: FadeTransition(
        opacity: _controller.fadeAnimation,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.spacingL),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 56.w,
                      height: 56.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFF16A34A),
                          width: 2.5.w,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 56.w,
                          height: 56.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '전/마/협',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF111827),
                            fontFamily: 'Giants',
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          '전국마라톤협회',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF9CA3AF),
                            fontFamily: 'Pretendard',
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                SizedBox(height: 60.h),
                
                Column(
                  children: [
                    Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF111827),
                              fontFamily: 'Giants',
                              height: 1.4,
                            ),
                            children: [
                              const TextSpan(text: '회원 수 '),
                              TextSpan(
                                text: '3만명',
                                style: TextStyle(
                                  color: const Color(0xFF3B82F6),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const TextSpan(text: ', 누적 완주 거리'),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.h),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF111827),
                              fontFamily: 'Giants',
                              height: 1.4,
                            ),
                            children: [
                              TextSpan(
                                text: '120만 km',
                                style: TextStyle(
                                  color: const Color(0xFF10B981),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const TextSpan(text: ' 달성!'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 24.h),
                    
                    Column(
                      children: [
                        Text(
                          '누적된 발걸음이 하나의 큰 꿈이 되었습니다.',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF111827),
                            fontFamily: 'Pretendard',
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          '그 길 위에서, 우리는 함께 꿈을 완주합니다.',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF111827),
                            fontFamily: 'Pretendard',
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
                
                SizedBox(height: 60.h),
                
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: const Color(0xFFE5E7EB),
                      ),
                      child: AnimatedBuilder(
                        animation: _controller.progressAnimation,
                        builder: (context, child) {
                          return Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9 * _controller.progressAnimation.value,
                                height: 8.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF3B82F6),
                                      Color(0xFF10B981),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    
                    SizedBox(height: 40.h),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
