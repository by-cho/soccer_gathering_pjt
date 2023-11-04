import 'package:flutter/material.dart';
import 'package:pjt_mobile_frontend/component/feed.dart';
import 'package:pjt_mobile_frontend/component/gathering_room.dart';
import 'package:pjt_mobile_frontend/component/room_create_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class Room {
  String roomInfo;
  String tag;
  String title;
  String place;
  String date;
  String time;
  String peopleNum;
  String maxNum;

  Room({
    required this.roomInfo,
    required this.tag,
    required this.title,
    required this.place,
    required this.date,
    required this.time,
    required this.peopleNum,
    required this.maxNum,
  });
}

class Feed {
  String tag;
  String title;
  String place;

  Feed({
    required this.tag,
    required this.title,
    required this.place,
  });
}

class _HomeScreenState extends State<HomeScreen> {
  List<Room> roomList = [
    Room(
      roomInfo: 'PL',
      tag: '첼시',
      title: '방 제목 입니다1',
      place: '마포구',
      date: '2023-12-24',
      time: '12:24',
      peopleNum: '12',
      maxNum: '30',
    ),
    Room(
      roomInfo: '라리가',
      tag: '첼시',
      title: '방 제목 입니다2',
      place: '여의도동',
      date: '2023-12-25',
      time: '12:25',
      peopleNum: '25',
      maxNum: '30',
    ),
    Room(
      roomInfo: '세리에A',
      tag: '첼시',
      title: '방 제목 입니다3',
      place: '중구',
      date: '2023-12-26',
      time: '12:26',
      peopleNum: '26',
      maxNum: '30',
    ),
  ];

  List<Feed> feedList = [
    Feed(
      tag: '첼시',
      title: '피드 제목 입니다1',
      place: '마포구',
    ),
    Feed(
      tag: '첼시',
      title: '피드 제목 입니다2',
      place: '여의도동',
    ),
    Feed(
      tag: '첼시',
      title: '피드 제목 입니다3',
      place: '중구',
    ),
    Feed(
      tag: '첼시',
      title: '피드 제목 입니다4',
      place: '중구',
    ),
    Feed(
      tag: '첼시',
      title: '피드 제목 입니다5',
      place: '중구',
    ),
    Feed(
      tag: '첼시',
      title: '피드 제목 입니다6',
      place: '중구',
    ),
    Feed(
      tag: '첼시',
      title: '피드 제목 입니다7',
      place: '중구',
    ),
    Feed(
      tag: '첼시',
      title: '피드 제목 입니다8',
      place: '중구',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RoomCreateButton(),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      '응원방 추천',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GatheringRoom(roomList: roomList),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('더보기'),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      '장소 추천',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FeedButton(feedList: feedList),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('더보기'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
