import 'package:flutter/material.dart';

/// 앱의 색상 팔레트를 정의하는 파일
class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF16A34A); // green-600
  static const Color primaryLight = Color(0xFF22C55E); // green-500
  static const Color primaryDark = Color(0xFF15803D); // green-700
  
  // Text Colors
  static const Color textPrimary = Color(0xFF111827); // gray-900
  static const Color textSecondary = Color(0xFF6B7280); // gray-500
  static const Color textTertiary = Color(0xFF9CA3AF); // gray-400
  static const Color textDisabled = Color(0xFFD1D5DB); // gray-300
  
  // Background Colors
  static const Color background = Color(0xFFFFFFFF); // white
  static const Color backgroundSecondary = Color(0xFFF9FAFB); // gray-50
  static const Color backgroundTertiary = Color(0xFFF3F4F6); // gray-100
  
  // Border Colors
  static const Color border = Color(0xFFE5E7EB); // gray-200
  static const Color borderLight = Color(0xFFF3F4F6); // gray-100
  static const Color borderDark = Color(0xFFD1D5DB); // gray-300
  
  // Status Colors
  static const Color success = Color(0xFF10B981); // emerald-500
  static const Color warning = Color(0xFFF59E0B); // amber-500
  static const Color error = Color(0xFFEF4444); // red-500
  static const Color info = Color(0xFF3B82F6); // blue-500
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient loadingGradient = LinearGradient(
    colors: [primary, primaryLight, primary],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
