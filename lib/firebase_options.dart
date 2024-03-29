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
        return macos;
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
    apiKey: 'AIzaSyBY5dqoJWSc6IX6td8F72y7cphVygYmrM8',
    appId: '1:764926777108:web:8085421729bc149aba9401',
    messagingSenderId: '764926777108',
    projectId: 'flutter-docterbooking',
    authDomain: 'flutter-docterbooking.firebaseapp.com',
    databaseURL: 'https://flutter-docterbooking-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-docterbooking.appspot.com',
    measurementId: 'G-T2WWPDCFGW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqOy7uuO1XaeW4US51h81idCZq14q2QvA',
    appId: '1:764926777108:android:1624633f3045d6cbba9401',
    messagingSenderId: '764926777108',
    projectId: 'flutter-docterbooking',
    databaseURL: 'https://flutter-docterbooking-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-docterbooking.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAl7kXeoSSh9YMHdPvn5SbURbreFwD7wh8',
    appId: '1:764926777108:ios:a345a0bd003b1e8cba9401',
    messagingSenderId: '764926777108',
    projectId: 'flutter-docterbooking',
    databaseURL: 'https://flutter-docterbooking-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-docterbooking.appspot.com',
    iosBundleId: 'com.example.sMedi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAl7kXeoSSh9YMHdPvn5SbURbreFwD7wh8',
    appId: '1:764926777108:ios:d626c168f6165f7fba9401',
    messagingSenderId: '764926777108',
    projectId: 'flutter-docterbooking',
    databaseURL: 'https://flutter-docterbooking-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-docterbooking.appspot.com',
    iosBundleId: 'com.example.sMedi.RunnerTests',
  );
}
