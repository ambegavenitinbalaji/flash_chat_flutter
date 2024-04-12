import 'package:flash_chat/Screens/login_screen.dart';
import 'package:flash_chat/Screens/register_screen.dart';
import 'package:flash_chat/Screens/reset_pass_screen.dart';
import 'package:flutter/material.dart';

import 'package:flash_chat/Utilities/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    child: Image.asset("assets/logo.png"),
                    width: (MediaQuery.of(context).size.width * 0.30),
                    height: (MediaQuery.of(context).size.height * 0.30),
                  ),
                ),
                Text(
                  "Flash Chat",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 10,
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      });
                    },
                  minWidth: 250.0,
                  height: 40.0,
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 20.0
                    ),
                  ),
                ),
              ),
             ),
            SizedBox(

            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 10,
                color: Colors.green,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                    });
                  },
                  minWidth: 250.0,
                  height: 40.0,
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
        );
      }
    }
    
