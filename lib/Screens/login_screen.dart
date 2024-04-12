import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/Screens/chat_screen.dart';
import 'package:flash_chat/Utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login-screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool showSpinner = false;

    return Scaffold(
      body: ModalProgressHUD(
        color: Colors.black,
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                child: Image.asset('assets/logo.png'),
                width: (MediaQuery.of(context).size.width * 0.30),
                height: (MediaQuery.of(context).size.height * 0.30),
              ),
            ),
            Text(
              "Log In",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 300.0,
              child: TextField(
                  onChanged: (value) {
                    emailController.text = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email_outlined))),
            ),
            SizedBox(
              height: 15.0,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                  onChanged: (value) {
                    passwordController.text = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.lock_outlined))),
            ),
            SizedBox(
              height: 15.0,
            ),
            SizedBox(
                width: 200.0,
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text);
                      if (user != null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatScreen()));
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text("Log In"),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellowAccent)),
                ))
          ],
        ),
      ),
    );
  }
}
