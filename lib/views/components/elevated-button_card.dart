// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ElevatedButtonCard extends StatelessWidget {
  final String text;
  final Color color;
  final Color colorBorder;
  final IconData icon;
  final void Function()? onpressed;

  const ElevatedButtonCard({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.colorBorder = Colors.black,
    required this.icon,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0,
        side: BorderSide(color: colorBorder),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: colorBorder,
          ),
          AutoSizeText(
            text,
            minFontSize: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Roboto',
              color: colorBorder,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
