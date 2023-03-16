import 'package:flutter/material.dart';
import 'lazy_loader.dart';

var millenia = 12;
var centuries = millenia * 10;
var decades = centuries * 10;
var years = decades * 10;
var months = years * 12;

var currentSegmentVariable = 0;
setTheVar(variableSet) {
  currentSegmentVariable = variableSet;
}

// displays the rectangles/background in nav bar
drawNavRect(screenSize, totalAmount) {
  Widget navigationRectangle = SizedBox(
    width: screenSize.width / totalAmount,
    height: screenSize.height / 10,
    child: Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, randy(200), randy(200), randy(200)),
      ),
    ),
  );
  return navigationRectangle;
}

groupNavRects(screenSize, zCoord) {
  List<Widget> rectangleStack = [];
  if (zCoord > 0 && zCoord < 12) {
    for (var i = 0; i < 12; i++) {
      rectangleStack.add(drawNavRect(screenSize, 12));
    }
  } else if (zCoord > 12 && zCoord < 100) {
    for (var i = 0; i < 10; i++) {
      rectangleStack.add(drawNavRect(screenSize, 10));
    }
  }
  return rectangleStack;
}

// change to 10 total rectangles when zoomed into centuries/decades
// put buttons under each side in order to skip 100, 10, 1 years etc

// displays the text in nav bar
drawTextDisplay(screenSize, zCoord, totalAmount, year) {
  if (zCoord > 0 && zCoord < 12) {
    year -= 10;
    year *= 1000;
  } else if (zCoord > 12 && zCoord < 100) {
    year -= 10;
    year /= 10;
    year -= 10 - currentSegmentVariable;
    year *= 1000;
    if (year > currentSegmentVariable * -1000 - 1000) {}
    if (year <= currentSegmentVariable * -1000) {}
  }

  Widget navigationText =
      SizedBox(width: screenSize.width / totalAmount, child: Text("$year"));
  return navigationText;
}

groupTextDisplay(screenSize, zCoord) {
  List<Widget> textStack = [];
  if (zCoord > 0 && zCoord < 12) {
    for (var i = 0; i < 12; i++) {
      textStack.add(drawTextDisplay(screenSize, zCoord, 12, i));
    }
  } else if (zCoord > 12 && zCoord < 100) {
    for (var i = 0; i < 10; i++) {
      textStack.add(drawTextDisplay(screenSize, zCoord, 10, i));
    }
  }
  return textStack;
}

// fillers for position identifier
drawFillerX(screenSize, xCoord, yCoord, zCoord) {
  var localWidth = 0.0;
  if (zCoord > 0 && zCoord < 12) {
    localWidth = (xCoord.abs() / zCoord);
    print("$localWidth X regular");
  } else if (zCoord > 12 && zCoord < 100) {
    localWidth = (xCoord.abs() / (zCoord / 12));
    print("$localWidth X zoom");
  }
  Widget fillerX = SizedBox(
    width: localWidth,
    height: 100,
    //height: (screenSize.height / zCoord) / 10
    child: Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 6, 5, 110)),
    ),
  );
  return fillerX;
}

drawFillerY(screenSize, xCoord, yCoord, zCoord) {
  var localWidth = 0.0;
  if (zCoord > 0 && zCoord < 12) {
    localWidth = screenSize.width - ((xCoord).abs() / zCoord);
    print("$localWidth Y regular");
  } else if (zCoord > 12 && zCoord < 100) {
    localWidth = screenSize.width - ((xCoord).abs() / (zCoord * 12));
    print("$localWidth Y zoom");
  }
  Widget fillerY = SizedBox(
    width: localWidth,
    height: (((screenSize.height / 10) / 2) -
        (((screenSize.height / zCoord) / 100)) / 2),
    //height: ((yCoord.abs() / zCoord) + ((yCoord.abs() / zCoord) / 10)) / 10,
    child: Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 226, 213, 32)),
    ),
  );
  return fillerY;
}

// position identifier (black box in nav bar)
positionIdentifier(screenSize, xCoord, yCoord, zCoord) {
  var localWidth = 0.0;
  if (zCoord > 0 && zCoord < 12) {
    localWidth = (screenSize.width / zCoord) - 1;
    print("$localWidth pos regular");
  } else if (zCoord > 12 && zCoord < 100) {
    localWidth = ((screenSize.width / zCoord) * 12) - 1;
    print("$localWidth pos zoom");
  }
  Widget positionDisplay = Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      color: Color.fromARGB(50, 0, 0, 0),
    ),
    width: localWidth,
    height: (screenSize.height / zCoord) / 100,
  );
  return positionDisplay;
}

// actual display widget
navigatorDisplay(screenSize, xCoord, yCoord, zCoord) {
  var localWidth = 0.0;
  if (zCoord > 0 && zCoord < 12) {
    localWidth = screenSize.width -
        ((screenSize.width / zCoord)) -
        ((xCoord).abs() / zCoord) +
        1;
    print("$localWidth end regular");
  } else if (zCoord > 12 && zCoord < 100) {
    localWidth = screenSize.width -
        ((screenSize.width / zCoord) / 12) -
        ((xCoord).abs() / (zCoord / 12)) +
        1;
    print("$localWidth end zoom");
  }
  Widget navigatorDisplay = Align(
    alignment: Alignment.topCenter,
    child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black),
          ),
        ),
        width: screenSize.width,
        height: screenSize.height / 10,
        child: Stack(
          children: [
            Row(
              children: groupNavRects(screenSize, zCoord),
            ),
            Row(
              children: groupTextDisplay(screenSize, zCoord),
            ),
            Row(
              children: [
                drawFillerX(screenSize, xCoord, yCoord, zCoord),
                Column(
                  children: [
                    drawFillerY(screenSize, xCoord, yCoord, zCoord),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: positionIdentifier(
                              screenSize, xCoord, yCoord, zCoord),
                        ),
                        Container(
                          color: Color.fromARGB(255, 177, 16, 16),
                          width: localWidth,
                          height: (screenSize.height / zCoord) / 100,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        )),
  );
  return navigatorDisplay;
}
