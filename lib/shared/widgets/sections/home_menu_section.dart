import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';
import '../../../features/auth/presentation/pages/webview_page.dart';

/// 홈 화면의 3x3 메뉴 그리드 섹션
class HomeMenuSection extends StatelessWidget {
  const HomeMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_MenuItem> items = [
      _MenuItem('대회일정', 'assets/images/menu_schedule.png'),
      _MenuItem('공지사항', 'assets/images/menu_notice.png'),
      _MenuItem('문의사항', 'assets/images/menu_inquiry.png'),
      _MenuItem('대회 갤러리', 'assets/images/menu_photo.png'),
      _MenuItem('쇼핑몰', 'assets/images/menu_cart.png'),
      _MenuItem('정보 수정', 'assets/images/menu_info.png'),
      _MenuItem('마이페이지', 'assets/images/menu_mypage.png'),
      _MenuItem('홈페이지', 'assets/images/menu_homepage.png'),
      _MenuItem('인증서 확인', 'assets/images/menu_record.png'),
    ];

    return Container(
      color: AppColors.info.withOpacity(0.0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 0),
          Padding(
            padding: EdgeInsets.only(left: 6.w),
            child: Text(
              '메뉴',
              style: AppTextStyles.h2.copyWith(
                fontWeight: FontWeight.w900,
                color: Colors.black87,
                fontSize: 16.sp,
              ),
            ),
          ),
          SizedBox(height: 0),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 16.w,
              childAspectRatio: 1,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return _MenuCard(item: item);
            },
          ),
          SizedBox(height: 4.h),
        ],
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final _MenuItem item;
  const _MenuCard({required this.item});

  void _handleMenuTap(BuildContext context, String title) {
    String url;
    String pageTitle;
    
    switch (title) {
      case '홈페이지':
        url = 'https://www.newrun1080.com/';
        pageTitle = '전국마라톤협회 홈페이지';
        break;
      case '공지사항':
        url = 'https://www.newrun1080.com/notice';
        pageTitle = '공지사항';
        break;
      case '대회일정':
        url = 'https://www.newrun1080.com/schedule';
        pageTitle = '대회일정';
        break;
      case '마이페이지':
        url = 'https://www.newrun1080.com/mypage/applications';
        pageTitle = '마이페이지';
        break;
      case '인증서 확인':
        url = 'https://www.newrun1080.com/mypage/certificates';
        pageTitle = '인증서 확인';
        break;
      case '문의사항':
        url = 'https://www.newrun1080.com/notice/inquiry';
        pageTitle = '문의사항';
        break;
      default:
        // TODO: 다른 메뉴들 구현
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$title 메뉴는 준비 중입니다.'),
            duration: const Duration(seconds: 2),
          ),
        );
        return;
    }
    
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WebViewPage(
          url: url,
          title: pageTitle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: () => _handleMenuTap(context, item.title),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50.w,
              height: 50.w,
              child: Image.asset(
                item.assetPath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.image_not_supported_outlined, size: 35.w, color: Colors.grey[400]);
                },
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              item.title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.black87,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final String assetPath;
  const _MenuItem(this.title, this.assetPath);
}


