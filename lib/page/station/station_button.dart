import 'package:flutter/material.dart';

class StationButton extends StatelessWidget {
  final String stationName;

  const StationButton({
    super.key,
    required this.stationName,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.transparent,
            minimumSize: Size(25, 50),
          ),
          onPressed: () {
            Navigator.pop(context, '$stationName');
          },
          child: Text(stationName, style: TextStyle(color: isDark ? Colors.grey[400] : Colors.black)),
        ),
        Container(
          height: 2,
          width: 100,
          color: isDark ? Colors.grey[400] : Colors.grey[300],
        ),
      ],
    );
  }
}
