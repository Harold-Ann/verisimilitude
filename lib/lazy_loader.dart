import 'package:flutter/material.dart';
import 'dart:math';
import 'navigator_display.dart';
import 'image_loader.dart';

randy(upper) {
  var randomNum = Random();
  return randomNum.nextInt(upper);
}

// make functions that have one millenia, century, etc
// call upon those functions below, can save a lot of space

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

drawRectWithImage(totalAmount, screenSize, scaleFactor, imageTop, imageBottom) {
  Widget timePeriod = Padding(
      padding: EdgeInsets.fromLTRB(
          0, ((screenSize.height) / 2) - (100 * (1 / scaleFactor)), 0, 0),
      child: SizedBox(
          width: screenSize.width / totalAmount,
          height: (100 * ((1 / scaleFactor) * 2)).toDouble(),
          child: Column(
            children: [
              SizedBox(
                width: screenSize.width / totalAmount,
                height: (100 * ((1 / scaleFactor) * 2)).toDouble() / 2,
                child: Image.asset(imageTop, fit: BoxFit.fitHeight),
              ),
              SizedBox(
                width: screenSize.width / totalAmount,
                height: (100 * ((1 / scaleFactor) * 2)).toDouble() / 2,
                child: Image.asset(imageBottom, fit: BoxFit.fitHeight),
              ),
            ],
          )));
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

var currentMillTest = 0.0;
var currentCentTest = 0.0;

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
      //displays 4 segments, could be 3
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
      currentMillTest = currentSegment;
      //print(currentSegment);
      currentMilleniaSet(currentSegment);
    }

    // CENTURIES
    if (totalSegments == centuries) {
      var displayedSegments = 0;
      var fillerSize = 0;
      currentCentTest = currentSegment;

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
      // print("Milltest $currentMillTest");
      // print("Centtest $currentCentTest");
      for (var i = 0; i < displayedSegments; i++) {
        print("current century: $currentCentTest");
        /* for (var year = 1000; year < 2000; year + 100) {
          print("year $year");
          print((year - currentCentTest - 889 + (99 * ((year / 100) - 10))));
          print(((year - currentCentTest) - 889 + (99 * ((year / 100) - 10))));
          if (i ==
              (year - currentCentTest - 889 + (99 * ((year / 100) - 10)))) {
            print("activate");
            var centuryImages = loadImageExample(year);
            var imageTop = centuryImages[0];
            var imageBottom = centuryImages[1];

            currentStack.add(drawRectWithImage(
                totalSegments, screenSize, scaleFactor, imageTop, imageBottom));
          } else {
            currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
          }
          print("cent $currentCentTest");
        } */
        var year = (1000);
        var ex1 = (year -
            currentCentTest -
            (889 + (99 * ((year - 1000) / 100))) +
            (99 * ((year / 100) - (year / 100))));
        print("ex $ex1");
        //print((200 * ((year - 1000) / 100)) - ((year - 1000) / 100));
        //print(ex1 - ((200 * ((year - 1000) / 100))));
        var h1 = (1000 - currentCentTest - 889 + (99 * ((1000 / 100) - 10)));
        var h2 = (1100 - currentCentTest - 988 + (99 * ((1100 / 100) - 11)));
        var h3 = (1200 - currentCentTest - 1087 + (99 * ((1200 / 100) - 12)));
        print("h1 $h1, h2 $h2, h3 $h3");
        print(
            "yikes ${(year - currentCentTest - 889 + (99 * ((year / 100) - 10)))}");
        print("YEAR ${((((currentCentTest / 10) * 10) - 100) * 100) - 100}");
        if (i ==
            currentCentTest -
                ((currentCentTest - 5) + (currentCentTest - 70))) {
          var imageTop = 'images/egyptian_pyramids.jpg';
          var imageBottom = 'images/stonehenge.jpg';
          currentStack.add(drawRectWithImage(
              totalSegments, screenSize, scaleFactor, imageTop, imageBottom));
        } else if (i == 1)
        // (year - currentCentTest - 889 + (99 * ((year / 100) - 10))))
        {
          print("bingo");
          //for (var anno = 1000; anno < 2000; anno + 100) {
          //print(anno);
          var centuryImages = loadImageExample(year);
          var imageTop = centuryImages[0];
          var imageBottom = centuryImages[1];

          // currentStack.add(drawRectWithImage(
          //     totalSegments, screenSize, scaleFactor, imageTop, imageBottom));

          for (var now = 0; now < 10; now++) {
            centuryImages = loadImageExample(year + (now * 100));
            imageTop = centuryImages[0];
            imageBottom = centuryImages[1];

            currentStack.add(drawRectWithImage(
                totalSegments, screenSize, scaleFactor, imageTop, imageBottom));
          }

          //}
        } else if (i == ex1) {
          print("IS A GO");
          /*
          var centuryImages = loadImageExample(year);
          var imageTop = centuryImages[0];
          var imageBottom = centuryImages[1];

          currentStack.add(drawRectWithImage(
              totalSegments, screenSize, scaleFactor, imageTop, imageBottom));
              */
        } else {
          currentStack.add(drawRect(totalSegments, screenSize, scaleFactor));
        }
        // gonna have to do:
        // if millenium = -2000
        // and if century = -600 or whatever
      }

      // if (currentSegment == 75) {
      //   loadImageExample();
      //   print("TRYING");
      // }
      //print(currentSegment);
      currentCenturySet(currentSegment);
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

    // CENTURIES
    if (totalSegments == centuries) {
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
      currentCenturySet(currentSegment);
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

    // CENTURIES
    if (totalSegments == centuries) {
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
      currentCenturySet(currentSegment);
    }

    // DECADES
    if (totalSegments == decades) {
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
