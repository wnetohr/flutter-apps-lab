import 'package:flutter/material.dart';

class Mybuttons extends StatelessWidget {
  final buttoncolor;
  final textColor;
  final String textButton;
  final buttontapped;

  Mybuttons(
      {this.buttoncolor, this.textColor, this.textButton, this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: buttoncolor,
            child: Center(
              child: Text(
                textButton,
                style: TextStyle(color: textColor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
