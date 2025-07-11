import 'package:flutter/material.dart';
import 'package:flutter_train_app/page/station/stationlistpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size(120, 200),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Stationlistpage(),
                            ),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Text(
                              '출발역',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '선택',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        child: Center(
                          child: Container(
                              width: 2, height: 50, color: Colors.grey[400]),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size(120, 200),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Stationlistpage(),
                            ),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Text(
                              '도착역',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '선택',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.black,
                              ),
                            ),
                          ],
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
                    onPressed: () {
                      print('버튼을 눌렀습니다.');
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
