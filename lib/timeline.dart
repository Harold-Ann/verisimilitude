import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

timePeriod(current, totalAmount, screenSize) {
  dynamic increment = (255 / totalAmount).round();
  Widget timePeriod = Padding(
    padding: EdgeInsets.fromLTRB(0, ((screenSize.height) / 2) - (100), 0, 0),
    child: SizedBox(
      width: screenSize.width / totalAmount,
      height: 100 * 2,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 86, 57, (increment * current)),
        ),
      ),
    ),
  );
  return timePeriod;
}

timePeriodGenerator(totalAmount, screenSize) {
  List<Widget> currentStack = [];

  for (var i = 0; i < totalAmount; i++) {
    currentStack.add(timePeriod(i, totalAmount, screenSize));
  }

  return currentStack;
}
