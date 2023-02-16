import 'package:flutter/material.dart';
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
          color: Color.fromARGB(255, 255, randy(255), randy(255)),
        ),
      ),
    ),
  );
  return timePeriod;
}

filler(totalAmount, screenSize, scaleFactor) {
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

checkNearby(xCoord, yCoord, zCoord) {
  return "${xCoord.toStringAsFixed(0)}, ${yCoord.toStringAsFixed(0)}, ${zCoord.toStringAsFixed(0)}";
}

appalachianTrail(
    screenSize, xCoord, yCoord, zCoord, totalSegments, scaleFactor) {
  List<Widget> currentStack = [];
  var entireLength = screenSize.width * zCoord;
  var singleSegment = entireLength / totalSegments;
  //print("${singleSegment} single");
  var summedSegments = 0.0;
  var currentSegment = 0.0;
  //print("${xCoord.abs()} Xcoord");
  var roundX = xCoord.round();
  var roundY = yCoord.round();
  var roundZ = zCoord.round();

  if (zCoord >= 12) {
    for (var i = 0; i < totalSegments; i++) {
      summedSegments += singleSegment;
      currentSegment += 1;
      if (summedSegments - screenSize.width >
          (xCoord.abs() - screenSize.width)) {
        break;
      }
    }
    if (totalSegments < 100) {
      for (var i = 0; i < currentSegment; i++) {
        currentStack.add(filler(currentSegment, screenSize, scaleFactor));
      }
    }

    //print(summedSegments);
    // if (currentSegment) {

    // }
  }
  return currentStack;
}
