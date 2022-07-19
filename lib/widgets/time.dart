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
      width: 98,
      // padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
      decoration: containerDecorationConfig(context: context),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
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
