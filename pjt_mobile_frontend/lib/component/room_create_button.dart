import 'package:flutter/material.dart';

class RoomCreateButton extends StatefulWidget {
  const RoomCreateButton({super.key});

  @override
  State<RoomCreateButton> createState() => _RoomCreateButtonState();
}

class _RoomCreateButtonState extends State<RoomCreateButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
        ),
        onPressed: () {
          print('hi');
        },
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '우리팀 모여라! 모임 만들기',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  '우리 동네 응원 모임을 만들어요',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
