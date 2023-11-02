import 'package:flutter/material.dart';
import 'package:pjt_mobile_frontend/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200], // 배경색을 파란색으로 변경
      ),
      home: HomeScreen(),
    ),
  );
}
