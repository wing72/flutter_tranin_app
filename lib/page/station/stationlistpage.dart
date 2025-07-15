import 'package:flutter/material.dart';
import 'package:flutter_train_app/page/station/station_button.dart';

//클래스와 변수 선언
class Stationlistpage extends StatelessWidget {
  final String addTitle;
  final String stationName = '';
  final String? origin;
  final String? destination;

//클레스에서 쓰기위해 정보를 담은 생성자 생성
  const Stationlistpage({
    super.key,
    required this.addTitle,
    this.origin,
    this.destination,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final List<String> stationTrim = ['수서', '동탄', '평택지제', '천안아산', '오송', '대전', '김천구미', '동대구', '경주', '울산', '부산'];
    return Scaffold(
      backgroundColor: isDark ? Color(0xFF1C1C1C) : Colors.white,
      appBar: AppBar(centerTitle: true, title: Text(addTitle), leading: const BackButton()),
      body: Column(
        children: stationTrim
            .where((station) => station != origin && station != destination) //출발역이나 도착여과 같으면 안된다(리스트에서 삭제)
            .map((stationName) =>
                StationButton(stationName: stationName)) //다시 맵을 이용하여 리스트에 있는 문자열만 StationButton을 이용해서 위젯으로 만들어라
            .toList(), //리스트로 만들어서 Column에서 사용할수 있게 가공
      ),
    );
  }
}
