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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WHISTLE',
              style: textTheme.headline1,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('로그인'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
