import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx_pattern_site/app/navigation/navi_controller.dart';
import 'package:getx_pattern_site/app/utils/colors.dart';

Widget bottomNavi(NaviController naviController, pageViewController) {
  return Obx(() => BottomNavigationBar(
        selectedItemColor: colorPrimaryPrime,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.share,
            ),
            label: "Test",
          ),
        ],
        currentIndex: naviController.selectedIndex.value,
        onTap: (index) {
          naviController.onBottomNavItemTapped(index);
          pageViewController.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
        },
      ));
}
