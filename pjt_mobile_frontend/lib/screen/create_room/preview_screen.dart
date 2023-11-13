import 'package:flutter/material.dart';
import 'package:pjt_mobile_frontend/constant/color.dart';

class PreviewScreen extends StatefulWidget {
  final String data; // Room 데이터를 받아오도록 변경

  PreviewScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  Map<String, dynamic> dataMap = {};

  @override
  void initState() {
    super.initState();
    dataMap = parseDataMap(widget.data);
  }

  Map<String, dynamic> parseDataMap(String data) {
    Map<String, dynamic> result = {};

    // "[title: 제목, minNum: 23, maxNum: 40]" 형태의 문자열을 파싱
    String cleanedData =
        data.substring(1, data.length - 1); // "[...]" 형태에서 대괄호 제거
    List<String> keyValuePairs = cleanedData.split(', '); // 쉼표와 공백으로 분리

    for (String pair in keyValuePairs) {
      // ':'로 분리하여 키와 값을 추출
      List<String> keyValue = pair.split(':');
      String key = keyValue[0].trim();
      String value = keyValue[1].trim();
      result[key] = value;
    }

    return result;
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 240,
                decoration: BoxDecoration(color: Colors.grey[300]),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
                        child: Text(dataMap['tag']),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      dataMap['title'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text('날짜: ${dataMap['date']}'),
                    Text('시간: ${dataMap['time']}'),
                  ],
                ),
              ),
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: DARKGREY,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '모임 소개',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('${dataMap['content']}'),
                    Text(dataMap.toString()),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '모임 정보',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Text('장소'),
                                width: 80,
                              ),
                              Text('${dataMap['address']}'),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text('일시'),
                                width: 80,
                              ),
                              Text('${dataMap['time']}'),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text('참여 유형'),
                                width: 80,
                              ),
                              Text('${dataMap['onAndOffLine']}'),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text('참여 인원'),
                                width: 80,
                              ),
                              Text(
                                  '${dataMap['minNum']} / ${dataMap['maxNum']}')
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: BUTTON_COLOR, // 버튼 배경색 변경
                          onPrimary: Colors.white, // 텍스트 색 변경
                        ),
                        child: Text(
                          '모임 참가 신청하기',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
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
