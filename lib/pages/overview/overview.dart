import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controller.dart';
import 'package:flutter_web_dashboard/helpers/responsiveness.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/available_drivers.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/overview_cards_large.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/overview_cards_medium.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/overview_cards_small.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:flutter_web_dashboard/widgets/revenue_section_large.dart';
import 'package:flutter_web_dashboard/widgets/revenue_section_small.dart';
import 'package:get/get.dart';

class OverViewPage extends StatelessWidget {
  const OverViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6,
                ),
                child: CustomText(
                  text: menuController.activeItem.value,
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const OverViewCardsSmallScreen()
                : ResponsiveWidget.isCustomScreen(context)
                    ? const OverViewCardsMediumScreen()
                    : const OverViewCardsLargeScreen(),
            ResponsiveWidget.isSmallScreen(context)
                ? const RevenueSectionSmall()
                : const RevenueSectionLarge(),
            const AvailableDrivers(),
          ],
        ))
      ],
    );
  }
}
