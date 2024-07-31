import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/firebase_const.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:emart_app/view/homeScreen/home.dart';
import 'package:emart_app/widgets_common/applogo_widget.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      // if overflow happens use singlechild scroll view
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Join the $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
            Obx(
              () => Column(
                children: [
                  customTextfield(hint: nameHint, title: name, controller: nameController, issPass: false),
                  customTextfield(hint: emailHint, title: email, controller: emailController, issPass: false),
                  customTextfield(hint: passwordHint, title: password, controller: passwordController, issPass: true),
                  customTextfield(hint: passwordHint, title: retypePassword, controller: passwordRetypeController, issPass: true),
                  //Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: forgetPassword.text.make())),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: blueColor,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                        },
                      ),
                      10.widthBox,
                      Expanded(
                          child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "I agree to the ",
                              style: TextStyle(
                                fontFamily: bold,
                                color: fontGrey,
                              ),
                            ),
                            TextSpan(
                              text: termAndCond,
                              style: TextStyle(
                                fontFamily: bold,
                                color: blueColor,
                              ),
                            ),
                            TextSpan(
                              text: " & ",
                              style: TextStyle(
                                fontFamily: bold,
                                color: fontGrey,
                              ),
                            ),
                            TextSpan(
                                text: privacyPolicy,
                                style: TextStyle(
                                  fontFamily: bold,
                                  color: blueColor,
                                ))
                          ],
                        ),
                      ))
                    ],
                  ),
                  5.heightBox,
                  controller.isloading.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(blueColor),
                        )
                      : ourButton(
                          color: isCheck == true ? blueColor : lightGrey,
                          title: signup,
                          textColor: whiteColor,
                          onPress: () async {
                            if (isCheck != false) {
                              controller.isloading(true);
                              try {
                                await controller
                                    .singupMethod(
                                        context: context, email: emailController.text, password: passwordController.text)
                                    .then((value) {
                                  return controller.storeUserData(
                                      email: emailController.text, password: passwordController.text, name: nameController.text);
                                }).then((value) {
                                  Get.offAll(() => const Home());
                                  VxToast.show(context, msg: loggedIn);
                                });
                              } catch (e) {
                                auth.signOut();
                                VxToast.show(context, msg: e.toString());
                                controller.isloading(false);
                              }
                            }
                          },
                        ).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  //wrapping into gesture detector of velocity x
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      alreadyHaveAccount.text.color(fontGrey).make(),
                      login.text.color(blueColor).make().onTap(() {
                        Get.back();
                      })
                    ],
                  )
                ],
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),
            )
          ],
        ),
      ),
    ));
  }
}
