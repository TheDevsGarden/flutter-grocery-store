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
    apiKey: '',
    appId: '1:997553044712:web:3e9063fe12e7245f74dd5d',
    messagingSenderId: '997553044712',
    projectId: 'testing-firestore-flutter',
    authDomain: 'testing-firestore-flutter.firebaseapp.com',
    storageBucket: 'testing-firestore-flutter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: '',
    appId: '1:997553044712:android:ed3de768c215919474dd5d',
    messagingSenderId: '997553044712',
    projectId: 'testing-firestore-flutter',
    storageBucket: 'testing-firestore-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: '',
    appId: '1:997553044712:ios:dbfd6790f69050e974dd5d',
    messagingSenderId: '997553044712',
    projectId: 'testing-firestore-flutter',
    storageBucket: 'testing-firestore-flutter.appspot.com',
    iosClientId: '997553044712-ufhste8ipm82f8qvl13vo13p1sh5r3np.apps.googleusercontent.com',
    iosBundleId: 'com.example.testFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: '',
    appId: '1:997553044712:ios:fd3748a4af1df83274dd5d',
    messagingSenderId: '997553044712',
    projectId: 'testing-firestore-flutter',
    storageBucket: 'testing-firestore-flutter.appspot.com',
    iosClientId: '997553044712-tudq4afqjigb9a0tjifqiqgok4c1jmdi.apps.googleusercontent.com',
    iosBundleId: 'com.example.testFlutter.RunnerTests',
  );
}
