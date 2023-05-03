import 'package:flutter/material.dart';

import '../../../res/common/app_button.dart';
import '../../../res/constant/app_strings.dart';

class CheckOutSuccessScreen extends StatefulWidget {
  const CheckOutSuccessScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutSuccessScreen> createState() => _CheckOutSuccessScreenState();
}

class _CheckOutSuccessScreenState extends State<CheckOutSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              const Text(
                "SUCCESS!",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: Color(0xFF242424)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Image.asset(AppImages.success, height: 255, width: 269),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const Text(
                "Your order will be delivered soon.\nThank you for choosing our app!",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xFF909090)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              AppButton(
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width / 1,
                fontFamily: "Poppins",
                fontSize: 16,
                title: "Track your orders",
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              AppButton(
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width / 1,
                fontFamily: "Poppins",
                fontSize: 16,
                title: "Back to home",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
