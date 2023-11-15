import 'package:flutter/material.dart';
import 'package:pjt_mobile_frontend/component/gathering_room.dart';
import 'package:pjt_mobile_frontend/component/room_create_button.dart';
import 'package:pjt_mobile_frontend/constant/color.dart';
import 'package:pjt_mobile_frontend/view_model/data_service.dart';
import 'package:provider/provider.dart';

class GatheringScreen extends StatefulWidget {
  @override
  GatheringScreenState createState() => GatheringScreenState();
}

class GatheringScreenState extends State<GatheringScreen> {
  final ScrollController _scrollController = ScrollController();
  List<String> items = List.generate(20, (index) => 'Item $index');

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // 스크롤이 최하단에 도달하면 새로운 아이템을 로드합니다.
        _loadMoreItems();
      }
    });
  }

  void _loadMoreItems() {
    // 새로운 아이템을 로드하고 리스트에 추가하는 로직을 여기에 작성합니다.
    for (int i = 0; i < 10; i++) {
      items.add('Item ${items.length}');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: APP_BAR_COLOR,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      backgroundColor: BACKGROUND_COLOR,
      body: Consumer<DataService>(
        builder: (context, dataService, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RoomCreateButton(),
                  SizedBox(
                    height: 22,
                  ),
                  GatheringRoom(roomList: dataService.roomList),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
