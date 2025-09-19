# Animations 폴더

이 폴더는 앱에서 사용하는 애니메이션 파일들을 저장합니다.

## 폴더 구조

```
animations/
├── lottie/        # Lottie 애니메이션
├── gif/           # GIF 애니메이션
├── sprites/       # 스프라이트 시트
└── videos/        # 비디오 파일
```

## 지원 형식

- JSON (Lottie 애니메이션)
- GIF (간단한 애니메이션)
- MP4 (비디오)
- PNG (스프라이트 시트)

## 네이밍 규칙

- 소문자와 언더스코어 사용
- 예: `loading_spinner.json`, `success_check.gif`

## 사용 방법

Lottie 애니메이션 사용 예시:

```dart
import 'package:lottie/lottie.dart';

Lottie.asset('assets/animations/lottie/loading.json')
```
