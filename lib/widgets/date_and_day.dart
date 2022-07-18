import 'package:flutter/material.dart';

import 'package:rafia_task_01/config/shadow_config.dart';
import 'package:rafia_task_01/config/text_config.dart';

class DateAndDay extends StatelessWidget {
  const DateAndDay({
    Key? key,
    required this.date,
    required this.day,
  }) : super(key: key);
  final int date;
  final String day;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 78,
        width: 62,
        child: DecoratedBox(
          decoration: containerDecorationConfig(context: context),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$date',
                style: Theme.of(context).textTheme.mainText,
              ),
              Text(day, style: Theme.of(context).textTheme.subText),
            ],
          ),
        ),
      ),
    );
  }
}
