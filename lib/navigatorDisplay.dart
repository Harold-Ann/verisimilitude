import 'package:flutter/material.dart';
import 'lazyLoader.dart';

drawRect1(totalAmount, screenSize, scaleFactor) {
  Widget timePeriod1 = SizedBox(
    width: screenSize.width / totalAmount,
    height: 100,
    child: Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, randy(200), randy(200), randy(200)),
      ),
    ),
  );
  return timePeriod1;
}

groupRects(screenSize) {
  List<Widget> currentStack2 = [];
  for (var i = 0; i < 12; i++) {
    currentStack2.add(drawRect1(12, screenSize, 3));
  }
  return currentStack2;
}

drawFillerX(screenSize, xCoord, yCoord, zCoord) {
  Widget fillerX = SizedBox(
    width: ((xCoord).abs() / zCoord),
    height: 99,
    //height: (screenSize.height / zCoord) / 10
    child: Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
    ),
  );
  return fillerX;
}

drawFillerY(screenSize, xCoord, yCoord, zCoord) {
  Widget fillerY = SizedBox(
    width: screenSize.width,
    height: ((yCoord).abs() / zCoord) / 10,
    child: Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
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
        height: 101,
        child: Stack(
          children: [
            Row(
              children: groupRects(screenSize),
            ),
            Column(
              children: [
                drawFillerY(screenSize, xCoord, yCoord, zCoord),
                Row(
                  children: [
                    drawFillerX(screenSize, xCoord, yCoord, zCoord),
                    Align(
                      alignment: Alignment.topLeft,
                      child: positionIdentifier(
                          screenSize, xCoord, yCoord, zCoord),
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
