import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC6IBOYLQbzIKvsjOSq6d2imVxWuIUfer0",
            authDomain: "envolv-b0b5wt.firebaseapp.com",
            projectId: "envolv-b0b5wt",
            storageBucket: "envolv-b0b5wt.firebasestorage.app",
            messagingSenderId: "426683330130",
            appId: "1:426683330130:web:758996e32f04c190e5f98b"));
  } else {
    await Firebase.initializeApp();
  }
}
