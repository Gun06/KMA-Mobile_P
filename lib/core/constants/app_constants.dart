/// 앱의 핵심 상수들을 정의하는 파일
class AppConstants {
  // 앱 정보
  static const String appName = 'KMA Mobile';
  static const String appVersion = '1.0.0';
  
  // 애니메이션 지속 시간
  static const Duration splashDuration = Duration(milliseconds: 3000);
  static const Duration loadingDuration = Duration(seconds: 5);
  static const Duration transitionDuration = Duration(milliseconds: 500);
  
  // 화면 크기
  static const double designWidth = 375.0;
  static const double designHeight = 812.0;
  
  // 폰트 패밀리
  static const String fontFamilyPretendard = 'Pretendard';
  static const String fontFamilyGiants = 'Giants';
  static const String fontFamilyVitroCore = 'VitroCore';
  
  // 색상
  static const int primaryGreen = 0xFF16A34A;
  static const int textPrimary = 0xFF111827;
  static const int textSecondary = 0xFF6B7280;
  static const int textTertiary = 0xFF9CA3AF;
}