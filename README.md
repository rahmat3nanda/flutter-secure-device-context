# secure_device_context

A powerful Flutter plugin designed to detect and retrieve your mobile application's environmental security context natively on both Android and iOS! Under the hood, this seamlessly bridges external native implementations via Swift Package Manager and JitPack to calculate an aggregate `RiskLevel`.

## Features
- Detect exactly if an environment has `dev_mode` enabled. (Android exclusively).
- Identify if the app is operating on a `isJailbreak` / `isRooted` physical or virtual system.
- Check cleanly for attached debuggers (`isDebugMode`).
- Differentiate between a live application versus an emulator (`isEmulator`).
- Seamlessly wrap all individual queries into an aggregate list of vulnerabilities (`contexts`), or score the current device against an exact `riskLevel` status (`secure`, `warning`, `critical`).

## Installation Methods

### Add within `pubspec.yaml`
Add `secure_device_context` beneath the `dependencies` block.

```yaml
dependencies:
  secure_device_context: ^1.0.0
```

### Android specific setup
By default, the Native bridge interacts with a Maven dependency hosted at Github. Ensure your project has explicitly designated `maven("https://jitpack.io")` inside its repository blocks so your Android builds succeed!

Navigate directly into your Flutter Project's `android/settings.gradle` (or `settings.gradle.kts`):
```kotlin
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.PREFER_PROJECT) // Allow generated plugins to override. 
    repositories {
        google()
        mavenCentral()
        maven("https://jitpack.io") // <- Necessary for resolving native bindings!
    }
}
```

### iOS Configuration
iOS takes advantage of Apple's recent integration handling of Swift Package Manager locally inside Flutter `3.x+` deployments! 

## Usage

```dart
import 'package:secure_device_context/secure_device_context.dart';

void fetchContext() async {
  final secureDevice = SecureDeviceContext();

  // Singular lookups
  final bool? isRooted = await secureDevice.isJailbreak;
  final bool? isSimulated = await secureDevice.isEmulator;

  // Retrieve an aggregated summary!
  final RiskLevel? risk = await secureDevice.riskLevel; 
  if (risk == RiskLevel.critical) {
    print("Device is Jailbroken/Rooted!");
  } else if (risk == RiskLevel.warning) {
    print("Device operates in debug mode, developer mode, or on an emulator.");
  } else {
    print("Secure environment validated.");
  }
}
```

## Natively Hosted Integrations
This wrapper was written on top of native packages directly:
- **Android**: `com.github.rahmat3nanda:android-secure-device-context`
- **iOS**: `https://github.com/rahmat3nanda/ios-secure-device-context.git`
