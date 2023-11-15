import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  final String title;
  const TitleTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
