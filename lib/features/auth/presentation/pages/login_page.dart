import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_dimensions.dart';
import 'webview_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  
  bool _isLoading = false;
  bool _rememberId = false;
  String? _errorMessage;
  Map<String, String> _fieldErrors = {};

  @override
  void initState() {
    super.initState();
    _loadRememberedId();
  }

  void _loadRememberedId() {
    // TODO: SharedPreferences에서 저장된 아이디 불러오기
  }

  void _handleInputChange(String field, String value) {
    setState(() {
      if (_fieldErrors.containsKey(field)) {
        _fieldErrors.remove(field);
      }
      if (_errorMessage != null) {
        _errorMessage = null;
      }
    });
  }

  void _handleRememberIdChange(bool value) {
    setState(() {
      _rememberId = value;
    });
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _fieldErrors = {};
    });

    try {
      // TODO: 실제 로그인 API 호출
      await Future.delayed(const Duration(seconds: 2)); // 임시 딜레이
      
      if (_rememberId) {
        // TODO: SharedPreferences에 아이디 저장
      }
      
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('로그인되었습니다.')),
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildHeader(),
                      SizedBox(height: 48.h),
                      _buildLoginForm(),
                      SizedBox(height: 20.h),
                      _buildLoginButton(),
                      SizedBox(height: 32.h),
                      _buildOptions(),
                      SizedBox(height: 32.h),
                      _buildFooter(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 40.w,
              height: 40.w,
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 20.w,
                color: const Color(0xFF111827),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary,
                  width: 3.w,
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 60.w,
                  height: 60.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '전/마/협',
                  style: AppTextStyles.h1.copyWith(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF111827),
                    fontFamily: 'Giants',
                    height: 1.0,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '전국마라톤협회',
                  style: AppTextStyles.h3.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF999999),
                    fontFamily: 'Pretendard',
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Text(
          '회원 서비스 이용을 위해 로그인해 주세요',
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 15.sp,
            color: const Color(0xFF898989),
            fontFamily: 'Pretendard',
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTextField(
            controller: _idController,
            hintText: 'ID',
            onChanged: (value) => _handleInputChange('id', value),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return '아이디를 입력해주세요.';
              }
              return null;
            },
          ),
          SizedBox(height: 12.h),
          _buildTextField(
            controller: _passwordController,
            hintText: 'Password',
            obscureText: true,
            onChanged: (value) => _handleInputChange('password', value),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return '비밀번호를 입력해주세요.';
              }
              return null;
            },
          ),
          if (_errorMessage != null) ...[
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF2F2),
                border: Border.all(color: const Color(0xFFFECACA)),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                _errorMessage!,
                style: AppTextStyles.bodySmall.copyWith(
                  color: const Color(0xFFDC2626),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    required Function(String) onChanged,
    String? Function(String?)? validator,
  }) {
    return Container(
      width: double.infinity,
      height: 70.h,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        validator: validator,
        style: AppTextStyles.bodyLarge.copyWith(
          fontSize: 18.sp,
          color: const Color(0xFF111827),
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.bodyLarge.copyWith(
            fontSize: 18.sp,
            color: const Color(0xFF9CA3AF),
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: const BorderSide(color: Color(0xFFDFE0E4)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: const BorderSide(color: Color(0xFFDFE0E4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(color: AppColors.primary, width: 2.w),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: const BorderSide(color: Color(0xFFDC2626)),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: double.infinity,
      height: 70.h,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleSubmit,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
        ).copyWith(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF60A5FA), Color(0xFF10B981)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(5.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: _isLoading
                ? SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    '로그인',
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptions() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20.w),
            GestureDetector(
              onTap: () => _handleRememberIdChange(!_rememberId),
              child: Container(
                width: 20.w,
                height: 20.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _rememberId ? AppColors.primary : const Color(0xFFD1D5DB),
                    width: 2.w,
                  ),
                  color: _rememberId ? AppColors.primary : Colors.transparent,
                ),
                child: _rememberId
                    ? Icon(
                        Icons.check,
                        size: 12.w,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              '로그인 상태 유지하기',
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF6B7280),
              ),
            ),
          ],
        ),
        SizedBox(height: 32.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLink('아이디 찾기', '/find-id'),
            SizedBox(width: 24.w),
            Container(width: 1.w, height: 16.h, color: const Color(0xFFD1D5DB)),
            SizedBox(width: 24.w),
            _buildLink('비밀번호 찾기', '/find-password'),
            SizedBox(width: 24.w),
            Container(width: 1.w, height: 16.h, color: const Color(0xFFD1D5DB)),
            SizedBox(width: 24.w),
            _buildLink('회원가입', '/signup'),
          ],
        ),
      ],
    );
  }

  Widget _buildLink(String text, String route) {
    return GestureDetector(
      onTap: () {
        if (route == '/signup') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const WebViewPage(
                url: 'https://www.newrun1080.com/signup/step1',
                title: '회원가입',
              ),
            ),
          );
        } else {
          // TODO: 다른 라우팅 구현
          print('Navigate to $route');
        }
      },
      child: Text(
        text,
        style: AppTextStyles.bodySmall.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF6B7280),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Container(
          height: 1.h,
          color: const Color(0xFFE5E7EB),
        ),
        SizedBox(height: 16.h),
        Text(
          '© 2025. RUN1080. All Right Reserved.',
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFAEAEB2),
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFooterLink('전국 마라톤 협회 공식 사이트', '/'),
            SizedBox(width: 16.w),
            Container(width: 1.w, height: 12.h, color: const Color(0xFFD1D5DB)),
            SizedBox(width: 16.w),
            _buildFooterLink('개인정보처리방침', '/privacy'),
          ],
        ),
      ],
    );
  }

  Widget _buildFooterLink(String text, String route) {
    return GestureDetector(
      onTap: () {
        // TODO: 라우팅 구현
        print('Navigate to $route');
      },
      child: Text(
        text,
        style: AppTextStyles.bodySmall.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xFFAEAEB2),
        ),
      ),
    );
  }
}
