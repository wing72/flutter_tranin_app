import 'package:flutter/material.dart';
import 'package:flutter_train_app/page/home/homepage.dart';
import 'package:flutter_train_app/page/home/trainticket.dart';

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

  @override
  void initState() {
    super.initState();
    // initState에서 변수 값 출력 (위젯이 처음 생성될 때 한 번만 실행)
    _selectTicket = TrainTicket(
      origin: widget.origin,
      destination: widget.destination,
    );//SeatPage로 전달받은 origin과 destination 값 초기화

    print('SeatPage - Origin: ${_selectTicket.origin}');
    print('SeatPage - Destination: ${_selectTicket.destination}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("좌석 선택"),
          leading: const BackButton()),
      body: Column(
        children: [
          Expanded(
            child: Column(),
          ),
        ],
      ),
    );
  }
}
