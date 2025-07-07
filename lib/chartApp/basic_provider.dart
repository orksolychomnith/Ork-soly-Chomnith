import 'package:flutter/material.dart';
import 'package:flutter_application_1/chart_module/font_logic.dart';
import 'package:provider/provider.dart';

import 'basic_app.dart';
import 'theme_logic.dart';

Widget ChartProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider( create: (context) => ThemeLogic()),
      ChangeNotifierProvider(create: (context) => FontLogic())
    ],
    child: CartApp(),
  );
}
