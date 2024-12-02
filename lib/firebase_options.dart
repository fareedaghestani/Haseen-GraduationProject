// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC72K-GRYnObTb-YzDA0bvBnAxXeowgUwI',
    appId: '1:445891354343:android:67bc7db6a285cd7b194c42',
    messagingSenderId: '445891354343',
    projectId: 'saudigard-403d8',
    storageBucket: 'saudigard-403d8.firebasestorage.app',
  );
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyD7vknnFKL1Cgu0_wmFwFpmzeb631oy-uI",
    authDomain: "saudigard-403d8.firebaseapp.com",
    projectId: "saudigard-403d8",
    storageBucket: "saudigard-403d8.firebasestorage.app",
    messagingSenderId: "445891354343",
    appId: "1:445891354343:web:38d916102fe3faf7194c42",
    measurementId: "G-36VQLD71VR",
  );
}