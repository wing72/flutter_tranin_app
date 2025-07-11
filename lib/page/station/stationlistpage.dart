import 'package:flutter/material.dart';
import 'package:flutter_train_app/page/home/homepage.dart';

class Stationlistpage extends StatelessWidget {
  const Stationlistpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('출발역'),
          leading: const BackButton()),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(50, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context, '수서');
                  },
                  child: const Text('수서역 선택'),
                ),
                const SizedBox(height: 10),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
