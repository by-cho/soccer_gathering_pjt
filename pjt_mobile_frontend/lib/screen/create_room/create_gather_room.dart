import 'package:flutter/material.dart';

class CreateGatherRoom extends StatefulWidget {
  @override
  _CreateGatherRoomState createState() => _CreateGatherRoomState();
}

class _CreateGatherRoomState extends State<CreateGatherRoom> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  List<String> searchResults = [];

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void saveSearchResult() {
    String title = titleController.text;
    String content = contentController.text;
    if (title.isNotEmpty && content.isNotEmpty) {
      // 제목과 내용을 하나의 문자열로 합친다.
      String result = '제목: $title, 내용: $content';

      // 데이터를 리스트에 저장
      searchResults.add(result);

      // 입력 필드 초기화
      titleController.clear();
      contentController.clear();

      // 저장 후 화면을 업데이트하거나 필요한 작업 수행
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: '제목'),
                  ),
                  TextField(
                    controller: contentController,
                    decoration: InputDecoration(labelText: '내용'),
                  ),
                  ElevatedButton(
                    onPressed: saveSearchResult,
                    child: Text('저장'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text('저장된 검색 결과:'),
            Column(
              children: searchResults.map((result) => Text(result)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
