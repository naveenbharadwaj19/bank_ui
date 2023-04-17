import 'package:flutter/material.dart';

class _NotchClipper extends CustomClipper<Path> {
  final double notchWidth;
  final double notchHeight;
  final double bumpSize;
  final double notchFlatness;

  _NotchClipper({
    required this.notchWidth,
    required this.notchHeight,
    required this.bumpSize,
    // ignore: unused_element
    this.notchFlatness = 30,
  });

  @override
  Path getClip(Size size) {
    final path = Path();

    double notchX = size.width / 2 - notchWidth / 2;
    double notchY = notchHeight;

    double bumpX = size.width / 2;
    double bumpY = notchHeight - bumpSize;

    path.moveTo(0, bumpY);
    path.quadraticBezierTo(bumpX, 0, size.width, bumpY);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, bumpY);

    path.lineTo(notchX, bumpY);
    path.lineTo(notchX + notchWidth / 2 - notchFlatness, notchY);
    path.lineTo(notchX + notchWidth / 2 + notchFlatness, notchY);
    path.lineTo(notchX + notchWidth, bumpY);
    path.lineTo(size.width, bumpY);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class NotchContainer extends StatelessWidget {
  final EdgeInsets margin;
  final double height;
  final double width;
  final double notchHeight;
  final double notchWidth;
  final double bumpSize;
  final Color color;
  final double radius;
  final Widget child;

  NotchContainer({
    required this.margin,
    required this.height,
    required this.width,
    this.notchHeight = 15,
    this.notchWidth = 100,
    this.bumpSize = 18,
    this.color = Colors.white,
    this.radius = 20,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ClipPath(
        clipper: _NotchClipper(
          notchWidth: notchWidth,
          notchHeight: notchHeight,
          bumpSize: bumpSize,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            color: color,
          ),
          child: child,
        ),
      ),
    );
  }
}
