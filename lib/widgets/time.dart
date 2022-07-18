import 'package:flutter/material.dart';
import 'package:rafia_task_01/config/shadow_config.dart';

import 'package:rafia_task_01/config/text_config.dart';

class Time extends StatelessWidget {
  const Time({
    Key? key,
    required this.time,
    required this.timeString,
  }) : super(key: key);
  final String time;
  final String timeString;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: containerDecorationConfig(context: context),
      child: Row(
        children: [
          Text(
            time,
            style: Theme.of(context).textTheme.timeText,
          ),
          Text(
            timeString,
            style: Theme.of(context).textTheme.timeText,
          ),
        ],
      ),
    );
  }
}
