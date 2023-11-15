import 'package:flutter/material.dart';
import 'package:pjt_mobile_frontend/constant/color.dart';
import 'package:pjt_mobile_frontend/view_model/data_service.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  @override
  FeedScreenState createState() => FeedScreenState();
}

class FeedScreenState extends State<FeedScreen> {
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
      backgroundColor: BACKGROUND_COLOR,
      body: Consumer<DataService>(
        builder: (context, dataService, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: items.length <= dataService.feedList.length
                  ? items.length
                  : dataService.feedList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dataService.feedList[index].userName,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(dataService.feedList[index].time),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(dataService.feedList[index].contents),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                        Text(dataService.feedList[index].likeNum),
                        SizedBox(
                          width: 4,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.comment_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Text(dataService.feedList[index].replyNum),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                );
              },
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
