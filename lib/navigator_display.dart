import 'package:flutter/material.dart';
import 'lazy_loader.dart';

var millenia = 12;
var centuries = millenia * 10;
var decades = centuries * 10;
var years = decades * 10;
var months = years * 12;

var currentMillenium = 0;
var currentCentury = 0;
currentMilleniaSet(variable) {
  currentMillenium = variable;
}

currentCenturySet(variable) {
  currentCentury = variable;
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
    year -= 9;
    year *= 1000;
    year += (100 * (currentCentury - 1));
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
  var localWidthX = 0.0;
  if (zCoord > 0 && zCoord < 12) {
    localWidthX = (xCoord.abs() / zCoord);
    //print("$localWidthX X regular");
  } else if (zCoord > 12 && zCoord < 100) {
    localWidthX = (xCoord.abs() / (zCoord / 12)) -
        ((screenSize.width / 10) * (currentCentury - 1));
    //print("$localWidthX X zoom");
  }
  Widget fillerX = SizedBox(
    width: localWidthX,
    height: 100,
    //height: (screenSize.height / zCoord) / 10
    child: Container(
      decoration: BoxDecoration(color: Color.fromARGB(0, 6, 5, 110)),
    ),
  );
  return fillerX;
}

drawFillerY(screenSize, xCoord, yCoord, zCoord) {
  var localWidthY = 0.0;
  if (zCoord > 0 && zCoord < 12) {
    localWidthY = screenSize.width -
        (drawFillerX(screenSize, xCoord, yCoord, zCoord).width);
    //print("$localWidthY Y regular");
  } else if (zCoord > 12 && zCoord < 100) {
    localWidthY = screenSize.width -
        (drawFillerX(screenSize, xCoord, yCoord, zCoord).width);
    //print("$localWidthY Y zoom");
  }
  Widget fillerY = SizedBox(
    width: localWidthY,
    height: (((screenSize.height / 10) / 2) -
        (((screenSize.height / zCoord) / 100)) / 2),
    //height: ((yCoord.abs() / zCoord) + ((yCoord.abs() / zCoord) / 10)) / 10,
    child: Container(
      decoration: BoxDecoration(color: Color.fromARGB(0, 226, 213, 32)),
    ),
  );
  return fillerY;
}

// position identifier (black box in nav bar)
positionIdentifier(screenSize, xCoord, yCoord, zCoord) {
  var localWidthP = 0.0;
  if (zCoord > 0 && zCoord < 12) {
    localWidthP = (screenSize.width / zCoord) - 1;
    //print("$localWidthP pos regular");
  } else if (zCoord > 12 && zCoord < 100) {
    localWidthP = ((screenSize.width / zCoord) * 12);
    if (localWidthP + drawFillerX(screenSize, xCoord, yCoord, zCoord).width >
        screenSize.width) {
      localWidthP -= drawFillerX(screenSize, xCoord, yCoord, zCoord).width - 22;
    }
    //print("$localWidthP pos zoom");
  }
  Widget positionDisplay = SizedBox(
      width: localWidthP,
      height: 10,
      //(screenSize.height / zCoord) / 100,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
      ));
  return positionDisplay;
}

// actual display widget
navigatorDisplay(screenSize, xCoord, yCoord, zCoord) {
  var localWidthE = 0.0;
  if (zCoord > 0 && zCoord < 12) {
    localWidthE = screenSize.width -
        (positionIdentifier(screenSize, xCoord, yCoord, zCoord).width) -
        (drawFillerX(screenSize, xCoord, yCoord, zCoord).width);
    //print("$localWidthE end regular");
  } else if (zCoord > 12 && zCoord < 100) {
    localWidthE = screenSize.width -
        positionIdentifier(screenSize, xCoord, yCoord, zCoord).width -
        (drawFillerX(screenSize, xCoord, yCoord, zCoord).width);
    //print("$localWidthE end zoom");
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
                          color: Color.fromARGB(0, 177, 16, 16),
                          width: localWidthE,
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
