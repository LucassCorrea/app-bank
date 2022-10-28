// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ButtonAppBar extends StatelessWidget {
  final Color color;
  final void Function()? onpressed;
  const ButtonAppBar({
    this.color = const Color(0xffB938E0),
    required this.onpressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onpressed,
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: color,
      ),
    );
  }
}
