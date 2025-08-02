# Aseto Assignment - Flutter Android Setup and Run Guide

## Prerequisites

1. Install Flutter SDK: [flutter.dev](https://docs.flutter.dev/get-started/install)
2. Install Android Studio: [developer.android.com](https://developer.android.com/studio)
3. Accept Android licenses: `flutter doctor --android-licenses`

## Running Your Flutter App on Android

### Method 1: Using Command Line

1. `cd` to your project directory
2. Check connected devices: `flutter devices`
3. Run the app: `flutter run`

### Method 2: Using Android Studio

1. Open your Flutter project
2. Select your target device
3. Click the **Run** button

### Method 3: Using VS Code

1. Open your Flutter project
2. Press `F5` or go to **Run** > **Start Debugging**
3. Select your target device when prompted

## Useful Commands

- Check Flutter installation: `flutter doctor`
- List connected devices: `flutter devices`
- Clean build cache: `flutter clean`
- Build APK: `flutter build apk`
- Build for release: `flutter build apk --release`
- Install APK: `flutter install`

## Build Configurations

- Debug Build (Default): `flutter run`
- Release Build: `flutter run --release`
- Profile Build: `flutter run --profile`

## Project Structure

```
lib/
├── main.dart
└── src/
    ├── common/
    │   ├── colors.dart
    │   ├── custom_textfield.dart
    │   └── toast.dart
    └── screens/
        └── create_account.dart
```

## Next Steps

1. Verify your Flutter installation: `flutter doctor`
2. Connect your Android device or start an emulator
3. Navigate to the project directory
4. Run `flutter run` to launch your app

For more detailed information, visit the [official Flutter documentation](https://docs.flutter.dev/get-started/test-drive).
