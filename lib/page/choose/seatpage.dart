import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_train_app/page/home/trainticket.dart'; // TrainTicket 모델

// 컴포넌트 파일들을 import 합니다.
import 'package:flutter_train_app/page/choose/widget/sc_button.dart';
import 'package:flutter_train_app/page/choose/widget/seat_widget.dart';
import 'package:flutter_train_app/page/choose/widget/seat_header.dart';

class SeatPage extends StatefulWidget {
  final String origin;
  final String destination;

  const SeatPage({
    super.key,
    required this.origin,
    required this.destination,
  });

  @override
  State<SeatPage> createState() => _SeatPage();
}

class _SeatPage extends State<SeatPage> {
  // 레이아웃 관리를 위한 상수 정의
  static const double _seatSize = 50;
  static const double _seatMargin = 4;
  static const double _aisleSpacing = 10;
  static const double _rowNumberWidth = 24;

  late TrainTicket _selectTicket;
  String? _selectedSeat;

  @override
  void initState() {
    super.initState();
    _selectTicket = TrainTicket(
      origin: widget.origin,
      destination: widget.destination,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("좌석 선택"),
        leading: const BackButton(),
      ),
      // [이동 및 수정] 버튼을 Column 밖 Scaffold의 bottomNavigationBar로 이동
      // 이렇게 하면 스크롤과 상관없이 항상 하단에 고정됩니다.
      body: Column(
        children: <Widget>[
          // 상단 출발/도착 정보
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_selectTicket.origin,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple)),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Icon(Icons.arrow_forward, color: Colors.grey),
                ),
                Text(_selectTicket.destination,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple)),
              ],
            ),
          ),
          // 좌석 범례
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.square_rounded, color: Colors.purple),
              SizedBox(width: 4),
              Text('선택됨'),
              SizedBox(width: 20),
              Icon(Icons.square_rounded, color: Colors.white), // Colors.grey[300]
              SizedBox(width: 4),
              Text('선택 가능'),
            ],
          ),
          const SizedBox(height: 10),

          // [교체] 고정된 헤더 대신 SeatHeader 컴포넌트를 사용합니다.
          SeatHeader(
            seatSize: _seatSize,
            seatMargin: _seatMargin,
            aisleSpacing: _aisleSpacing,
            rowNumberWidth: _rowNumberWidth,
          ),
          const Divider(),

          // 좌석 리스트
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSeatComponent(index, 'A'),
                      SizedBox(width: 4),
                      _buildSeatComponent(index, 'B'),
                      SizedBox(
                        width: _aisleSpacing + _rowNumberWidth + _aisleSpacing,
                        child: Center(child: Text('${index + 1}')),
                      ),
                      _buildSeatComponent(index, 'C'),
                      SizedBox(width: 4),
                      _buildSeatComponent(index, 'D'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // SeatWidget 생성을 돕고, 상태 변경 로직을 연결하는 헬퍼 함수
  Widget _buildSeatComponent(int rowIndex, String seatLetter) {
    final seatId = '${rowIndex + 1}$seatLetter';
    return SeatWidget(
      seatId: seatId,
      isSelected: _selectedSeat == seatId,
      onTap: () {
        setState(() {
          _selectedSeat = seatId;
        });
      },
    );
  }
}
