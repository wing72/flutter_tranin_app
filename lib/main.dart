import 'package:flutter/material.dart';
import 'package:flutter_train_app/page/home/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      // themeMode: ThemeMode.system, // 시스템 설정에 따라 자동 전환
      home: const HomePage(),
    );
  }
}

// 필수 바뀌면 안되는 부분
// - 프로젝트 명은 `flutter_train_app` 입니다.
// - 출발역, 도착역을 선택할 수 있는 초기 화면의 이름은 `HomePage` 로 합니다.
// - 기차역 리스트를 보여주고 선택할 수 있는 화면의 이름은 `StationListPage` 로 합니다.
// - 좌석을 선택하는 화면의 이름은 `SeatPage` 로 합니다.
// - 선택할 수 있는 기차역은 `"수서","동탄","평택지제","천안아산","오송","대전","김천구미","동대구","경주","울산","부산"` 총 11개의 역으로 합니다.
