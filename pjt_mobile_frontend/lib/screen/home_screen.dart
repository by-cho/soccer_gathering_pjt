import 'package:flutter/material.dart';
import 'package:pjt_mobile_frontend/main.dart';
import 'package:pjt_mobile_frontend/component/feed.dart';
import 'package:pjt_mobile_frontend/component/gathering_room.dart';
import 'package:pjt_mobile_frontend/component/room_create_button.dart';
import 'package:pjt_mobile_frontend/constant/color.dart';
import 'package:pjt_mobile_frontend/screen/feed/recommend_place_screen.dart';
import 'package:pjt_mobile_frontend/screen/gathering_screen.dart';
import 'package:pjt_mobile_frontend/sevice/data_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
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
      roomInfo: 'P L',
      tag: '첼시',
      title: '방 제목 입니다1',
      place: '마포구',
      date: '2023-12-24',
      time: '12:24',
      peopleNum: '12',
      maxNum: '30',
      contents: '콘텐츠가 들어가는곳입니다. 길게 쓸수 있어요 길게 길게',
      waysToJoin: '승인제',
    ),
    Room(
      roomInfo: 'P L',
      tag: '토트넘',
      title: '방 제목 입니다2',
      place: '여의도동',
      date: '2023-12-25',
      time: '12:25',
      peopleNum: '25',
      maxNum: '30',
      contents:
          '콘텐츠가 들어가는곳입니다. 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게 ',
      waysToJoin: '선착순',
    ),
    Room(
      roomInfo: '세리에A',
      tag: '유벤투스',
      title: '방 제목 입니다3',
      place: '중구',
      date: '2023-12-26',
      time: '12:26',
      peopleNum: '26',
      maxNum: '30',
      contents:
          '콘텐츠가 들어가는곳입니다. 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게 길게 쓸수 있어요 길게 길게',
      waysToJoin: '승인제',
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
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
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
                      style: textTheme.headline2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GatheringRoom(roomList: roomList),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: BUTTON_COLOR, // 버튼 배경색 변경
                          onPrimary: Colors.white, // 텍스트 색 변경
                        ),
                        onPressed: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => GatheringScreen(),
                            ),
                          );
                        },
                        child: Text('더보기'),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      '장소 추천',
                      style: textTheme.headline2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FeedButton(feedList: feedList),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: BUTTON_COLOR, // 버튼 배경색 변경
                          onPrimary: Colors.white, // 텍스트 색 변경
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RecommendPlaceScreen(),
                            ),
                          );
                        },
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
