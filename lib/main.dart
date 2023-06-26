import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ComplexUi(),
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}

class ComplexUi extends StatefulWidget {
  const ComplexUi({Key? key}) : super(key: key);

  @override
  State<ComplexUi> createState() => _ComplexUiState();
}

class _ComplexUiState extends State<ComplexUi>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  final double maxSlide = 225.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }

  void Toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var myDrawer = Container(
      color: Colors.blue,
    );
    var myChild = Container(
      color: Colors.lightBlueAccent,
    );
    return GestureDetector(
      // onHorizontalDragStart: _onDragStart,
      // onHorizontalDragUpdate: _onDragUpdate,
      // onHorizontalDragEnd: _onDragEnd,
      onTap: Toggle,
      child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            double slide = maxSlide * animationController.value;
            double scale = 1 - (animationController.value * 0.3);
            return Stack(
              children: [
                myDrawer,
                Transform(
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  alignment: Alignment.centerLeft,
                  child: myChild,
                ),
              ],
            );
          }),
    );
  }

  // void _onDragStart(DragStartDetails details) {
  //
  //   bool isDragOpenFromLeft = animationController.isDismissed&&
  //       details.globalPosition.dx < minDragStartEdge;
  //
  //   bool isDragOpenFromRight
  //
  //
  // }
  //
  // void _onDragUpdate(DragUpdateDetails details) {
  // }
  //
  // void _onDragEnd(DragEndDetails details) {
  // }
}
