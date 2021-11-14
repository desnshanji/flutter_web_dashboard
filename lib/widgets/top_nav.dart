import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/styles.dart';
import 'package:flutter_web_dashboard/helpers/responsiveness.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState>? key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  child: Image.asset(
                    "assets/icons/logo.png",
                    width: 28,
                  ),
                ),
              ],
            )
          : IconButton(
              onPressed: () {
                key!.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
              ),
            ),
      elevation: 0,
      title: Row(
        children: [
          const Visibility(
            child: CustomText(
              weight: FontWeight.bold,
              color: kLightGrey,
              size: 20,
              text: 'Dash',
            ),
          ),
          Expanded(
            child: Container(),
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: kDark.withOpacity(0.7),
            ),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: kDark.withOpacity(0.7),
                ),
              ),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: kActive,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: kLight, width: 2)),
                ),
              ),
            ],
          ),
          Container(
            width: 1,
            height: 22,
            color: kLightGrey,
          ),
          const SizedBox(
            width: 24,
          ),
          const CustomText(text: 'Desmond Nshanji', color: kLightGrey),
          const SizedBox(
            width: 16,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2),
              child: const CircleAvatar(
                backgroundColor: kLight,
                child: Icon(
                  Icons.person_outline,
                  color: kDark,
                ),
              ),
            ),
          ),
        ],
      ),
      iconTheme: const IconThemeData(color: kDark),
      backgroundColor: kLight,
    );
