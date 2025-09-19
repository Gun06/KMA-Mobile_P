import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/route_constants.dart';
import '../../../home/presentation/pages/home_page.dart';

/// 로딩 화면의 비즈니스 로직을 관리하는 컨트롤러
class LoadingController {
  late AnimationController progressController;
  late AnimationController fadeController;
  late Animation<double> progressAnimation;
  late Animation<double> fadeAnimation;
  
  final BuildContext context;
  
  LoadingController({
    required this.context,
    required TickerProvider vsync,
  }) {
    _setupAnimations(vsync);
  }
  
  void _setupAnimations(TickerProvider vsync) {
    progressController = AnimationController(
      duration: AppConstants.loadingDuration,
      vsync: vsync,
    );

    fadeController = AnimationController(
      duration: AppConstants.transitionDuration,
      vsync: vsync,
    );

    progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: progressController,
      curve: Curves.easeInOut,
    ));

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: fadeController,
      curve: Curves.easeIn,
    ));

    _startLoading();
  }
  
  void _startLoading() {
    fadeController.forward();
    progressController.forward().then((_) {
      _navigateToHome();
    });
  }
  
  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomePage(),
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
    progressController.dispose();
    fadeController.dispose();
  }
}
