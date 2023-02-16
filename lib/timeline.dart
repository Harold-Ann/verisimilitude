import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

randy(upper) {
  var randomNum = Random();
  return randomNum.nextInt(upper);
}

timePeriod(current, totalAmount, screenSize, scaleFactor) {
  print("amount of rectangles active");
  Widget timePeriod = Padding(
    padding: EdgeInsets.fromLTRB(
        0, ((screenSize.height) / 2) - (100 * (1 / scaleFactor)), 0, 0),
    child: SizedBox(
      width: screenSize.width / totalAmount,
      height: (100 * ((1 / scaleFactor) * 2)).toDouble(),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 150, randy(255), randy(255)),
        ),
      ),
    ),
  );
  return timePeriod;
}

filler(current, totalAmount, screenSize, scaleFactor) {
  print("amount of filler active");
  Widget spaceTakerUpper = Padding(
    padding: EdgeInsets.fromLTRB(
        0, ((screenSize.height) / 2) - (100 * (1 / scaleFactor)), 0, 0),
    child: SizedBox(
      width: screenSize.width / totalAmount,
      height: (100 * ((1 / scaleFactor) * 2)).toDouble(),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
    ),
  );
  return spaceTakerUpper;
}

filler1(totalAmount, screenSize, scaleFactor) {
  print("amount of filler1 active $totalAmount");
  Widget spaceTakerUpper = Padding(
    padding: EdgeInsets.fromLTRB(
        1, ((screenSize.height) / 2) - (100 * (1 / scaleFactor)), 0, 0),
    child: SizedBox(
      width: screenSize.width - (screenSize.width / totalAmount) - 1,
      height: (100 * ((1 / scaleFactor) * 2)).toDouble(),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
    ),
  );
  return spaceTakerUpper;
}

timePeriodGenerator(totalAmount, screenSize, scaleFactor, xVal, yVal, zVal) {
  List<Widget> currentStack = [];

  for (var i = 0; i < totalAmount; i++) {
    currentStack.add(timePeriod(i, totalAmount, screenSize, scaleFactor));
  }

  return currentStack;
}

timePeriodGenerator1(totalAmount, screenSize, scaleFactor, xVal, yVal, zVal) {
  List<Widget> currentStack = [];
  var roundX = xVal.round();
  var roundY = yVal.round();
  var roundZ = zVal.round();

  //print("${xVal.abs()}, ${yVal.abs()}, ${zVal.abs()}");
  if ((roundX.abs()) >
          (((roundZ * screenSize.width) - screenSize.width) + 250) &&
      (roundY.abs()) < ((roundZ * screenSize.height) / 2) &&
      (roundY.abs()) >
          (((roundZ * screenSize.height) / 2) - screenSize.height) &&
      (roundZ.abs()) >= 12) {
    if (totalAmount < 100) {
      currentStack.add(filler1(totalAmount, screenSize, scaleFactor));
    }
    if (totalAmount > 100) {
      currentStack.add(filler1(12, screenSize, scaleFactor));
    }
    for (var i = 0; i < totalAmount; i++) {
      if (i >= totalAmount - (totalAmount / 12)) {
        currentStack.add(timePeriod(i, totalAmount, screenSize, scaleFactor));
      }
    }
  } else {
    for (var i = 0; i < totalAmount; i++) {
      currentStack.add(timePeriod(i, totalAmount, screenSize, scaleFactor));
    }
  }
  return currentStack;
}
