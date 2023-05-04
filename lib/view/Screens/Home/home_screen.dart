import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/view/Screens/Home/product_detail_screen.dart';

import '../../../data/app_data.dart';
import '../../../models/app_model/furniture_model.dart';
import '../../../res/common/app_container.dart';
import '../../../res/common/app_second_container.dart';
import '../../../res/constant/app_strings.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  User? userData;
  int checkBoxData = 0;

  @override
  void initState() {
    userData = userFromMap(jsonEncode(furnitureListData));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    image: AssetImage(AppImages.search),
                    height: 25,
                    width: 25,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: AppStrings.makeHome,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppStrings.inter,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF909090),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: AppStrings.beautiful,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: AppStrings.inter,
                            fontWeight: FontWeight.w700,
                            color: Color(0x80000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Image(
                    image: AssetImage(AppImages.cart),
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      checkBoxData = index;
                      setState(() {});
                    },
                    child: CommonContainer(
                      image: userData!.firstModel![index].image,
                      nameText: userData!.firstModel![index].name,
                      color: checkBoxData == index
                          ? Colors.black
                          : const Color(0xFFF5F5F5),
                      textColor: checkBoxData == index
                          ? Colors.black
                          : const Color(0xFF909090),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  itemCount: 6,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.80,
                      width: MediaQuery.of(context).size.width * 1.5,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ProductDetailScreen(),
                              ));
                        },
                        child: GridView.builder(
                          itemCount: 4,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return AppSecondContainer(
                              image: userData!.secondModel![index].image,
                              nameText: userData!.secondModel![index].nameText,
                              price: userData!.secondModel![index].price,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
