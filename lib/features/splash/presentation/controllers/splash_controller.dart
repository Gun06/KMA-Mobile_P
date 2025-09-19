import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/route_constants.dart';
import '../pages/loading_page.dart';

/// 스플래시 화면의 비즈니스 로직을 관리하는 컨트롤러
class SplashController {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;
  
  final BuildContext context;
  
  SplashController({
    required this.context,
    required TickerProvider vsync,
  }) {
    _setupAnimations(vsync);
  }
  
  void _setupAnimations(TickerProvider vsync) {
    animationController = AnimationController(
      duration: AppConstants.splashDuration,
      vsync: vsync,
    );

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
    ));

    scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
    ));

    _startSplashAnimation();
  }
  
  void _startSplashAnimation() {
    animationController.forward().then((_) {
      _navigateToLoading();
    });
  }
  
  void _navigateToLoading() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoadingPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: AppConstants.transitionDuration,
      ),
    );
  }
  
  void dispose() {
    animationController.dispose();
  }
}
