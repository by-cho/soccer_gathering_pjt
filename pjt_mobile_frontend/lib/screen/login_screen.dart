import 'package:flutter/material.dart';
import 'package:pjt_mobile_frontend/constant/color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Center(
        child: Text(
          'WHISTLE',
          style: textTheme.headline1,
        ),
      ),
    );
  }
}
