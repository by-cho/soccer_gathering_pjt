// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:pjt_mobile_frontend/screen/home_screen.dart';

class GatheringRoom extends StatefulWidget {
  final List<Room> roomList;
  const GatheringRoom({required this.roomList, Key? key}) : super(key: key);
  @override
  State<GatheringRoom> createState() => _GatheringRoomState();
}

class _GatheringRoomState extends State<GatheringRoom> {
  @override
  Widget build(BuildContext context) {
    var roomList;
    return Container(
      height: 124,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[400]),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: Text(
                        '첼시',
                      ),
                    ),
                  ),
                ),
                Text(
                  '방제목입니다',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.place,
                      size: 16,
                    ),
                    Text('위치'),
                    Text(' ・ '),
                    Text('2023-12-24'),
                    Text(' ・ '),
                    Text('오후 12:25'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.people,
                      size: 16,
                    ),
                    Text('12'),
                    Text('/'),
                    Text('30'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
