import 'package:flutter/material.dart';

import 'package:rafia_task_01/config/text_config.dart';

class Time extends StatelessWidget {
  const Time({
    Key? key,
    required this.time,
  }) : super(key: key);
  final int time;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 96,
        padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              // offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Text(
              '12:30',
              style: Theme.of(context).textTheme.timeText,
            ),
            Text(
              'PM',
              style: Theme.of(context).textTheme.timeText,
            ),
          ],
        ),
      ),
    );
  }
}
