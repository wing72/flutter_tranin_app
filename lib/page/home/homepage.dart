import 'package:flutter/material.dart';
import 'package:flutter_train_app/page/station/stationlistpage.dart';
import 'package:flutter_train_app/page/choose/seatpage.dart';
import 'package:flutter_train_app/page/home/trainticket.dart';

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
  void initState() {
    super.initState();
    // initState에서 변수 값 출력 (위젯이 처음 생성될 때 한 번만 실행)
    print('SeatPage - Origin: ${_selectTicket.origin}');
    print('SeatPage - Destination: ${_selectTicket.destination}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('기차 예매')),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 270),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size(120, 200),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () async {
                            final selecktedStation = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Stationlistpage(
                                  addTitle: '출발역',
                                ),
                              ),
                            );

                            if (selecktedStation != null &&
                                selecktedStation is String) {
                              setState(() {
                                _selectTicket = _selectTicket.copyWith(
                                    origin: selecktedStation);
                              });
                            }
                            print(
                                'HomePage로 돌아왔습니다. 현재 출발역: ${_selectTicket.origin}');
                          },
                          child: Column(
                            children: <Widget>[
                              const Text(
                                '출발역',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                _selectTicket.origin,
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        child: Center(
                          child: Container(
                            width: 2,
                            height: 50,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size(120, 200),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () async {
                            final selecktedStation = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Stationlistpage(
                                  addTitle: '도착역',
                                ),
                              ),
                            );

                            if (selecktedStation != null &&
                                selecktedStation is String) {
                              setState(() {
                                _selectTicket = _selectTicket.copyWith(
                                    destination: selecktedStation);
                              });
                            }
                            print(
                                'HomePage로 돌아왔습니다. 현재 출발역: ${_selectTicket.destination}');
                          },
                          child: Column(
                            children: <Widget>[
                              const Text(
                                '도착역',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                _selectTicket.destination,
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[200],
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(390, 55),
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      if (_selectTicket.origin != '선택' &&
                          _selectTicket.destination != '선택') {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SeatPage(
                                    origin: _selectTicket.origin,
                                    destination: _selectTicket.destination,
                                  )),
                        );
                      } else {
                        print("출발역과 도착역을 선택해주세요.");
                      }
                    },
                    child: Column(
                      children: <Widget>[
                        Text(
                          '좌석 선택',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            // width: double.infinity,
            height: 40,
            color: Colors.grey[200],
          ),
        ],
      ),
    );
  }
}
