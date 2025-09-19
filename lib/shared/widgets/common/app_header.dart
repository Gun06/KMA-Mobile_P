import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../features/auth/presentation/pages/login_page.dart';

/// 앱의 상단 헤더 위젯
class AppHeader extends StatelessWidget {
  final VoidCallback? onHomeTap;
  
  const AppHeader({
    super.key,
    this.onHomeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Container(
          height: 56.h, // AppBar 표준 높이
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.spacingM),
          child: Row(
        children: [
          // 왼쪽: 로고와 제목
          Expanded(
            child: Row(
              children: [
                // 로고
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.background,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 40.w,
                      height: 40.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: AppDimensions.spacingM),
                
                // 제목
                Text(
                  '전국마라톤협회',
                  style: AppTextStyles.h2.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey[900],
                  ),
                ),
              ],
            ),
          ),
          
          // 오른쪽: 버튼들
          Row(
            children: [
              // 로그인 버튼
              _buildLoginButton(context),
              SizedBox(width: AppDimensions.spacingS),
              
              // 홈 버튼
              _buildIconButton(
                icon: Icons.home_outlined,
                onTap: onHomeTap,
              ),
            ],
          ),
        ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildLoginButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          '로그인',
          style: AppTextStyles.bodySmall.copyWith(
            color: const Color(0xFF111827),
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        ),
        child: Icon(
          icon,
          size: 20.w,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
