import 'package:flutter/material.dart';

class Room extends StatefulWidget {
  const Room({super.key});

  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
          ),
          Column(
            children: [
              Text('data'),
            ],
          )
        ],
      ),
    );
  }
}
