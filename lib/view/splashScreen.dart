import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/view/auth_screen/login_screen.dart';
import 'package:emart_app/widgets_common/applogo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //creating a method to change screen

  changeScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        //using getx
        Get.to(() => const LoginScreen());
        // auth.authStateChanges().listen((User? user) {
        //   if (user == null && mounted) {
        //     Get.to(() => const LoginScreen());
        //   } else {
        //     Get.to(() => const Home());
        //   }
        //});
      },
    );
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blueColor,
        body: Center(
          child: Column(
            children: [
              Align(alignment: Alignment.topLeft, child: Image.asset(icSplashBg, width: 300)),
              20.heightBox,
              applogoWidget(),
              10.heightBox,
              appname.text.fontFamily(bold).size(22).white.make(),
              5.heightBox,
              appversion.text.white.make(),
              Spacer(),
              credits.text.white.fontFamily(semibold).make(),
              30.heightBox,
            ],
          ),
        ));
  }
}
