import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  final List<int> numbers = List.generate(16, (index) => index + 1);
  final List<String> teams = [
    '토트넘',
    '뮌 헨',
    'PSG',
    '울버햄튼',
    '마인츠',
    '첼시',
    '맨시티',
    '맨 유',
    '아스날',
    '리버풀',
    '바르셀로나',
    '레알마드리드',
    'AC밀란',
    '나폴리',
    '유벤투스',
    '인터밀란'
  ];
  double itemWidth = 0.0; // 아이템 넓이를 저장할 변수
  int numRows = 4; // 초기 값은 4줄

  List<String> searchResults = [];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void saveSearchResult() {
    String search = searchController.text;
    if (search.isNotEmpty) {
      String result = 'search: $search';

      // 데이터를 리스트에 저장
      searchResults.add(result);

      // 입력 필드 초기화
      searchController.clear();

      // 저장 후 화면을 업데이트하거나 필요한 작업 수행
      setState(() {});
    }
  }

  double screenWidth = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 38.0,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        labelText: '검색어를 입력하세요',
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
                    IconButton(
                        onPressed: saveSearchResult, icon: Icon(Icons.search))
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                '응원팀 추천',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(
                    (teams.length / 4).ceil(),
                    (rowIndex) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: teams.skip(rowIndex * 4).take(4).map((team) {
                          return Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300],
                                ),
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(4),
                              ),
                              Text(
                                team.toString(),
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          );
                        }).toList(),
                      );
                    },
                  ),
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
      ),
    );
  }
}
