import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? title;
  final double? height;
  final double? width;
  final double? fontSize;
  final String? fontFamily;

  const AppButton({
    Key? key,
    this.title,
    this.height,
    this.width,
    this.fontSize,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFF242424),
      ),
      child: Center(
        child: Text(
          title!,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize!,
            fontWeight: FontWeight.w400,
            fontFamily: fontFamily,
          ),
        ),
      ),
    );
  }
}
