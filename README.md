# WhatsApp UI Clone - Flutter

A Flutter project that replicates the core UI components of WhatsApp. This implementation focuses on the frontend only, creating a visually accurate clone of WhatsApp's interface.

## Features

- Chat list screen with recent conversations
- Status screen showing story circles
- Calls screen with recent call history
- Custom app bar with WhatsApp's signature design
- Floating action button for new chats/status
- Dark mode toggle

## Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code
- iOS development setup (for iOS builds)
- Android development setup (for Android builds)

## Required Dependencies

Add these to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1
```

## Project Structure

```
├── lib/
│ ├── main.dart
│ ├── constants/
│ │ └── app_colors.dart
│ ├── pages/
│ │ ├── home_page.dart
│ │ └── widgets/
│ │ ├── calls_page_widgets/
│ │ │ └── calls.dart
│ │ ├── chats_page_widgets/
│ │ │ └── chat.dart
│ │ ├── communities_page_widgets/
│ │ │ └── communities.dart
│ │ └── updates_page_widgets/
│ │ └── updates.dart
│ ├── provider/
│ │ ├── menu_provider.dart
│ │ ├── navigation_provider.dart
│ │ └── theme_provider.dart
│ ├── theme/
│ │ ├── app_theme.dart
│ │ ├── dark_theme.dart
│ │ └── light_theme.dart
│ └── utils/
│ ├── mock_data.dart
│ └── screen_util.dart
```

## Theme Configuration

Use these colors to match WhatsApp's theme:

```dart
// Light Theme
final lightTheme = ThemeData(
  primaryColor: Color(0xFF075E54),
  colorScheme: ColorScheme.light(
    primary: Color(0xFF075E54),
    secondary: Color(0xFF128C7E),
  ),
);

// Dark Theme
final darkTheme = ThemeData(
  primaryColor: Color(0xFF1F2C34),
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF1F2C34),
    secondary: Color(0xFF00A884),
  ),
);
```

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Set up your iOS/Android development environment
4. Run `flutter run` to start the app

## Recommended Features for Future Implementation

- Push notifications
- Message persistence
- End-to-end encryption
- Voice and video calling
- Media sharing
- Contact sync
- Message search
- Chat archiving

Would you like me to provide any specific implementation details or explain any part of the structure in more detail?
