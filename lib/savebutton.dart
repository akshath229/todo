import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String text;

  VoidCallback onPressed;
   Mybutton({super.key,
     required this.text,
     required this.onPressed,
   });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      minWidth: 100,

    );
  }
}
