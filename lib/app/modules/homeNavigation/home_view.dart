import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_site/app/modules/homeNavigation/home_controller.dart';
import 'package:getx_pattern_site/app/modules/homeNavigation/home_widget.dart';
import 'package:getx_pattern_site/app/modules/homeNavigation/test_widget.dart';
import 'package:getx_pattern_site/app/navigation/bottom_navi.dart';
import 'package:getx_pattern_site/app/navigation/navi_controller.dart';
import 'package:getx_pattern_site/app/utils/colors.dart';
import 'package:getx_pattern_site/app/utils/images.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _pageViewController = PageController();
  final HomeController homeController = Get.put(HomeController());
  final NaviController naviController = Get.put(NaviController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      appBar: AppBar(
        title: Image(
          image: new ExactAssetImage(t2_profile),
          height: AppBar().preferredSize.height,
          width: MediaQuery.of(context).size.width,
          alignment: FractionalOffset.center,
        ),
        elevation: 0,
        backgroundColor: colorPrimaryPrime,
      ),
      body: PageView(
        controller: _pageViewController,
        children: <Widget>[
          homeWidget(),
          testWidget(),
        ],
        onPageChanged: (index) {
          setState(() {
            naviController.onBottomNavItemTapped(index);
          });
        },
      ),
      bottomNavigationBar: bottomNavi(naviController, _pageViewController),
    );
  }
}
