import 'package:flutter/material.dart';
import 'dart:math';

randy(upper) {
  var randomNum = Random();
  return randomNum.nextInt(upper);
}

timePeriod(totalAmount, screenSize, scaleFactor) {
  print("amount of rectangles active / $totalAmount");
  Widget timePeriod = Padding(
    padding: EdgeInsets.fromLTRB(
        0, ((screenSize.height) / 2) - (100 * (1 / scaleFactor)), 0, 0),
    child: SizedBox(
      width: screenSize.width / totalAmount,
      height: (100 * ((1 / scaleFactor) * 2)).toDouble(),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 200, randy(200), randy(200)),
        ),
      ),
    ),
  );
  return timePeriod;
}

filler(totalAmount, screenSize, scaleFactor) {
  print("amount of filler active / $totalAmount");
  Widget spaceTakerUpper = Padding(
    padding: EdgeInsets.fromLTRB(
        0, ((screenSize.height) / 2) - (100 * (1 / scaleFactor)), 0, 0),
    child: SizedBox(
      width: screenSize.width / totalAmount,
      //width: screenSize.width - (screenSize.width / totalAmount) - 1,
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

fillerDos(totalAmount, fillerWidth, screenSize, scaleFactor) {
  Widget spaceTakerUpper = Padding(
    padding: EdgeInsets.fromLTRB(
        0, ((screenSize.height) / 2) - (100 * (1 / scaleFactor)), 0, 0),
    child: SizedBox(
      width: (screenSize.width / totalAmount) * fillerWidth,
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

  if (zCoord > 12 && zCoord < 20) {
    for (var i = 0; i < totalSegments; i++) {
      summedSegments += singleSegment;
      currentSegment += 1;
      if (summedSegments - screenSize.width >
          (xCoord.abs() - screenSize.width)) {
        break;
      }
    }

    // MILLENIA
    if (totalSegments < 100) {
      var displayedSegments = 0;
      if (currentSegment == 1 || currentSegment == totalSegments) {
        displayedSegments = 2;
      } else {
        displayedSegments = 3;
      }

      for (var i = 0; i < currentSegment - 2; i++) {
        currentStack.add(filler(totalSegments, screenSize, scaleFactor));
      }
      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(timePeriod(totalSegments, screenSize, scaleFactor));
      }
      for (var i = 0; i < (totalSegments - currentSegment - 1); i++) {
        currentStack.add(filler(totalSegments, screenSize, scaleFactor));
      }
    }

    // CENTURIES
    if (totalSegments > 100) {
      var displayedSegments = 0;
      var frontFiller = 0;
      var backFiller = 0;
      if (currentSegment >= totalSegments - 11) {
        displayedSegments = totalSegments - currentSegment + 2;
      } else if (currentSegment == 1) {
        displayedSegments = 13;
      } else {
        displayedSegments = 14;
      }
      print("$currentSegment / $totalSegments");

      for (var i = 0; i < currentSegment - 2; i++) {
        frontFiller++;
        //currentStack.add(filler(totalSegments, screenSize, scaleFactor));
      }

      print(frontFiller);
      currentStack
          .add(fillerDos(totalSegments, frontFiller, screenSize, scaleFactor));
      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(timePeriod(totalSegments, screenSize, scaleFactor));
      }
      // for (var i = 0; i < (totalSegments - currentSegment - 12); i++) {
      //   backFiller++;
      //   currentStack.add(filler(totalSegments, screenSize, scaleFactor));
      // }
      //currentStack.add(fillerDos(backFiller, screenSize, scaleFactor));

      var rectangleWidth = (screenSize.width * zCoord) / totalSegments;
      var frontFillerWidth = rectangleWidth * frontFiller;
      var backFillerWidth = rectangleWidth * backFiller;
      print("FILLER WIDTH front: $frontFillerWidth back: $backFillerWidth");
    }
  } else if (zCoord > 20) {
    print("smol");
  } else {
    for (var i = 0; i < totalSegments; i++) {
      currentStack.add(timePeriod(totalSegments, screenSize, scaleFactor));
    }
  }
  return currentStack;
}
