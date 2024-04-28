import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_api_firebase/controller/logincontroller.dart';
import 'package:sample_api_firebase/controller/registrationcontroller.dart';
import 'package:sample_api_firebase/view/homepage/homescreen.dart';
import 'package:sample_api_firebase/view/login/login.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
  options: FirebaseOptions(apiKey:  "AIzaSyB_xpQXF3Iz4y2cPh5-TK-TRqoZqB5QGYo",
   appId: "1:542055759500:android:e65aa68d845c41279c05a9",
    messagingSenderId: "",
     projectId: "task-sample-firebase",
    storageBucket:  "task-sample-firebase.appspot.com")
 );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegistrationScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginScreenController(),
        )
      ],
      child: MaterialApp(
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            } else {
              return Login();
            }
          },
        ),
      ),
    );
  }
}