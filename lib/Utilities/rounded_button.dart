import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({required this.title, required this.colour, required this.onTap});
  final String title;
  final Color colour;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Material(
        elevation: 5.0,
      color: colour,
      child: MaterialButton(
          onPressed: onTap(),
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          title
        ),
      ),
    ),
    );
  }
}
