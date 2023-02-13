import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget potato = Row(
  children: [
    Padding(
      padding: EdgeInsets.fromLTRB(0, ((999) / 2) - (100), 0, 0),
      child: SizedBox(
        width: 1500 / 2,
        height: 100 * 2,
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 22, 255, 158),
          ),
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.fromLTRB(0, ((999) / 2) - (100), 0, 0),
      child: SizedBox(
        width: 1500 / 2,
        height: 100 * 2,
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 121, 23, 96),
          ),
        ),
      ),
    ),
  ],
);

noodles(width) {
  return potato;
}
