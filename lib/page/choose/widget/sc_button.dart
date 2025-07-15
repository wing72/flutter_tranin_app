import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sc_BookingButton extends StatelessWidget {
  final String? selectedSeat;
  final VoidCallback? onBooked;

  const Sc_BookingButton({
    super.key,
    required this.selectedSeat,
    this.onBooked,
  });

  Color _getButtonColor({required bool isSeatSelected, required bool isDark}) {
    if (isSeatSelected) {
      return isDark ? Color(0xFFA374DB) : Colors.white;
    } else {
      return isDark ? Colors.purple : Colors.grey;
    }
  }

  Future<void> _showBookingDialog(BuildContext context) async {
    if (selectedSeat == null) return; // 선택이 되어있는지 확인하는 조건

    final result = await showCupertinoDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('예매 하시겠습니까?'),
          content: Text('좌석: $selectedSeat'),
          actions: <Widget>[
            CupertinoDialogAction(
              isDestructiveAction: true, //CupertinoDialogAction의 기본 디자인 사용
              child: const Text('아니오'),
              onPressed: () => Navigator.pop(context, false),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('예'),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        );
      },
    );
    if (result == true) {
      if (context.mounted) {
        Navigator.pop(context); //일부로 취소해서 나가는 부분
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark; //다크모드 확인 변수
    final bool isSeatSelected = selectedSeat != null;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: isSeatSelected ? () => _showBookingDialog(context) : null,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(375, 50),
          backgroundColor: _getButtonColor(isSeatSelected: isSeatSelected, isDark: isDark),
        ),
        child: Text(
          '예매하기',
          style: TextStyle(
            fontSize: 18,
            color: isDark ? Colors.grey[400] : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
