import 'package:flutter/material.dart';
import 'package:pjt_mobile_frontend/screen/home_screen.dart';

class GatherDetail extends StatefulWidget {
  final Room data; // Room 데이터를 받아오도록 변경

  GatherDetail({super.key, required this.data});

  @override
  State<GatherDetail> createState() => _GatherDetailState();
}

class _GatherDetailState extends State<GatherDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('profile'),
              Text('Room Info: ${widget.data.roomInfo}'), // 데이터를 표시
              Text('Tag: ${widget.data.tag}'), // 데이터를 표시
              Text('Title: ${widget.data.title}'),
              Text('Title: ${widget.data.peopleNum}'),
              // 데이터를 표시
              // 이하 원하는 데이터 필드를 Text 위젯으로 추가
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(),
                child: Text('Go Back'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
