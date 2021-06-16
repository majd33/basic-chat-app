import 'package:chat_application/screens/authentication_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chat_application/screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        backgroundColor: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(buttonColor: Colors.deepPurple,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (mycontext, snapshot){
        if(snapshot.hasData) return chatscreen();
        else return AuthenticationScreen();
      },),
    );
  }
}

