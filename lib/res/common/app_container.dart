import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  final String? nameText;
  final String? image;
  final bool? isSelected;
  final Color? color;
  final Color? textColor;
  const CommonContainer({
    Key? key,
    this.nameText,
    this.image,
    this.isSelected = true,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
              color: color!,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(image!),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Text(
          nameText!,
          style: TextStyle(
            color: textColor!,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            fontFamily: "Inter",
          ),
        ),
      ],
    );
  }
}
