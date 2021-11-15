import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controller.dart';
import 'package:flutter_web_dashboard/constants/styles.dart';
import 'package:flutter_web_dashboard/helpers/responsiveness.dart';
import 'package:flutter_web_dashboard/routing/route.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:flutter_web_dashboard/widgets/side_menu_items.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: kLight,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: _width / 48,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    const Flexible(
                      child: CustomText(
                        text: "Dash",
                        size: 20,
                        weight: FontWeight.bold,
                        color: kActive,
                      ),
                    ),
                    SizedBox(
                      width: _width / 48,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          Divider(
            color: kLightGrey.withOpacity(0.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map(
                  (itemName) => SideMenuItem(
                    itemName: itemName == authenticationPageRoute
                        ? 'Log Out'
                        : itemName,
                    onTap: () {
                      if (itemName == authenticationPageRoute) {
                        //TODO:: go to authentication page
                      }
                      if (!menuController.isActive(itemName)) {
                        menuController.changeActiveItemTo(itemName);
                        if (ResponsiveWidget.isSmallScreen(context)) {
                          Get.back();
                        }
                        navigationController.navigateTo(itemName);
                      }
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
