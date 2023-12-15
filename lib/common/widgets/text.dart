import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextStyle style;
  const MyText({super.key, required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      textAlign: TextAlign.left,
      softWrap: false,
      overflow: TextOverflow.fade,
      style: style,
    );
  }
}
