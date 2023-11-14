import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchingPage extends StatefulWidget {
  @override
  _SearchingPageState createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  bool _isError = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("주소 검색 페이지입니다."),
        centerTitle: true,
      ),
      body: Text('hi'),
    );
  }
}
