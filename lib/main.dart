import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/Screens/welcome_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: const FirebaseOptions(
      //     apiKey: 'AIzaSyDCnp0Q3zIg4ORKJ__VTd1vZJAkUKA8OaE',
      //     appId: '1:611279983378:android:03c8341fb428adf8b4d9cb',
      //     messagingSenderId: '611279983378',
      //     projectId: 'flash-chat-8c513'
      // )
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan)),
      home: WelcomeScreen(),
    );
  }
}
