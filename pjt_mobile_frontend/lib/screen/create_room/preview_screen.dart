import 'package:flutter/material.dart';

class PreviewScreen extends StatefulWidget {
  final String data; // Room 데이터를 받아오도록 변경

  PreviewScreen({super.key, required this.data});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                        child: Text(widget.data),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      widget.data,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text('날짜: ${widget.data}'),
                    Text('시간: ${widget.data}'),
                  ],
                ),
              ),
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
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
                    Text(widget.data),
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
                              Text(widget.data),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text('일시'),
                                width: 80,
                              ),
                              Text(widget.data),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text('참여 유형'),
                                width: 80,
                              ),
                              Text(widget.data),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text('참여 인원'),
                                width: 80,
                              ),
                              Text('${widget.data} / ${widget.data}')
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
