import 'package:flutter/material.dart';
import 'package:rafia_task_01/config/color_config.dart';

BoxDecoration containerDecorationConfig({
  required BuildContext context,
  double? borderRadius,
  Color? boxColor,
}) {
  
  return BoxDecoration(
    borderRadius:
        BorderRadius.circular(borderRadius ?? 8 ),
    color: boxColor ?? containerColor,
    boxShadow: const [
      BoxShadow(
        color: shadowColor,
        blurRadius: 41,
        offset: Offset(
          7,
         7,
        ),
      ),
    ],
  );
}
