import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:flutter_train_app/page/home/homepage.dart';
import 'package:flutter_train_app/page/home/trainticket.dart';
import 'package:flutter_train_app/page/choose/seatselectbutton.dart';

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
  late TrainTicket _selectTicket;
  String? _selectedSeat;

  @override
  void initState() {
    super.initState();
    // 부모 위젯(HomePage)에서 전달받은 데이터로 _selectTicket을 초기화
    _selectTicket = TrainTicket(
      origin: widget.origin,
      destination: widget.destination,
    );
  }

  // 2. 좌석 하나를 만드는 헬퍼(helper) 함수 추가
  Widget _buildSeat(int rowIndex, String seatLetter) {
    final seatId = '${rowIndex + 1}$seatLetter';
    final isSelected = _selectedSeat == seatId;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSeat = seatId;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[300]!,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            seatId,
            style: TextStyle(
              fontSize: 18,
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("좌석 선택"),
          leading: const BackButton()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _selectTicket.origin,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 65),
              const Icon(Icons.arrow_circle_right_outlined),
              const SizedBox(width: 65),
              Text(
                _selectTicket.destination,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              SizedBox(width: 130),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(width: 4),
              Text(
                '선택됨',
              ),
              const SizedBox(width: 20),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '선택 안됨',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                const SizedBox(width: 100),
                Container(
                  width: 50,
                  height: 50,
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  width: 50,
                  height: 50,
                  child: Text(
                    "B",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(width: 38),
                Container(
                  width: 50,
                  height: 50,
                  child: Text(
                    "C",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(width: 7),
                Container(
                  width: 50,
                  height: 50,
                  child: Text(
                    "D",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          // 3. ListView.builder 연결
          Expanded(
            child: ListView.builder(
              itemCount: 20, // 10줄의 좌석을 만듦
              itemBuilder: (context, index) {
                // itemBuilder는 각 줄(Row)을 어떻게 그릴지 정의
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSeat(index, 'A'),
                    _buildSeat(index, 'B'),
                    SizedBox(width: 10),
                    Text('${index + 1}'),
                    SizedBox(width: 10),
                    _buildSeat(index, 'C'),
                    _buildSeat(index, 'D'),
                  ],
                );
              },
            ),
          ),
          // 4. 선택 완료 버튼 (결과 반환)
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: const Size(390, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                // 선택된 좌석이 있을 때만 버튼 활성화 및 결과 반환
                if (_selectedSeat != null) {
                  Navigator.pop(context, _selectedSeat);
                }
              },
              child: const Text(
                "예약 하기",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
