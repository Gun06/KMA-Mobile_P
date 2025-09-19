# KMA Mobile

전국마라톤협회(KMA) 모바일 애플리케이션 - Flutter로 개발된 크로스 플랫폼 앱

## 📱 프로젝트 개요

KMA Mobile은 전국마라톤협회의 공식 모바일 애플리케이션입니다. Flutter를 사용하여 Android, iOS 플랫폼에서 동작하며, 마라톤 관련 정보 제공, 회원 관리, 이벤트 안내 등의 기능을 제공합니다.

### 🎯 주요 기능

- **스플래시 & 로딩 화면**: 앱 시작 시 브랜드 아이덴티티를 보여주는 애니메이션
- **홈 화면**: 메인 배너, 메뉴 섹션, 스폰서 정보 등 통합 대시보드
- **회원 인증**: 로그인 및 회원가입 기능
- **웹뷰 통합**: 웹 기반 콘텐츠를 앱 내에서 표시
- **반응형 UI**: 다양한 화면 크기에 최적화된 디자인

## 📸 스크린샷

### 앱 시작 화면

|                                                                        스플래시 페이지                                                                        |                                                                          로딩 페이지                                                                          |
| :-----------------------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <img width="310" height="655" alt="스크린샷 2025-09-17 오전 9 04 37" src="https://github.com/user-attachments/assets/20b24d94-c03f-4365-b6b1-0205e6a2721e" /> | <img width="310" height="655" alt="스크린샷 2025-09-17 오전 9 04 41" src="https://github.com/user-attachments/assets/e524d6ed-cbd4-41bf-b7c7-947b87a89a8d" /> |
|                                                             앱 시작 시 전/마/협 로고와 애니메이션                                                             |                                                                 데이터 로딩 중 표시되는 화면                                                                  |

### 메인 화면

|                                                                            홈 화면                                                                            |                                                                         로그인 페이지                                                                         |
| :-----------------------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <img width="310" height="655" alt="스크린샷 2025-09-17 오전 9 03 28" src="https://github.com/user-attachments/assets/ee099f60-c791-43e8-ae09-63f1c4c38aae" /> | <img width="310" height="655" alt="스크린샷 2025-09-17 오전 9 03 35" src="https://github.com/user-attachments/assets/856fde15-7df0-4da3-8852-ebc02b499e24" /> |
|                                                               메인 배너, 메뉴 섹션, 스폰서 정보                                                               |                                                                   회원 로그인 및 인증 화면                                                                    |

### 웹뷰 화면

|                                                                         웹뷰 페이지 1                                                                         |                                                                         웹뷰 페이지 2                                                                         |                                                                         웹뷰 페이지 3                                                                         |
| :-----------------------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <img width="310" height="655" alt="스크린샷 2025-09-17 오전 9 03 52" src="https://github.com/user-attachments/assets/fbb11553-9565-4b60-bea5-69530d76f5b6" /> | <img width="310" height="655" alt="스크린샷 2025-09-17 오전 9 11 21" src="https://github.com/user-attachments/assets/fa95f676-24e9-4469-a8eb-0261830f9498" /> | <img width="310" height="655" alt="스크린샷 2025-09-17 오전 9 04 16" src="https://github.com/user-attachments/assets/8846a918-8f0a-43c4-aea7-6834d1ef47d7" /> |
|                                                                        웹 콘텐츠 표시                                                                         |                                                                        웹 콘텐츠 표시                                                                         |                                                                        웹 콘텐츠 표시                                                                         |

## 🚀 시작하기

### 필수 요구사항

- **Flutter SDK**: 3.4.3 이상
- **Dart SDK**: 3.0.0 이상
- **개발 환경**: Android Studio / VS Code
- **iOS 개발**: Xcode (macOS에서만)

### 설치 및 실행

1. **저장소 클론**

   ```bash
   git clone [repository-url]
   cd KMA-Mobile
   ```

2. **의존성 설치**

   ```bash
   flutter pub get
   ```

3. **앱 실행**

   ```bash
   # 기본 실행 (연결된 디바이스에서)
   flutter run

   # 특정 디바이스에서 실행
   flutter run -d <device-id>

   # 디버그 모드로 실행
   flutter run --debug

   # 릴리즈 모드로 실행
   flutter run --release
   ```

4. **에뮬레이터 실행**

   ```bash
   # 사용 가능한 에뮬레이터 목록 확인
   flutter emulators

   # 에뮬레이터 실행
   flutter emulators --launch <emulator-id>

   # QEMU 에뮬레이터 실행 (macOS)
   qemu-system-aarch64 -avd Pixel_7_Pro_API_34
   ```

## 🏗️ 프로젝트 구조

```
lib/
├── core/                           # 핵심 기능
│   ├── constants/                  # 앱 상수 (AppConstants)
│   ├── theme/                      # 테마 설정 (색상, 텍스트 스타일, 차원)
│   ├── utils/                      # 유틸리티 함수
│   ├── services/                   # 서비스 레이어
│   └── errors/                     # 에러 처리
├── features/                       # 기능별 모듈
│   ├── splash/                     # 스플래시 & 로딩 화면
│   │   ├── presentation/
│   │   │   ├── pages/              # SplashPage, LoadingPage
│   │   │   └── controllers/        # SplashController, LoadingController
│   │   └── domain/                 # 비즈니스 로직
│   ├── home/                       # 홈 화면
│   │   └── presentation/
│   │       └── pages/              # HomePage
│   ├── auth/                       # 인증 기능
│   │   ├── presentation/
│   │   │   ├── pages/              # LoginPage, SignupPage
│   │   │   └── controllers/        # AuthController
│   │   └── domain/
│   └── profile/                    # 프로필 관리
│       └── presentation/
│           └── pages/              # ProfilePage
└── shared/                         # 공통 컴포넌트
    ├── widgets/                    # 재사용 가능한 위젯
    │   ├── common/                 # 공통 위젯 (AppHeader 등)
    │   └── sections/               # 섹션별 위젯 (HomeMenuSection 등)
    ├── models/                     # 데이터 모델
    ├── services/                   # 공통 서비스
    └── utils/                      # 공통 유틸리티
```

## 📦 주요 의존성

### 핵심 프레임워크

- **Flutter**: 3.22.2 (Stable Channel)
- **Dart**: 3.4.3

### 상태 관리 & 아키텍처

- **provider**: ^6.1.1 - 상태 관리
- **flutter_screenutil**: ^5.9.0 - 반응형 UI

### 네트워킹 & 데이터

- **http**: ^1.1.2 - HTTP 클라이언트
- **dio**: ^5.4.0 - 고급 HTTP 클라이언트
- **shared_preferences**: ^2.2.2 - 로컬 저장소
- **sqflite**: ^2.3.0 - SQLite 데이터베이스

### UI & 사용자 경험

- **cached_network_image**: ^3.3.1 - 이미지 캐싱
- **webview_flutter**: ^4.4.2 - 웹뷰 통합
- **lottie**: ^3.1.2 - 애니메이션
- **flutter_native_splash**: ^2.3.10 - 네이티브 스플래시

### 유틸리티

- **intl**: ^0.19.0 - 국제화
- **path_provider**: ^2.1.2 - 파일 경로 관리
- **flutter_launcher_icons**: ^0.13.1 - 앱 아이콘 생성

## 🎯 지원 플랫폼

- **Android**: API 21+ (Android 5.0+)
- **iOS**: 12.0+
- **Web**: 모든 모던 브라우저

## 🔧 개발 도구

### 코드 분석

```bash
# 코드 분석 및 린트 검사
flutter analyze

# 특정 파일 분석
flutter analyze lib/features/splash/
```

### 테스트 실행

```bash
# 모든 테스트 실행
flutter test

# 특정 테스트 파일 실행
flutter test test/widget_test.dart

# 커버리지와 함께 테스트 실행
flutter test --coverage
```

### 빌드

```bash
# Android APK 빌드
flutter build apk

# Android App Bundle (Google Play Store용)
flutter build appbundle

# iOS 빌드 (macOS에서만)
flutter build ios

# Web 빌드
flutter build web

# 릴리즈 모드로 빌드
flutter build apk --release
```

### 디버깅

```bash
# Flutter DevTools 실행
flutter run --debug

# 핫 리로드 (앱 실행 중)
# 터미널에서 'r' 키 입력

# 핫 리스타트 (앱 실행 중)
# 터미널에서 'R' 키 입력
```

## 🎨 디자인 시스템

### 색상 팔레트

- **Primary Green**: `#16A34A` - 메인 브랜드 컬러
- **Text Primary**: `#111827` - 주요 텍스트
- **Text Secondary**: `#6B7280` - 보조 텍스트
- **Text Tertiary**: `#9CA3AF` - 터치리어 텍스트
- **Background**: `#FFFFFF` - 배경색

### 타이포그래피

- **Giants**: 브랜드 타이틀용 (Bold, Regular)
- **Pretendard**: 본문 텍스트용 (Light, Regular, Medium, SemiBold, Bold, ExtraBold)
- **VitroCore**: 특별한 강조용

### 화면 크기

- **Design Size**: 375 x 812 (iPhone X 기준)
- **반응형**: `flutter_screenutil`을 통한 다양한 화면 크기 지원

## 🔒 보안

이 프로젝트는 보안을 중요하게 생각합니다. 다음 파일들은 Git에 포함되지 않습니다:

- API 키 및 시크릿 파일 (`.env`, `secrets.json`)
- 키스토어 파일 (`*.keystore`, `*.jks`)
- Firebase 설정 파일 (`google-services.json`)
- 인증서 파일 (`*.p8`, `*.p12`)
