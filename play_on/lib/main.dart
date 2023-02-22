import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:play_on/Screen/registration/welcom.dart';
import 'package:play_on/constant/colors.constant.dart';
import 'package:play_on/controller/mathes.controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(() => Matches());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PlayOn',
      home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              statusBarColor: secondryColor,
              systemNavigationBarDividerColor: secondryColor,
              systemNavigationBarColor: secondryColor),
          child: const WelcomePage()),
      debugShowCheckedModeBanner: false,
    );
  }
}
