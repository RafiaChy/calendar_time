import 'package:flutter/material.dart';
import 'package:rafia_task_01/config/color_config.dart';

extension TextConfig on TextTheme {
  TextStyle get timeText {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'Metropolis',
      
    );
  }

  TextStyle get mainText {
    return const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: 'Metropolis',
      
    );
  }

    TextStyle get pickADate{
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: 'Metropolis',
    );
  }

      TextStyle get checkBoxText {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Metropolis',
      color: greyColor,
    );
  }

  TextStyle get subText {
    return const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: 'Metropolis',
     color: greyColor,
    );
  }
}
