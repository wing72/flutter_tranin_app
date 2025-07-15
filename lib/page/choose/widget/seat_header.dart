import 'package:flutter/material.dart';

class SeatHeader extends StatelessWidget {
  // 정렬을 위해 필요한 레이아웃 값들을 부모로부터 전달받음
  final double seatSize;
  final double seatMargin;
  final double aisleSpacing;
  final double rowNumberWidth;

  const SeatHeader({
    super.key,
    required this.seatSize,
    required this.seatMargin,
    required this.aisleSpacing,
    required this.rowNumberWidth,
  });

  @override
  Widget build(BuildContext context) {
    // 헤더 라벨 하나를 만드는 내부 함수
    Widget headerLabel(String label) {
      return Container(
        width: seatSize + (seatMargin * 2),
        height: seatSize,
        alignment: Alignment.center,
        child: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        headerLabel('A'),
        headerLabel('B'),
        SizedBox(width: aisleSpacing + rowNumberWidth), // 복도 + 줄 번호 너비만큼 공간 확보
        headerLabel('C'),
        headerLabel('D'),
      ],
    );
  }
}
