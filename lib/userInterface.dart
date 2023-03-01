import 'package:flutter/material.dart';
import 'lazyLoader.dart';

var current_screenSize;
var current_zCoord;
var current_totalSegments;

/*
if (zCoord > 0 && zCoord < 2) {
millenia
} else if (zCoord > 2 && zCoord < 7) {
centuries
} else if (zCoord > 7 && zCoord < 10) {
centuries
} else if (zCoord > 10 && zCoord < 50) {
centuries
} else if (zCoord > 50 && zCoord < 90) {
decades
} else if (zCoord > 90 && zCoord < 200) {
years
} else if (zCoord > 200 && zCoord < 600) {
years
} else if (zCoord > 600) {
months
*/

void getSegmentType(screenSize, zCoord, totalSegments) {
  current_screenSize = screenSize;
  current_zCoord = zCoord;
  current_totalSegments = totalSegments;
}

timescaleDisplay() {
  print(current_screenSize);
  print(current_zCoord);
  print(current_totalSegments);
  var entireLength = current_screenSize.width * current_zCoord;
  var singleSegment = entireLength / current_totalSegments;

  print(singleSegment);

  Widget scaleBoxDisplay = Align(
    alignment: Alignment.bottomRight,
    child: Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: SizedBox(
        width: 300,
        height: 100,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber,
          ),
          child: Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
                width: singleSegment,
                height: 50,
              )),
        ),
      ),
    ),
  );
  return scaleBoxDisplay;
}
