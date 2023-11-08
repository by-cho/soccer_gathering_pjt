import 'package:flutter/material.dart';

class CreateGatherRoom extends StatefulWidget {
  @override
  _CreateGatherRoomState createState() => _CreateGatherRoomState();
}

class _CreateGatherRoomState extends State<CreateGatherRoom> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController teamInfoController = TextEditingController();
  final TextEditingController tagController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  String selectedOption = '오프라인'; // 선택된 라디오 버튼의 값을 저장할 변수

  List<String> searchResults = [];

  @override
  void dispose() {
    titleController.dispose();
    teamInfoController.dispose();
    tagController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void saveSearchResult() {
    String title = titleController.text;
    String teamInfo = teamInfoController.text;
    String tag = tagController.text;
    String content = contentController.text;
    String onAndOffLine = selectedOption;

    if (title.isNotEmpty && content.isNotEmpty) {
      // 제목과 내용을 하나의 문자열로 합친다.
      String result =
          '제목: $title, 응원팀: $teamInfo, 태그: $tag, 내용: $content, 온오프라인: $onAndOffLine';
      // 데이터를 리스트에 저장
      searchResults.add(result);

      // 입력 필드 초기화
      titleController.clear();
      teamInfoController.clear();
      tagController.clear();
      contentController.clear();

      // 저장 후 화면을 업데이트하거나 필요한 작업 수행
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '제목',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: '제목을 입력하세요',
                        filled: true, // 입력 상자를 채우도록 설정
                        fillColor: Colors.grey[200], // 입력 상자의 배경 색상 설정
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // 보더 radius 설정
                          borderSide: BorderSide.none, // 포커스 없을 때 보더 없애기
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // 포커스 시 보더 radius 설정
                          borderSide: BorderSide.none, // 포커스 시 보더 없애기
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '응원팀 설정',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: teamInfoController,
                      decoration: InputDecoration(
                        labelText: '응원팀을 입력하세요',
                        filled: true, // 입력 상자를 채우도록 설정
                        fillColor: Colors.grey[200], // 입력 상자의 배경 색상 설정
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // 보더 radius 설정
                          borderSide: BorderSide.none, // 포커스 없을 때 보더 없애기
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // 포커스 시 보더 radius 설정
                          borderSide: BorderSide.none, // 포커스 시 보더 없애기
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '태그',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: teamInfoController,
                      decoration: InputDecoration(
                        labelText: '태그를 설정하세요',
                        filled: true, // 입력 상자를 채우도록 설정
                        fillColor: Colors.grey[200], // 입력 상자의 배경 색상 설정
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // 보더 radius 설정
                          borderSide: BorderSide.none, // 포커스 없을 때 보더 없애기
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // 포커스 시 보더 radius 설정
                          borderSide: BorderSide.none, // 포커스 시 보더 없애기
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '모임 소개 사진 (최대 5장)',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Icon(
                            Icons.add,
                            size: 50,
                            color: Colors.grey[400],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '모임 인원수',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: teamInfoController,
                            decoration: InputDecoration(
                              labelText: '최소 인원 2명',
                              filled: true, // 입력 상자를 채우도록 설정
                              fillColor: Colors.grey[200], // 입력 상자의 배경 색상 설정
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0), // 보더 radius 설정
                                borderSide: BorderSide.none, // 포커스 없을 때 보더 없애기
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // 포커스 시 보더 radius 설정
                                borderSide: BorderSide.none, // 포커스 시 보더 없애기
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '  -  ',
                          style: TextStyle(fontSize: 20),
                        ),
                        Expanded(
                          child: TextField(
                            controller: teamInfoController,
                            decoration: InputDecoration(
                              filled: true, // 입력 상자를 채우도록 설정
                              fillColor: Colors.grey[200], // 입력 상자의 배경 색상 설정
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0), // 보더 radius 설정
                                borderSide: BorderSide.none, // 포커스 없을 때 보더 없애기
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // 포커스 시 보더 radius 설정
                                borderSide: BorderSide.none, // 포커스 시 보더 없애기
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '모임 소개글',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: contentController,
                      maxLines: 10,
                      decoration: InputDecoration(
                        filled: true, // 입력 상자를 채우도록 설정
                        fillColor: Colors.grey[200], // 입력 상자의 배경 색상 설정
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // 보더 radius 설정
                          borderSide: BorderSide.none, // 포커스 없을 때 보더 없애기
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // 포커스 시 보더 radius 설정
                          borderSide: BorderSide.none, // 포커스 시 보더 없애기
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '모임 장소',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: <Widget>[
                        Radio<String>(
                          value: '오프라인',
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                        Text('오프라인'),
                        Radio<String>(
                          value: '온라인',
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                        Text('온라인'),
                      ],
                    ),
                    selectedOption == "오프라인"
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: contentController,
                                      decoration: InputDecoration(
                                        label: Text('주소를 입력하세요'),
                                        filled: true, // 입력 상자를 채우도록 설정
                                        fillColor:
                                            Colors.grey[200], // 입력 상자의 배경 색상 설정
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0), // 보더 radius 설정
                                          borderSide: BorderSide
                                              .none, // 포커스 없을 때 보더 없애기
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0), // 포커스 시 보더 radius 설정
                                          borderSide:
                                              BorderSide.none, // 포커스 시 보더 없애기
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    width: 65,
                                    height: 58,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        '검색',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: contentController,
                                decoration: InputDecoration(
                                  label: Text('상세 주소를 입력하세요'),
                                  filled: true, // 입력 상자를 채우도록 설정
                                  fillColor:
                                      Colors.grey[200], // 입력 상자의 배경 색상 설정
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // 보더 radius 설정
                                    borderSide:
                                        BorderSide.none, // 포커스 없을 때 보더 없애기
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // 포커스 시 보더 radius 설정
                                    borderSide: BorderSide.none, // 포커스 시 보더 없애기
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Text(
                            '온라인 모임 장소를 만들고 채팅방에서 링크를 공유해주세요',
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: saveSearchResult,
                        child: Text('저장'),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text('저장된 검색 결과:'),
                    Column(
                      children:
                          searchResults.map((result) => Text(result)).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
