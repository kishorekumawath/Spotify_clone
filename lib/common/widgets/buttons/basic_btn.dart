import 'package:flutter/material.dart';

class BasicBtn extends StatelessWidget {
 final String text;
 final VoidCallback tap;
 final double? height;
  const BasicBtn({super.key, required this.text, required this.tap, this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80)
      ),
        onPressed: tap, child: Text(text,style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 20
        ),));
  }
}
