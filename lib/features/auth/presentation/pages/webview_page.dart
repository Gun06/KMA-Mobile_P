import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  const WebViewPage({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  WebViewWidget(controller: _controller),
                  if (_isLoading)
                    Container(
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: AppColors.primary,
                              strokeWidth: 2,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              '페이지를 불러오는 중...',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: const Color(0xFF666666),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: const Color(0xFFE5E7EB),
            width: 1.h,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildNavButton(
              icon: Icons.arrow_back_ios,
              onTap: () async {
                if (await _controller.canGoBack()) {
                  _controller.goBack();
                }
              },
            ),
          ),
          Expanded(
            child: _buildNavButton(
              icon: Icons.arrow_forward_ios,
              onTap: () async {
                if (await _controller.canGoForward()) {
                  _controller.goForward();
                }
              },
            ),
          ),
          Expanded(
            child: _buildNavButton(
              icon: Icons.home,
              onTap: () {
                _controller.loadRequest(Uri.parse(widget.url));
              },
            ),
          ),
          Expanded(
            child: _buildNavButton(
              icon: Icons.close,
              onTap: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        child: Icon(
          icon,
          size: 24.w,
          color: const Color(0xFF111827),
        ),
      ),
    );
  }
}
