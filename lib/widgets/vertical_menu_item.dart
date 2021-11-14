import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controller.dart';
import 'package:flutter_web_dashboard/constants/styles.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
  const VerticalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("not hovering");
      },
      child: Obx(
        () => Container(
          color: menuController.isHovering(itemName)
              ? kLightGrey.withOpacity(0.1)
              : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: menuController.isHovering(itemName) ||
                    menuController.isActive(itemName),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  width: 3,
                  height: 72,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: menuController.returnIconFor(itemName),
                    ),
                    if (!menuController.isActive(itemName))
                      Flexible(
                          child: CustomText(
                        text: itemName,
                        color: menuController.isHovering(itemName)
                            ? Colors.white
                            : kLightGrey,
                      ))
                    else
                      Flexible(
                          child: CustomText(
                        text: itemName,
                        color: Colors.white,
                        size: 18,
                        weight: FontWeight.bold,
                      ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
