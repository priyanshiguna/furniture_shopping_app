import 'package:flutter/material.dart';

import '../../../res/common/app_button.dart';
import '../../../res/constant/app_strings.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Stack(
                children: [
                  const Image(
                    image: AssetImage(AppImages.media),
                    height: 455,
                    width: 323,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.13,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.white),
                        child: const Icon(Icons.arrow_back_ios_new, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.productName,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF242424),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        AppStrings.productPrice,
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF242424),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color(0xFFE0E0E0)),
                        child: const Icon(Icons.add, size: 20),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      const Text(
                        AppStrings.productCount,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF242424),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color(0xFFE0E0E0)),
                        child: const Icon(Icons.remove, size: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Image(
                        image: AssetImage(AppImages.rate),
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      const Text(
                        AppStrings.productRate,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF242424),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      const Text(
                        AppStrings.productReviews,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF909090),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const Text(
                    AppStrings.productDescription,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF909090),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.18,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color(0xFFE0E0E0)),
                        child:
                            const Image(image: AssetImage(AppImages.favorites)),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      AppButton(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.6,
                        title: AppStrings.addToCart,
                        fontSize: 16,
                        fontFamily: AppStrings.poppins,
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
