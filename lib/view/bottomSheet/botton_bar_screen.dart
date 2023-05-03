import 'package:flutter/material.dart';

import '../Screens/Favorites/favorites_screen.dart';
import '../Screens/Home/home_screen.dart';
import '../Screens/Notification/notification_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentIndex = 0;

  List<Widget> screenList = [];

  List imageList = [
    {
      "id": 0,
      "image": "assets/images/homeTwo.png",
      "select_image": "assets/images/home.png",
    },
    {
      "id": 1,
      "image": "assets/images/favorites.png",
      "select_image": "assets/images/favoritesTwo.png",
    },
    {
      "id": 2,
      "image": "assets/images/notification.png",
      "select_image": "assets/images/notificationTwo.png",
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    screenList = [
      const HomePageScreen(),
      const FavoritesScreen(),
      const NotificationScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[currentIndex],
      bottomSheet: Container(
          height: 75,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: imageList
                  .map(
                    (value) => GestureDetector(
                      onTap: () {
                        currentIndex = value['id'];
                        setState(() {});
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(
                              currentIndex == value['id']
                                  ? value['select_image']
                                  : value['image'],
                            ),
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList())),
    );
  }
}
