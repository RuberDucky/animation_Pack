import 'package:flutter/material.dart';

class LoopPath extends StatefulWidget {
  const LoopPath({super.key});

  @override
  State<LoopPath> createState() => _LoopPathState();
}

class _LoopPathState extends State<LoopPath> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: ClipPath(
          clipper: ZigzagClip(
            width: 30,
          ),
          child: Container(
            height: 400,
            width: 300,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ZigzagClip extends CustomClipper<Path> {
  final int width;
  ZigzagClip({this.width = 20});
  @override
  Path getClip(Size size) {
    var path = Path();
    const double offset = 40.0;

    path.moveTo(0, offset);
    path.lineTo(0, size.height);
    double x = 0.0;

    for (int i = 0; i <= size.width / width; i++) {
      x += width;
      path.quadraticBezierTo(x, size.height - width, x, size.height);
    }
    path.lineTo(size.width, offset);
    path.quadraticBezierTo(size.width, 0, size.width - offset, 0);
    path.lineTo(offset, 0);
    path.quadraticBezierTo(0, 0, 0, offset);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
