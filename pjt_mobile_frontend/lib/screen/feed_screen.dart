import 'package:flutter/material.dart';

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
      body: ListView.builder(
        controller: _scrollController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('피드'),
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
