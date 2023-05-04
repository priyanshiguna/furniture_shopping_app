import 'package:flutter/material.dart';

import '../constant/app_strings.dart';

class AppSecondContainer extends StatelessWidget {
  final String? image;
  final String? nameText;
  final String? price;
  const AppSecondContainer({
    Key? key,
    this.image,
    this.nameText,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image(
              image: AssetImage(image!),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 165, left: 115),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.09,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xFFC4C1C1)),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Image(
                    image: AssetImage(AppImages.begIcon),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Text(
          nameText!,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            color: Color(0xFF909090),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Text(
          price!,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            color: Color(0xFF303030),
          ),
        ),
      ],
    );
  }
}
