import 'package:flutter/material.dart';
import 'package:pjt_mobile_frontend/constant/color.dart';
import 'package:pjt_mobile_frontend/view/chat_screen.dart';
import 'package:pjt_mobile_frontend/view/feed_screen.dart';
import 'package:pjt_mobile_frontend/view/home_screen.dart';
import 'package:pjt_mobile_frontend/view/login_screen.dart';
import 'package:pjt_mobile_frontend/view/profile_screen.dart';
import 'package:pjt_mobile_frontend/view/search_screen.dart';
import 'package:pjt_mobile_frontend/view_model/data_service.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontFamily: 'bungeeshade',
            fontSize: _calculateFontSize(context, 0.15), // 여기에 폰트 크기 비율을 넣습니다.
            fontWeight: FontWeight.w700,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: _calculateFontSize(context, 0.05), // 여기에 폰트 크기 비율을 넣습니다.
            fontWeight: FontWeight.w600,
          ),
          bodyText1: TextStyle(
            color: Colors.black,
            fontSize: _calculateFontSize(context, 0.037), // 여기에 폰트 크기 비율을 넣습니다.
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: _calculateFontSize(context, 0.036), // 여기에 폰트 크기 비율을 넣습니다.
          ),
          subtitle2: TextStyle(
            color: DARKGREY,
            fontSize: _calculateFontSize(context, 0.04), // 여기에 폰트 크기 비율을 넣습니다.
          ),
        ),
      ),
      home: MyBottomNavigationBar(),
    );
  }

  double _calculateFontSize(BuildContext context, double scaleFactor) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * scaleFactor;
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  final isLogin = false;
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    FeedScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WHISTLE'),
        backgroundColor: APP_BAR_COLOR,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: BACKGROUND_COLOR),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: APP_BAR_COLOR,
        unselectedItemColor: DARKGREY,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            if (isLogin == false && (index == 2 || index == 3)) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            }
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: '피드',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: '채팅',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '프로필',
          ),
        ],
      ),
    );
  }
}
