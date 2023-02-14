import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'timeline.dart';

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
  final controller = TransformationController();
  late AnimationController controllerReset;
  late AnimationController controllerNow;
  late AnimationController controllerNow1;

  var matrix1 = Matrix4(98716, 0, 0, 0, 0, 98716, 0, 0, 0, 0, 98716, 0,
      -148072500, -49308142, 0, 1);

  var matrix2 = Matrix4.identity();
  var matrix3 = Matrix4.identity();

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

    controller.addListener(() {
      //print(controller.value.getMaxScaleOnAxis());

      matrix3 = Matrix4(
          controller.value.getMaxScaleOnAxis(),
          0,
          0,
          0,
          0,
          controller.value.getMaxScaleOnAxis(),
          0,
          0,
          0,
          0,
          controller.value.getMaxScaleOnAxis(),
          0,
          /*-148072500*/ (1500 * controller.value.getMaxScaleOnAxis()),
          -49308142,
          0,
          1);

      _zValue = controller.value.getMaxScaleOnAxis();
      _currentMatrix = controller.value;
      _xValue = controller.value.row0[3];
      _yValue = controller.value.row1[3];
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
            onInteractionUpdate: (details) {
              setState(() {
                if (kIsWeb) {
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

                  if (_zValue < 1) {
                    _zValue = 1;
                  }
                  if (_zValue > 98716) {
                    _zValue = 98716;
                  }

                  roundedZ = _zValue.toStringAsFixed(0);
                  roundedX = (_xValue.abs()).toStringAsFixed(0);
                  roundedY = (_yValue.abs()).toStringAsFixed(0);
                } else {
                  if (Platform.isAndroid) {
                    // Android-specific code
                  } else if (Platform.isIOS) {
                    // iOS-specific code
                  }
                }
              });
            },
            boundaryMargin: EdgeInsets.all(0),
            minScale: 0.1,
            maxScale: 3269017,
            transformationController: controller,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 * 4), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 * 8,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 208, 158, 255),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 * 2), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 * 4,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 3, 155),
                      ),
                    ),
                  ),
                ),
                noodles(2, screenSize),
                pancakes(2, screenSize),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, (((screenSize.height) / 2) - (100 / 2)), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 / 4), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 / 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 / 8), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 / 4,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 / 16), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 / 8,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 / 32), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 / 16,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 / 64), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 / 32,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 50, 21, 216),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 / 128), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 / 64,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 / 256), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 / 128,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 204, 176, 14),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 / 512), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 / 256,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 212, 81, 5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 / 1024), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 / 512,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 26, 210, 235),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 / 2048), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 / 1024,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 95, 5, 212),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 / 4096), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 / 2048,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 15, 58, 19),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 / 8192), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 / 4096,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 212, 5, 40),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 / 16384), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 / 8192,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 195, 5, 212),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 / 32768), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 / 16384,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 212, 208, 5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 / 65536), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 / 32768,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 88, 160),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 / 131072), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 / 65536,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 27, 160, 0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ((screenSize.height) / 2) - (100 / 262144), 0, 0),
                  child: SizedBox(
                    width: screenSize.width,
                    height: 100 / 131072,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 123, 35),
                      ),
                    ),
                  ),
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
                          onPressed: now1, icon: const Icon(Icons.gamepad)),
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
        Container(height: 500, width: 10, color: Colors.black)
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

    //print("now Z value: $_zValue");
    // setState(() {
    //   controller.value = Matrix4.identity();
    // });
  }

  void now1() {
    final animationNow1 = Matrix4Tween(
      begin: controller.value,
      end: matrix2,
    ).animate(controllerNow1);

    animationNow1.addListener(() {
      controller.value = animationNow1.value;
    });

    controllerNow1.reset();
    controllerNow1.fling();

    //print(_currentMatrix);
    //print("now1 Z value: $_zValue");
    // setState(() {
    //   controller.value = Matrix4.identity();
    // });
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
    // setState(() {
    //   controller.value = Matrix4.identity();
    // });
  }
}
