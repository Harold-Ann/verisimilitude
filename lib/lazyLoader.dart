import 'package:flutter/material.dart';
import 'dart:math';

randy(upper) {
  var randomNum = Random();
  return randomNum.nextInt(upper);
}

drawRect(totalAmount, screenSize, scaleFactor) {
  Widget timePeriod = Padding(
    padding: EdgeInsets.fromLTRB(
        0, ((screenSize.height) / 2) - (100 * (1 / scaleFactor)), 0, 0),
    child: SizedBox(
      width: screenSize.width / totalAmount,
      height: (100 * ((1 / scaleFactor) * 2)).toDouble(),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, randy(200), randy(200), randy(200)),
        ),
      ),
    ),
  );
  return timePeriod;
}

fillerRect(totalAmount, fillerWidth, screenSize, scaleFactor) {
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

lazyLoad(screenSize, xCoord, yCoord, zCoord, totalSegments, scaleFactor) {
  List<Widget> currentStack = [];
  var entireLength = screenSize.width * zCoord;
  var singleSegment = entireLength / totalSegments;
  var summedSegments = 0.0;
  var currentSegment = 0.0;
  var onScreenSegments = (screenSize.width / singleSegment).round() + 1;

  var millenia = 12;
  late var centuries = millenia * 10;
  late var decades = centuries * 10;
  late var years = decades * 10;
  late var months = years * 12;

  // calculations

  // CHANGE ZOOM LEVEL 7.4 FROM 5 DECADES PER CENTURY TO 10 DECADES PER CENTURY. ONLY 7.4 THO
  // ALSO MAKE SMALLER ZOOM LEVELS VERTICALLY SHORTER SO MORE CAN FIT ON SCREEN.
  if (zCoord > 0 && zCoord < 2) {
    for (var i = 0; i < totalSegments; i++) {
      summedSegments += singleSegment;
      currentSegment += 1;
      if (summedSegments - screenSize.width >
          (xCoord.abs() - screenSize.width)) {
        break;
      }
    }

    // MILLENIA
    if (totalSegments == millenia) {
      var displayedSegments = 0;
      var fillerSize = 0;

      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = totalSegments - currentSegment + 1;
      } else {
        displayedSegments = onScreenSegments + 1;
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }
      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
      }
    }

    // CENTURIES
    if (totalSegments == centuries) {
      var displayedSegments = 0;
      var fillerSize = 0;

      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = totalSegments - currentSegment + 1;
      } else {
        displayedSegments = onScreenSegments;
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }
      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
      }
    }
  } else if (zCoord > 2 && zCoord < 7) {
    for (var i = 0; i < totalSegments; i++) {
      summedSegments += singleSegment;
      currentSegment += 1;
      if (summedSegments - screenSize.width >
          (xCoord.abs() - screenSize.width)) {
        break;
      }
    }

    // MILLENIA
    if (totalSegments == millenia) {
      var displayedSegments = 0;
      var fillerSize = 0;

      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = totalSegments - currentSegment + 1;
      } else {
        displayedSegments = onScreenSegments + 1;
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }
      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
      }
    }

    // CENTURIES
    if (totalSegments == centuries) {
      var displayedSegments = 0;
      var fillerSize = 0;

      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = totalSegments - currentSegment + 1;
      } else {
        displayedSegments = onScreenSegments;
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }
      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
      }
    }

    // DECADES
    if (totalSegments == decades) {
      var displayedSegments = 0;
      var fillerSize = 0;
      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = ((totalSegments - currentSegment) / 2).round();
      } else {
        displayedSegments = (onScreenSegments / 2).round();
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }

      if (fillerSize % 2 == 1) {
        fillerSize++;
      }

      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(
            drawRect((totalSegments / 2).round(), screenSize, scaleFactor));
      }
    }
  } else if (zCoord > 7 && zCoord < 10) {
    for (var i = 0; i < totalSegments; i++) {
      summedSegments += singleSegment;
      currentSegment += 1;
      if (summedSegments - screenSize.width >
          (xCoord.abs() - screenSize.width)) {
        break;
      }
    }

    // MILLENIA
    if (totalSegments == millenia) {
      var displayedSegments = 0;
      var fillerSize = 0;

      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = totalSegments - currentSegment + 1;
      } else {
        displayedSegments = onScreenSegments + 1;
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }
      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
      }
    }

    // CENTURIES
    if (totalSegments == centuries) {
      var displayedSegments = 0;
      var fillerSize = 0;

      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = totalSegments - currentSegment + 1;
      } else {
        displayedSegments = onScreenSegments;
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }
      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
      }
    }

    // DECADES
    if (totalSegments == decades) {
      var displayedSegments = 0;
      var fillerSize = 0;
      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = ((totalSegments - currentSegment)).round();
      } else {
        displayedSegments = (onScreenSegments).round();
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }

      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack
            .add(drawRect((totalSegments).round(), screenSize, scaleFactor));
      }
    }
  } else if (zCoord > 10 && zCoord < 50) {
    for (var i = 0; i < totalSegments; i++) {
      summedSegments += singleSegment;
      currentSegment += 1;
      if (summedSegments - screenSize.width >
          (xCoord.abs() - screenSize.width)) {
        break;
      }
    }

    // CENTURIES
    if (totalSegments == centuries) {
      var displayedSegments = 0;
      var fillerSize = 0;

      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = totalSegments - currentSegment + 1;
      } else {
        displayedSegments = onScreenSegments;
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }
      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
      }
    }

    // DECADES
    if (totalSegments == decades) {
      var displayedSegments = 0;
      var fillerSize = 0;

      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = totalSegments - currentSegment + 1;
      } else {
        displayedSegments = onScreenSegments;
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }
      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
      }
    }

    // YEARS
    if (totalSegments == years) {
      var displayedSegments = 0;
      var fillerSize = 0;
      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = ((totalSegments - currentSegment) / 2).round();
      } else {
        displayedSegments = (onScreenSegments / 2).round();
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }

      if (fillerSize % 2 == 1) {
        fillerSize++;
      }

      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(
            drawRect((totalSegments / 2).round(), screenSize, scaleFactor));
      }
    }
  } else if (zCoord > 50 && zCoord < 90) {
    for (var i = 0; i < totalSegments; i++) {
      summedSegments += singleSegment;
      currentSegment += 1;
      if (summedSegments - screenSize.width >
          (xCoord.abs() - screenSize.width)) {
        break;
      }
    }

    // DECADES
    if (totalSegments == decades) {
      var displayedSegments = 0;
      var fillerSize = 0;

      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = totalSegments - currentSegment + 1;
      } else {
        displayedSegments = onScreenSegments;
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }
      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
      }
    }

    // YEARS
    if (totalSegments == years) {
      var displayedSegments = 0;
      var fillerSize = 0;

      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = totalSegments - currentSegment + 1;
      } else {
        displayedSegments = onScreenSegments;
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }
      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
      }
    }
  } else if (zCoord > 90 && zCoord < 200) {
    for (var i = 0; i < totalSegments; i++) {
      summedSegments += singleSegment;
      currentSegment += 1;
      if (summedSegments - screenSize.width >
          (xCoord.abs() - screenSize.width)) {
        break;
      }
    }

    // DECADES
    if (totalSegments == decades) {
      var displayedSegments = 0;
      var fillerSize = 0;

      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = totalSegments - currentSegment + 1;
      } else {
        displayedSegments = onScreenSegments;
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }
      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
      }
    }

    // YEARS
    if (totalSegments == years) {
      var displayedSegments = 0;
      var fillerSize = 0;

      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = totalSegments - currentSegment + 1;
      } else {
        displayedSegments = onScreenSegments;
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }
      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
      }
    }

    // MONTHS
    if (totalSegments == months) {
      var displayedSegments = 0;
      var fillerSize = 0;
      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = ((totalSegments - currentSegment) / 4).round();
      } else {
        displayedSegments = (onScreenSegments / 4).round();
      }

      for (var i = 0; i < currentSegment - 2; i++) {
        fillerSize++;
      }

      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(
            drawRect((totalSegments / 4).round(), screenSize, scaleFactor));
      }
    }
  } else if (zCoord > 200 && zCoord < 600) {
    for (var i = 0; i < totalSegments; i++) {
      summedSegments += singleSegment;
      currentSegment += 1;
      if (summedSegments - screenSize.width >
          (xCoord.abs() - screenSize.width)) {
        break;
      }
    }

    // YEARS
    if (totalSegments == years) {
      var displayedSegments = 0;
      var fillerSize = 0;

      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = totalSegments - currentSegment + 1;
      } else {
        displayedSegments = onScreenSegments;
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }
      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
      }
    }

    // MONTHS
    if (totalSegments == months) {
      var displayedSegments = 0;
      var fillerSize = 0;
      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = ((totalSegments - currentSegment) / 2).round();
      } else {
        displayedSegments = (onScreenSegments / 2).round();
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }

      if (fillerSize % 2 == 1) {
        fillerSize++;
      }

      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(
            drawRect((totalSegments / 2).round(), screenSize, scaleFactor));
      }
    }
  } else if (zCoord > 600) {
    for (var i = 0; i < totalSegments; i++) {
      summedSegments += singleSegment;
      currentSegment += 1;
      if (summedSegments - screenSize.width >
          (xCoord.abs() - screenSize.width)) {
        break;
      }
    }

    // YEARS
    if (totalSegments == years) {
      var displayedSegments = 0;
      var fillerSize = 0;

      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = totalSegments - currentSegment + 1;
      } else {
        displayedSegments = onScreenSegments;
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }
      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
      }
    }

    // MONTHS
    if (totalSegments == months) {
      var displayedSegments = 0;
      var fillerSize = 0;

      if (currentSegment + onScreenSegments > totalSegments) {
        displayedSegments = totalSegments - currentSegment + 1;
      } else {
        displayedSegments = onScreenSegments;
      }

      for (var i = 0; i < currentSegment - 1; i++) {
        fillerSize++;
      }
      currentStack
          .add(fillerRect(totalSegments, fillerSize, screenSize, scaleFactor));

      for (var i = 0; i < displayedSegments; i++) {
        currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
      }
    }
  } else {
    for (var i = 0; i < totalSegments; i++) {
      currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
    }
  }
  return currentStack;
}
