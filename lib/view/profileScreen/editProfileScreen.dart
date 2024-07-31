// import 'dart:io';

// import 'package:emart_app/consts/colors.dart';
// import 'package:emart_app/consts/consts.dart';
// import 'package:emart_app/consts/images.dart';
// import 'package:emart_app/consts/strings.dart';
// import 'package:emart_app/controller/profile_controller.dart';
// import 'package:emart_app/widgets_common/bg_widget.dart';
// import 'package:emart_app/widgets_common/custom_textfield.dart';
// import 'package:emart_app/widgets_common/our_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:velocity_x/velocity_x.dart';

// class EditProfileScreen extends StatelessWidget {
//   final dynamic data;

//   const EditProfileScreen({super.key, this.data});

//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.find<ProfileController>();
//     // controller.namecontroller.text = data['name'];
//     // controller.passcontroller.text = data['password'];
//     return bgWidget(
//         child: Scaffold(
//             appBar: AppBar(),
//             body: Obx(
//               () => Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   //if data image url and controller path is emty
//                   data['imageUrl'] == '' && controller.profileImgPath.isEmpty
//                       ? Image.asset(
//                           imgProfile2,
//                           width: 100,
//                           fit: BoxFit.cover,
//                         ).box.roundedFull.clip(Clip.antiAlias).make()
//                       //if data is not empty but controller path is empty
//                       : data['imageUrl']! == '' && controller.profileImgPath.isEmpty
//                           ? Image.network(
//                               data['imageUrl'],
//                               width: 100,
//                               fit: BoxFit.cover,
//                             ).box.roundedFull.clip(Clip.antiAlias).make()
//                           //if bot are empty
//                           : Image.file(
//                               File(controller.profileImgPath.value),
//                               width: 100,
//                               fit: BoxFit.cover,
//                             ).box.roundedFull.clip(Clip.antiAlias).make(),
//                   10.heightBox,
//                   ourButton(
//                       color: blueColor,
//                       onPress: () {
//                         controller.changeImage(context);
//                       },
//                       textColor: whiteColor,
//                       title: "Change"),
//                   const Divider(),
//                   20.heightBox,
//                   customTextfield(controller: controller.namecontroller, hint: nameHint, title: name, issPass: false),
//                   customTextfield(controller: controller.passcontroller, hint: passwordHint, title: password, issPass: true),
//                   20.heightBox,
//                   controller.isloading.value
//                       ? const CircularProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation(blueColor),
//                         )
//                       : SizedBox(
//                           width: context.screenWidth - 60,
//                           child: ourButton(
//                               color: blueColor,
//                               onPress: () async {
//                                 controller.isloading(true);
//                                 await controller.uploadProfileImage();
//                                 await controller.updateProfile(
//                                   imgUrl: controller.profileImageLink,
//                                   name: controller.namecontroller.text,
//                                   password: controller.passcontroller.text,
//                                 );
//                                 VxToast.show(context, msg: "Updated");
//                               },
//                               textColor: whiteColor,
//                               title: "Save")),
//                 ],
//               )
//                   .box
//                   .white
//                   .shadowSm
//                   .padding(const EdgeInsets.all(16))
//                   .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
//                   .rounded
//                   .make(),
//             )));
//   }
// }
