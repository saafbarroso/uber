import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC_Dzwx2AFeSyqYH4pHWMVCfPQ63cWWsyw",
            authDomain: "appuber-134d7.firebaseapp.com",
            projectId: "appuber-134d7",
            storageBucket: "appuber-134d7.appspot.com",
            messagingSenderId: "567820093352",
            appId: "1:567820093352:web:0bf7b34c1d020864cfbf9d"));
  } else {
    await Firebase.initializeApp();
  }
}
