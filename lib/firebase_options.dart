// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDALn1w1NHnE-mI4e1TCz04s_kt_3-HsXY',
    appId: '1:547184390356:web:85b2a627ac36a5feebcb41',
    messagingSenderId: '547184390356',
    projectId: 'ecg-app-1b736',
    authDomain: 'ecg-app-1b736.firebaseapp.com',
    storageBucket: 'ecg-app-1b736.appspot.com',
    measurementId: 'G-4H197S7SE0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBt7h7IWwMhA9DbumgYAHPYoBPzsejqYn4',
    appId: '1:547184390356:android:95b36dbcb88d7e2eebcb41',
    messagingSenderId: '547184390356',
    projectId: 'ecg-app-1b736',
    storageBucket: 'ecg-app-1b736.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAltkeh4hb5DIyxmdGJ4PzMdXrdXTpUVJw',
    appId: '1:547184390356:ios:0c42e622dbd20a74ebcb41',
    messagingSenderId: '547184390356',
    projectId: 'ecg-app-1b736',
    storageBucket: 'ecg-app-1b736.appspot.com',
    iosClientId: '547184390356-a1co6u8tglrp65fsv4lhmdj8nt8pf057.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecgApp',
  );
}