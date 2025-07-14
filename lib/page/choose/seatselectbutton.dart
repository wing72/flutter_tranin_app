import 'package:flutter/material.dart';

int i = 1;

class SeatSelectionPage extends StatefulWidget {
  const SeatSelectionPage({super.key});

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  // 선택된 좌석을 저장할 변수 (예: "3A")
  String? _selectedSeat;

  // 좌석 하나를 만드는 함수 (재사용을 위해 분리)
  Widget _buildSeat(int rowIndex, String seatLetter) {
    // 좌석 번호 생성 (예: "1A", "10D")
    final seatId = '${rowIndex + 1}$seatLetter';
    final isSelected = _selectedSeat == seatId;

    return GestureDetector(
      onTap: () {
        // 좌석을 누르면 상태를 업데이트하고 화면을 다시 그림
        setState(() {
          _selectedSeat = seatId;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            seatId,
            style: TextStyle(
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
      appBar: AppBar(title: const Text("좌석 선택")),
      body: Column(
        children: [
          // 1. 상단에 고정될 좌석 열(A, B, C, D) 안내
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("A",
                    style: TextStyle(
                      fontSize: 18,
                    )),
                Text("B",
                    style: TextStyle(
                      fontSize: 18,
                    )),
                Text("C",
                    style: TextStyle(
                      fontSize: 18,
                    )),
                Text("D",
                    style: TextStyle(
                      fontSize: 18,
                    )),
              ],
            ),
          ),
          const Divider(),

          // 2. 남은 공간을 모두 차지하는 스크롤 가능한 좌석 목록
          Expanded(
            child: ListView.builder(
              itemCount: 20, // 20개의 줄을 만듦
              itemBuilder: (context, index) {
                // 3. 각 줄(Row)을 만듦
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSeat(index, 'A'),
                    _buildSeat(index, 'B'),
                    _buildSeat(index, 'C'),
                    _buildSeat(index, 'D'),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
