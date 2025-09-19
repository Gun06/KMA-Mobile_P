import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import '../constants/app_constants.dart';

/// 앱의 텍스트 스타일을 정의하는 파일
class AppTextStyles {
  // Headers
  static TextStyle get h1 => TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    fontFamily: AppConstants.fontFamilyGiants,
    height: 1.1,
  );
  
  static TextStyle get h2 => TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFamily: AppConstants.fontFamilyGiants,
    height: 1.2,
  );
  
  static TextStyle get h3 => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: AppConstants.fontFamilyPretendard,
    height: 1.2,
  );
  
  // Body Text
  static TextStyle get bodyLarge => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    fontFamily: AppConstants.fontFamilyPretendard,
    height: 1.4,
  );
  
  static TextStyle get bodyMedium => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    fontFamily: AppConstants.fontFamilyPretendard,
    height: 1.4,
  );
  
  static TextStyle get bodySmall => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    fontFamily: AppConstants.fontFamilyPretendard,
    height: 1.4,
  );
  
  // Labels
  static TextStyle get labelLarge => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
    fontFamily: AppConstants.fontFamilyPretendard,
    height: 1.1,
  );
  
  static TextStyle get labelMedium => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    fontFamily: AppConstants.fontFamilyPretendard,
    height: 1.2,
  );
  
  static TextStyle get labelSmall => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textTertiary,
    fontFamily: AppConstants.fontFamilyPretendard,
    height: 1.2,
  );
  
  // Special Styles
  static TextStyle get splashTitle => TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    fontFamily: AppConstants.fontFamilyGiants,
    height: 1.1,
  );
  
  static TextStyle get splashSubtitle => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
    fontFamily: AppConstants.fontFamilyPretendard,
    height: 1.1,
  );
  
  static TextStyle get loadingTitle => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: AppConstants.fontFamilyGiants,
    height: 1.2,
  );
  
  static TextStyle get loadingSubtitle => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    fontFamily: AppConstants.fontFamilyPretendard,
    height: 1.2,
  );
}
