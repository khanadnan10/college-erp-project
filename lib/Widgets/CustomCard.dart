import 'package:flutter/material.dart';

class CustomeCard extends StatelessWidget {
  const CustomeCard({
    Key? key,
    required this.height,
    required this.width,
    required this.image,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final double height;
  final double width;
  final Text text;
  final Image image;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(12.0),
          height: height / 2,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              image,
              text,
            ],
          ),
        ),
      ),
    );
  }
}
