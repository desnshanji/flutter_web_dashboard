import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controller.dart';
import 'package:flutter_web_dashboard/routing/route.dart';
import 'package:flutter_web_dashboard/routing/router.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigationKey,
      initialRoute: overViewPageRoute,
      onGenerateRoute: generateRoute,
    );
