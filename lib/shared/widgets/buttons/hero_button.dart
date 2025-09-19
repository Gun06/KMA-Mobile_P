import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';

/// Hero Section용 버튼 위젯
class HeroButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final HeroButtonVariant variant;
  final HeroButtonTone tone;
  final HeroButtonSize size;
  final bool isLoading;

  const HeroButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = HeroButtonVariant.main,
    this.tone = HeroButtonTone.blue,
    this.size = HeroButtonSize.md,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        padding: _getPadding(),
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          border: _getBorder(),
        ),
        child: isLoading
            ? SizedBox(
                width: _getIconSize(),
                height: _getIconSize(),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(_getTextColor()),
                ),
              )
            : Text(
                text,
                style: _getTextStyle(),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case HeroButtonSize.xs:
        return EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingS,
          vertical: AppDimensions.verticalXS,
        );
      case HeroButtonSize.sm:
        return EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingM,
          vertical: AppDimensions.verticalS,
        );
      case HeroButtonSize.md:
        return EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingL,
          vertical: AppDimensions.verticalM,
        );
    }
  }

  double _getBorderRadius() {
    switch (size) {
      case HeroButtonSize.xs:
        return AppDimensions.radiusS;
      case HeroButtonSize.sm:
        return AppDimensions.radiusM;
      case HeroButtonSize.md:
        return AppDimensions.radiusL;
    }
  }

  Color _getBackgroundColor() {
    if (variant == HeroButtonVariant.outline) {
      return Colors.transparent;
    }
    
    switch (tone) {
      case HeroButtonTone.blue:
        return AppColors.primary;
      case HeroButtonTone.white:
        return Colors.white;
    }
  }

  Border? _getBorder() {
    if (variant == HeroButtonVariant.outline) {
      return Border.all(
        color: _getTextColor(),
        width: 1,
      );
    }
    return null;
  }

  Color _getTextColor() {
    if (variant == HeroButtonVariant.outline) {
      switch (tone) {
        case HeroButtonTone.blue:
          return AppColors.primary;
        case HeroButtonTone.white:
          return Colors.white;
      }
    }
    
    switch (tone) {
      case HeroButtonTone.blue:
        return Colors.white;
      case HeroButtonTone.white:
        return AppColors.textPrimary;
    }
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case HeroButtonSize.xs:
        return AppTextStyles.labelSmall.copyWith(
          color: _getTextColor(),
          fontWeight: FontWeight.w600,
        );
      case HeroButtonSize.sm:
        return AppTextStyles.labelMedium.copyWith(
          color: _getTextColor(),
          fontWeight: FontWeight.w600,
        );
      case HeroButtonSize.md:
        return AppTextStyles.bodyMedium.copyWith(
          color: _getTextColor(),
          fontWeight: FontWeight.w600,
        );
    }
  }

  double _getIconSize() {
    switch (size) {
      case HeroButtonSize.xs:
        return 12.w;
      case HeroButtonSize.sm:
        return 16.w;
      case HeroButtonSize.md:
        return 20.w;
    }
  }
}

enum HeroButtonVariant {
  main,
  outline,
}

enum HeroButtonTone {
  blue,
  white,
}

enum HeroButtonSize {
  xs,
  sm,
  md,
}
