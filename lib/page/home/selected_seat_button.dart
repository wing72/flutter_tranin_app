import 'package:flutter/material.dart';
import 'package:flutter_train_app/page/choose/seatpage.dart';

// '좌석 선택' 버튼을 별도의 위젯으로 캡슐화했습니다.
class SelectSeatButton extends StatelessWidget {
  // 이 위젯은 부모로부터 출발역과 도착역 정보를 전달받습니다.
  final String origin;
  final String destination;

  const SelectSeatButton({
    super.key,
    required this.origin,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // 출발역과 도착역이 모두 선택되었는지 변수 확인
    final bool isReady = origin != '선택' && destination != '선택';

    return Container(
      color: isDark ? Color(0xFF1C1C1C) : Colors.grey[200],
      // 버튼이 항상 중앙에 오도록 Center 위젯으로 감쌉니다.
      child: Center(
        child: SizedBox(
          width: 390,
          height: 50,
          child: TextButton(
            style: TextButton.styleFrom(
              // 둘다 고르면 보라색으로 활성화되고 안골라져 있으면 회색으로 비활성화
              backgroundColor: isReady ? Colors.purple : Colors.grey[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              // 둘다 선택되었는지 확인하는 isReady가 true일 때만 이동가능한 if문
              if (isReady) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeatPage(
                      origin: origin,
                      destination: destination,
                    ),
                  ),
                );
              } else {
                // 선택이 안됐을 경우 사용자에게 알림을 줍니다.
                print('출발역과 도착역을 선택해주세요');
              }
            },
            // Column 없이 Text만 사용해서 코드를 간결하게 합니다.
            child: Text(
              '좌석 선택',
              style: TextStyle(
                fontSize: 18,
                color: isDark ? Colors.grey[400] : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
