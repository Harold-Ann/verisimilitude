import 'package:flutter/material.dart';

timescaleDisplay(screenSize, zCoord) {
  var millenia = 12;
  late var centuries = millenia * 10;
  late var decades = centuries * 10;
  late var years = decades * 10;
  late var months = years * 12;
  var millenium = "millenium";
  var century = "century";
  var decade = "decade";
  var year = "year";
  var month = "month";

  var largeDisplayUnit = 0;
  var largeDisplayText = "";
  var smallDisplayUnit = 0;
  var smallDisplayText = "";

  var largeEntireLength = screenSize.width * zCoord;
  var smallEntireLength = screenSize.width * zCoord;
  var largeSegment = 0.0;
  var smallSegment = 0.0;

  if (zCoord > 0 && zCoord < 2) {
    largeDisplayUnit = millenia;
    largeDisplayText = millenium;
    smallDisplayUnit = centuries;
    smallDisplayText = century;
  } else if (zCoord > 2 && zCoord < 4) {
    largeDisplayUnit = millenia;
    largeDisplayText = millenium;
    smallDisplayUnit = centuries;
    smallDisplayText = century;
  } else if (zCoord > 4 && zCoord < 7) {
    largeDisplayUnit = centuries;
    largeDisplayText = century;
    smallDisplayUnit = decades;
    smallDisplayText = decade;
  } else if (zCoord > 7 && zCoord < 10) {
    largeDisplayUnit = centuries;
    largeDisplayText = century;
    smallDisplayUnit = decades;
    smallDisplayText = decade;
  } else if (zCoord > 10 && zCoord < 40) {
    largeDisplayUnit = centuries;
    largeDisplayText = century;
    smallDisplayUnit = decades;
    smallDisplayText = decade;
  } else if (zCoord > 40 && zCoord < 90) {
    largeDisplayUnit = decades;
    largeDisplayText = decade;
    smallDisplayUnit = years;
    smallDisplayText = year;
  } else if (zCoord > 90 && zCoord < 250) {
    largeDisplayUnit = decades;
    largeDisplayText = decade;
    smallDisplayUnit = years;
    smallDisplayText = year;
  } else if (zCoord > 250 && zCoord < 3000) {
    largeDisplayUnit = years;
    largeDisplayText = year;
    smallDisplayUnit = months;
    smallDisplayText = month;
  } else if (zCoord > 3000 && zCoord < 50000) {
    largeDisplayUnit = months;
    largeDisplayText = month;
    smallDisplayUnit = 1;
    smallEntireLength = 0;
  } else if (zCoord > 50000) {
    largeDisplayUnit = 1;
    smallDisplayUnit = 1;
    largeEntireLength = 0;
    smallEntireLength = 0;
    largeDisplayText = "";
    smallDisplayText = "";
  }

  largeSegment = largeEntireLength / largeDisplayUnit;
  smallSegment = smallEntireLength / smallDisplayUnit;

  Widget scaleBoxDisplay = Align(
    alignment: Alignment.bottomRight,
    child: SizedBox(
      width: 500,
      height: 51,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black),
            left: BorderSide(color: Colors.black),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                    ),
                    width: smallSegment,
                    height: 25,
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(smallDisplayText),
                    )),
              ],
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.purple,
                    ),
                    width: largeSegment,
                    height: 25,
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(largeDisplayText),
                    )),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  return scaleBoxDisplay;
}
