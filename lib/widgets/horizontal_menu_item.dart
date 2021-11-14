import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controller.dart';
import 'package:flutter_web_dashboard/constants/styles.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
  const HorizontalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover('not hovering');
      },
      child: Obx(
        () => Container(
          color: menuController.isHovering(itemName)
              ? kLightGrey.withOpacity(.1)
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
                  width: 6,
                  height: 40,
                  color: kDark,
                ),
              ),
              SizedBox(width: _width / 80),
              Padding(
                padding: const EdgeInsets.all(16),
                child: menuController.returnIconFor(itemName),
              ),
              if (!menuController.isActive(itemName))
                Flexible(
                    child: CustomText(
                  text: itemName,
                  color:
                      menuController.isHovering(itemName) ? kDark : kLightGrey,
                ))
              else
                Flexible(
                    child: CustomText(
                  text: itemName,
                  color: kDark,
                  size: 18,
                  weight: FontWeight.bold,
                ))
            ],
          ),
        ),
      ),
    );
  }
}
