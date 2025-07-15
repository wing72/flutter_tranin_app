import 'package:flutter/material.dart';

class SeatSelectionPage extends StatefulWidget {
  const SeatSelectionPage({super.key});

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  String? _selectedSeat;

  // 좌석 위젯 생성
  Widget _buildSeat(int rowIndex, String seatLetter) {
    final seatId = '${rowIndex + 1}$seatLetter';
    final isSelected = _selectedSeat == seatId;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSeat = seatId; //버튼을 눌렀는지 안눌렀는지 확인
        });
      },
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[300], //isSelected으로 버튼 상태 확인
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          seatId,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // --- 2. 좌석 리스트와 동일한 구조의 헤더 생성 ---
  Widget _buildHeader() {
    Widget headerLabel(String label) {
      return Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        child: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center, //버튼 배치
      children: [
        headerLabel('A'),
        headerLabel('B'),
        const SizedBox(width: 50),
        headerLabel('C'),
        headerLabel('D'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          // 3. 동적으로 생성된 헤더 사용
          _buildHeader(),
          const Divider(height: 20),

          // 4. 스크롤 좌석 목록 (레이아웃 상수 사용)
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSeat(index, 'A'),
                    _buildSeat(index, 'B'),
                    SizedBox(
                      width: 50,
                      child: Center(child: Text('${index + 1}')),
                    ),
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
