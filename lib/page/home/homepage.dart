import 'package:flutter/material.dart';
import 'package:flutter_train_app/page/station/stationlistpage.dart';
import 'package:flutter_train_app/page/home/trainticket.dart';
import 'package:flutter_train_app/page/home/hc_button.dart';
import 'package:flutter_train_app/page/home/selected_seat_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  TrainTicket _selectTicket = TrainTicket(
    origin: '선택',
    destination: '선택',
  );

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark; //다크모드 확인 변수
    String selectedOrigin = _selectTicket.origin;
    String selectedDestination = _selectTicket.destination;
    return Scaffold(
      backgroundColor: isDark ? Color(0xFF1C1C1C) : Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AppBar(
              title: Text('가차 예매'),
              centerTitle: true,
            ),
            Container(
              height: 250,
            ),
            // 1. 출발/도착역 선택 버튼
            Hc_Button(
              origin: _selectTicket.origin,
              destination: _selectTicket.destination,
              onOriginPressed: () async {
                print('넘겨주는 출발역: $selectedOrigin'); // "수서"가 출력되어야 함
                final selectedStation = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Stationlistpage(
                      addTitle: '출발역',
                      origin: selectedOrigin,
                      destination: selectedDestination,
                    ),
                  ),
                );
                if (selectedStation != null && selectedStation is String) {
                  setState(() {
                    _selectTicket = _selectTicket.copyWith(origin: selectedStation);
                  });
                }
              },
              onDestinationPressed: () async {
                final selectedStation = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Stationlistpage(
                      addTitle: '도착역',
                      origin: selectedOrigin,
                      destination: selectedDestination,
                    ),
                  ),
                );
                if (selectedStation != null && selectedStation is String) {
                  setState(() {
                    _selectTicket = _selectTicket.copyWith(destination: selectedStation);
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            // 3. 좌석 선택 버튼
            SelectSeatButton(
              origin: _selectTicket.origin,
              destination: _selectTicket.destination,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
