import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_site/app/modules/apresentacao/apresentacao_page.dart';
import 'package:getx_pattern_site/app/modules/estrutura/estrutura_page.dart';
import 'package:getx_pattern_site/app/modules/home/home_controller.dart';
import 'package:getx_pattern_site/app/modules/home/widgets/custom_drawer_button_widget.dart';
import 'package:getx_pattern_site/app/modules/home/widgets/custom_drawer_widget.dart';
import 'package:getx_pattern_site/app/widgets/custom_button_language_widget.dart';

class HomePage extends GetView {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final HomeController controller = Get.put(HomeController());

  final List<Widget> screens = [
    ApresentacaoPage(),
    EstruturaPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: Stack(
        children: <Widget>[
          SafeArea(
              child: Obx(
            () => Container(
                color: Colors.red,
                padding: EdgeInsets.all(0),
                child: this.screens[controller.screen]),
          )),
          Positioned(
            top: 8,
            left: 5,
            child: SafeArea(
              child: CustomDrawerButtonWidget(
                  callback: () => _scaffoldKey.currentState.openDrawer()),
            ),
          ),
          Positioned(
            top: 8,
            right: 5,
            child: SafeArea(child: CustomSelectLanguageWidget()),
          ),
        ],
      ),
    );
  }
}
