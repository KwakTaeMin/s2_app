import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chat/chat_page.dart' as chat_page;

void main() {

  runApp(
    const MyApp()
    //const,
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('app'),
        ),
        body: const Center(
          child: chat_page.ChatPage()
        ),
        bottomNavigationBar: BottomAppBar (
          child: SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.phone, size: 30),
                Icon(Icons.message, size: 30),
                Icon(Icons.contact_page, size: 30)
              ],
            ),
          ),
        ),
      )
    );
  }
}
/*Widget
  SizedBox : Container보단 가볍다 (width, height child만 필요하면 SizedBox사용)
  Scaffold(appBar, body, bottomNavigationBar) 상중하 나눠주는 widget
  Icon(Icons.shop)
  Image.asset('path')
    /assets 폴더 생성 후 image 넣은 후 pubspec.yaml에 파일 추가
    flutter: assets : - assets/
  Container(width : 50 , height : 50, color : Colors.blue) 박스 생성
  Row(children : [ ], mainAxisAlignment: MainAxisAlignment.center ) 가로배치
    mainAxisAlignment 가로축 정렬
    CrossAxisAlignment 새로축 정렬
  Column(children: [] ) 세로 배치
  Flexible(child: , flex: 5)


 */
