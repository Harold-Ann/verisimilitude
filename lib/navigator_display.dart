import 'package:flutter/material.dart';
import 'lazy_loader.dart';

var millenia = 12;
var centuries = millenia * 10;
var decades = centuries * 10;
var years = decades * 10;
var months = years * 12;

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
    for (var i = 0; i < 12; i++) {
      rectangleStack.add(drawNavRect(screenSize, 12));
    }
  }
  return rectangleStack;
}

drawTextDisplay(screenSize, totalAmount, num2) {
  num2 -= 10;
  num2 *= 1000;
  Widget navigationText =
      SizedBox(width: screenSize.width / 12, child: Text("$num2"));
  return navigationText;
}

groupTextDisplay(screenSize, zCoord) {
  List<Widget> textStack = [];
  if (zCoord > 0 && zCoord < 12) {
    for (var i = 0; i < 12; i++) {
      textStack.add(drawTextDisplay(screenSize, 12, i));
    }
  } else if (zCoord > 12 && zCoord < 100) {
    for (var i = 0; i < 12; i++) {
      textStack.add(drawTextDisplay(screenSize, 12, i));
    }
  }
  return textStack;
}

drawFillerX(screenSize, xCoord, yCoord, zCoord) {
  Widget fillerX = SizedBox(
    width: (xCoord.abs() / zCoord),
    height: 100,
    //height: (screenSize.height / zCoord) / 10
    child: Container(
      decoration: BoxDecoration(color: Color.fromARGB(0, 0, 0, 0)),
    ),
  );
  return fillerX;
}

drawFillerY(screenSize, xCoord, yCoord, zCoord) {
  Widget fillerY = SizedBox(
    width: screenSize.width - ((xCoord).abs() / zCoord),
    height: (((screenSize.height / 10) / 2) -
        (((screenSize.height / zCoord) / 100)) / 2),
    //height: ((yCoord.abs() / zCoord) + ((yCoord.abs() / zCoord) / 10)) / 10,
    child: Container(
      decoration: BoxDecoration(color: Color.fromARGB(0, 0, 0, 0)),
    ),
  );
  return fillerY;
}

positionIdentifier(screenSize, xCoord, yCoord, zCoord) {
  Widget positionDisplay = Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      color: Color.fromARGB(50, 0, 0, 0),
    ),
    width: (screenSize.width / zCoord) - 1,
    height: (screenSize.height / zCoord) / 100,
  );
  return positionDisplay;
}

navigatorDisplay(screenSize, xCoord, yCoord, zCoord) {
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
                          color: Color.fromARGB(0, 0, 0, 0),
                          width: screenSize.width -
                              ((screenSize.width / zCoord)) -
                              ((xCoord).abs() / zCoord) +
                              1,
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
