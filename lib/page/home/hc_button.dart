import 'package:flutter/material.dart';

class Hc_Button extends StatelessWidget {
  // 이 위젯이 외부로부터 받아야 할 데이터와 함수를 정의합니다.
  final String origin;
  final String destination;
  final VoidCallback onOriginPressed;
  final VoidCallback onDestinationPressed;

  // 생성자(Constructor)를 통해 데이터를 전달받습니다.
  const Hc_Button({
    super.key,
    required this.origin,
    required this.destination,
    required this.onOriginPressed,
    required this.onDestinationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // 왼쪽 버튼
          Expanded(
            child: TextButton(
              onPressed: onOriginPressed, // 외부에서 전달받은 함수 연결
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('출발역', style: TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(origin, style: const TextStyle(fontSize: 40, color: Colors.black)), // 외부에서 전달받은 데이터 사용
                ],
              ),
            ),
          ),

          // 중앙선
          Container(height: 50, width: 2, color: Colors.grey[400]),

          // 오른쪽 버튼
          Expanded(
            child: TextButton(
              onPressed: onDestinationPressed, // 외부에서 전달받은 함수 연결
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('도착역', style: TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(destination, style: const TextStyle(fontSize: 40, color: Colors.black)), // 외부에서 전달받은 데이터 사용
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
