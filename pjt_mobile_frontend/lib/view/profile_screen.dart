import 'package:flutter/material.dart';
import 'package:pjt_mobile_frontend/constant/color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Center(
        child: Text('profile'),
      ),
    );
  }
}
