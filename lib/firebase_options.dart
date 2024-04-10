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
    apiKey: 'AIzaSyBLTGzB9ZWlaXtirdnxIg_mnT9JrZvY2Yk',
    appId: '1:1033707395241:web:5c4d4b4d2197f1068931b8',
    messagingSenderId: '1033707395241',
    projectId: 'foodybite-35e6a',
    authDomain: 'foodybite-35e6a.firebaseapp.com',
    storageBucket: 'foodybite-35e6a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBL-WZgzwojZLaiOqS0wZaUm7ZrnHvEEEU',
    appId: '1:1033707395241:android:91e41d2c215f883c8931b8',
    messagingSenderId: '1033707395241',
    projectId: 'foodybite-35e6a',
    storageBucket: 'foodybite-35e6a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUVtEPVeP5utAmSCjoDDjeDuPiJJ1CkKQ',
    appId: '1:1033707395241:ios:3326e4c3da9c8c328931b8',
    messagingSenderId: '1033707395241',
    projectId: 'foodybite-35e6a',
    storageBucket: 'foodybite-35e6a.appspot.com',
    iosBundleId: 'com.example.foodybite',
  );
}