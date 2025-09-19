import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 앱의 크기와 간격을 정의하는 파일
class AppDimensions {
  // Spacing
  static double get spacingXS => 4.w;
  static double get spacingS => 8.w;
  static double get spacingM => 16.w;
  static double get spacingL => 24.w;
  static double get spacingXL => 32.w;
  static double get spacingXXL => 48.w;
  
  // Vertical Spacing
  static double get verticalXS => 4.h;
  static double get verticalS => 8.h;
  static double get verticalM => 16.h;
  static double get verticalL => 24.h;
  static double get verticalXL => 32.h;
  static double get verticalXXL => 48.h;
  
  // Border Radius
  static double get radiusS => 4.r;
  static double get radiusM => 8.r;
  static double get radiusL => 12.r;
  static double get radiusXL => 16.r;
  static double get radiusXXL => 24.r;
  static double get radiusCircle => 50.r;
  
  // Logo Sizes
  static double get logoSplash => 80.w;
  static double get logoLoading => 56.w;
  static double get logoSmall => 40.w;
  
  // Border Widths
  static double get borderThin => 1.w;
  static double get borderMedium => 2.w;
  static double get borderThick => 3.w;
  
  // Icon Sizes
  static double get iconSmall => 16.w;
  static double get iconMedium => 24.w;
  static double get iconLarge => 32.w;
  static double get iconXL => 48.w;
  
  // Button Heights
  static double get buttonSmall => 32.h;
  static double get buttonMedium => 44.h;
  static double get buttonLarge => 56.h;
  
  // Loading Bar
  static double get loadingBarHeight => 4.h;
  static double get loadingBarWidth => 200.w;
}
