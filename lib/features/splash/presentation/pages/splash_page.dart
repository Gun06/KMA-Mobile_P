import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/constants/app_constants.dart';
import '../controllers/splash_controller.dart';
import 'loading_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late SplashController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SplashController(
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
      body: _buildSplashScreen(),
    );
  }

  Widget _buildSplashScreen() {
    return Center(
      child: AnimatedBuilder(
        animation: _controller.animationController,
        builder: (context, child) {
          return FadeTransition(
            opacity: _controller.fadeAnimation,
            child: ScaleTransition(
              scale: _controller.scaleAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: AppDimensions.logoSplash,
                        height: AppDimensions.logoSplash,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.background,
                          border: Border.all(
                            color: AppColors.primary,
                            width: AppDimensions.borderThick,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: AppDimensions.logoSplash,
                            height: AppDimensions.logoSplash,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: AppDimensions.spacingL),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '전/마/협',
                            style: AppTextStyles.splashTitle,
                          ),
                          SizedBox(height: AppDimensions.verticalS),
                          Text(
                            '전국마라톤협회',
                            style: AppTextStyles.splashSubtitle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}