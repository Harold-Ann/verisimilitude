import 'package:flutter/material.dart';
import 'dart:math';

randy(upper) {
  var randomNum = Random();
  return randomNum.nextInt(upper);
}

timePeriod(totalAmount, screenSize, scaleFactor) {
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
  var summedSegments = 0.0;
  var currentSegment = 0.0;

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
      // check whether the screen is at the right end and draws less rectangles
      if (currentSegment >= totalSegments - 10) {
        displayedSegments = totalSegments - currentSegment + 1;
      } else {
        displayedSegments = 11;
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        frontFiller++;
      }

      currentStack
          .add(fillerDos(totalSegments, frontFiller, screenSize, scaleFactor));
      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(timePeriod(totalSegments, screenSize, scaleFactor));
      }
    }

    // DECADES
    if (totalSegments > 1000) {
      var displayedSegments = 0;
      // check whether the screen is at the right end and draws less rectangles
      if (currentSegment >= totalSegments - 110) {
        displayedSegments = totalSegments - currentSegment - 10;
      } else {
        displayedSegments = 90;
      }
      // the actual rectangles on screen being drawn
      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(timePeriod(totalSegments, screenSize, scaleFactor));
      }
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
