import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

noodles(amount, screenSize) {
  Widget timePeriod = Padding(
    padding: EdgeInsets.fromLTRB(0, ((screenSize.height) / 2) - (100), 0, 0),
    child: SizedBox(
      width: screenSize.width / amount,
      height: 100 * 2,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 86, 57, 168),
        ),
      ),
    ),
  );
  return timePeriod;
}

pancakes(amount, screenSize) {
  var currentStack = [];

  Widget timePeriod2 = Padding(
    padding: EdgeInsets.fromLTRB(0, ((screenSize.height) / 2) - (100), 0, 0),
    child: SizedBox(
      width: screenSize.width / amount,
      height: 100 * 2,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 86, 57, 168),
        ),
      ),
    ),
  );

  for (var i = 0; i < amount; i++) {
    currentStack.add(noodles(amount, screenSize));
  }

  for (var i = 0; i < currentStack.length; i++) {
    print(currentStack[i]);
  }

  return timePeriod2;
}
