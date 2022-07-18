import 'package:flutter/material.dart';
import 'package:rafia_task_01/config/color_config.dart';

import 'package:rafia_task_01/config/shadow_config.dart';
import 'package:rafia_task_01/config/text_config.dart';
import 'package:rafia_task_01/models/day.dart';

class DateAndDay extends StatelessWidget {
  const DateAndDay({
    required this.day,
    Key? key,
  }) : super(key: key);
  final Day day;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      width: 62,
      child: DecoratedBox(
        decoration: containerDecorationConfig(context: context, boxColor: day.isSelected ? greenColor : null),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${day.date}',
              style: Theme.of(context).textTheme.mainText.copyWith(color: day.isSelected ? containerColor : null),
            ),
            const SizedBox(height: 8),
            Text(day.weekDay.toUpperCase(), style: Theme.of(context).textTheme.subText.copyWith(color: day.isSelected ? containerColor : null)),
          ],
        ),
      ),
    );
  }
}
