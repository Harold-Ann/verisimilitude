import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'timeline.dart';
import 'lazyLoader.dart';

void main() => runApp(const MyApp());

/*
TODO: transformation Controller
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApplication(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApplication extends StatefulWidget {
  const MyApplication({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApplication> with TickerProviderStateMixin {
  double _zValue = 1 as double;
  double _xValue = 1 as double;
  double _yValue = 1 as double;
  String roundedZ = "";
  String roundedX = "";
  String roundedY = "";
  var millenia = 12;
  late var centuries = millenia * 10;
  late var decades = centuries * 10;
  late var years = decades * 10;
  late var months = years * 12;
  final controller = TransformationController();
  late AnimationController controllerReset;
  late AnimationController controllerLeft;
  late AnimationController controllerNow;
  late AnimationController controllerNow1;

  var matrix1 = Matrix4(98716, 0, 0, 0, 0, 98716, 0, 0, 0, 0, 98716, 0,
      -148072500, -49308142, 0, 1);

  var matrix2 = Matrix4.identity();
  var matrix3 = Matrix4.identity();

  var matrix5 = Matrix4.identity();

  var _currentMatrix = Matrix4.identity();

  @override
  void initState() {
    super.initState();

    controllerReset =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    controllerNow =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    controllerNow1 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    controllerLeft =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    controller.addListener(() {
      _currentMatrix = controller.value;
      _zValue = controller.value.getMaxScaleOnAxis();
      _xValue = controller.value.row0[3];
      _yValue = controller.value.row1[3];

      // moves the screen to the left 500
      // matrix5 = controller.value;
      // var newX = controller.value.row0[3] += 500;
      // print(matrix5.row0[3]);
      // print(newX);
      // matrix5 = Matrix4(_zValue, 0, 0, 0, 0, _zValue, 0, 0, 0, 0, _zValue, 0,
      //     newX, _yValue, 0, 1);
      // print(matrix5.row0[3]);

      // matrix3 = Matrix4(
      //     controller.value.getMaxScaleOnAxis(),
      //     0,
      //     0,
      //     0,
      //     0,
      //     controller.value.getMaxScaleOnAxis(),
      //     0,
      //     0,
      //     0,
      //     0,
      //     controller.value.getMaxScaleOnAxis(),
      //     0,
      //     /*-148072500*/ (1500 * controller.value.getMaxScaleOnAxis()),
      //     -49308142,
      //     0,
      //     1);

      // print("squeaky leaky");
      // print("oogie boogie");
      // print("toodle poodle");

      print("Go");
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: InteractiveViewer(
            onInteractionEnd: (details) {
              print("Stop");
              setState(() {
                roundedZ = _zValue.toStringAsFixed(1);
                roundedX = (_xValue.abs()).toStringAsFixed(0);
                roundedY = (_yValue.abs()).toStringAsFixed(0);

                //draw(_xValue, _yValue);
                //if (kIsWeb) {
                /*
                var matrix2 = Matrix4(
                    _zValue,
                    0,
                    0,
                    0,
                    0,
                    _zValue,
                    0,
                    0,
                    0,
                    0,
                    _zValue,
                    0,
                    /*-148072500*/ screenSize.width * _zValue,
                    -49308142,
                    0,
                    1);
                */
                //if (_zValue < 1) {
                //  _zValue = 1;
                //}
                //if (_zValue > 98716) {
                //  _zValue = 98716;
                //}

                // } else {
                //   if (Platform.isAndroid) {
                //     // Android-specific code
                //   } else if (Platform.isIOS) {
                //     // iOS-specific code
                //   }
                // }
              });
            },
            boundaryMargin: const EdgeInsets.all(0),
            minScale: 0.1,
            maxScale: 3269017,
            transformationController: controller,
            child: Stack(
              children: [
                Row(
                  children: lazyLoad(
                      screenSize, _xValue, _yValue, _zValue, millenia, (1)),
                  //12 millennia millennium 12
                ),
                Row(
                  children: lazyLoad(
                      screenSize, _xValue, _yValue, _zValue, centuries, (2)),
                  //10 centuries century per millennia millennium 12 * 10
                ),
                Row(
                  children: lazyLoad(
                      screenSize, _xValue, _yValue, _zValue, decades, (4)),
                  //10 decades decade per centuries century 12 * 10 * 10
                ),
                Row(
                  children: lazyLoad(
                      screenSize, _xValue, _yValue, _zValue, years, (8)),
                  //10 years year per decades decade 12 * 10 * 10 * 10
                ),
                Row(
                  children: lazyLoad(
                      screenSize, _xValue, _yValue, _zValue, months, (16)),
                  //12 months month per years year 12 * 10 * 10 * 10 * 12
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.white,
            width: 800,
            height: 152,
            child: Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: reset, icon: const Icon(Icons.business)),
                      IconButton(
                          onPressed: now, icon: const Icon(Icons.architecture)),
                      IconButton(
                          onPressed: () => moveLeft(_xValue),
                          icon: const Icon(Icons.gamepad)),
                    ],
                  ),
                ),
                Text(
                  "Screen Size: ${screenSize.width}x${screenSize.height}\nCurrent Zoom: $roundedZ \nCoordinates:\nX:$roundedX Y: $roundedY",
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                  child: Text(
                    "Trial1:\n$_currentMatrix",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  void now() {
    final animationNow = Matrix4Tween(
      begin: controller.value,
      end: matrix1,
    ).animate(controllerNow);

    animationNow.addListener(() {
      controller.value = animationNow.value;
    });

    controllerNow.reset();
    controllerNow.fling();
  }

  moveLeft(xVal) {
    final animationLeft = Matrix4Tween(
      begin: controller.value,
      end: matrix5,
    ).animate(controllerLeft);

    animationLeft.addListener(() {
      controller.value = animationLeft.value;
    });

    controllerLeft.reset();
    controllerLeft.fling();
  }

  void reset() {
    final animationReset = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity(),
    ).animate(controllerReset);

    animationReset.addListener(() {
      controller.value = animationReset.value;
    });

    controllerReset.reset();
    controllerReset.fling();
  }
}
