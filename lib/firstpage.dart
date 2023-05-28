import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('오늘의 당직'),
        actions: [IconButton(onPressed: () {
          Navigator.pop(context);
        },icon: Icon(Icons.logout),)],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // 메뉴 버튼이 눌렸을 때 Drawer 열기
                _openDrawer(context);
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    // 프로필 사진 설정
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('홈'),
              onTap: () {                // '홈' 버튼이 눌렸을 때 처리할 동작 추가
              },
            ),
            ListTile(
              title: Text('내일의 당직'),
              onTap: () {
                // '내일의 당직' 버튼이 눌렸을 때 처리할 동작 추가
              },
            ),
          ],
        ),
      ),
    );
  }

  void _openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
