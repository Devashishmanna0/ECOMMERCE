// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:emart_app/consts/consts.dart';
// import 'package:emart_app/consts/firebase_const.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';

// class ProfileController extends GetxController {
//   var profileImgPath = ''.obs;
//   var profileImageLink = '';
//   var isloading = false.obs;
//   //textfield
//   var namecontroller = TextEditingController();
//   var passcontroller = TextEditingController();

//   changeImage(context) async {
//     try {
//       final img = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70);
//       if (img == null) return;
//       profileImgPath.value = img.path;
//     } on PlatformException catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }
//   }

//   uploadProfileImage() async {
//     var filename = basename(profileImgPath.value);
//     var destination = 'images/${currentUser!.uid}/$filename';
//     Reference ref = FirebaseStorage.instance.ref().child(destination);
//     await ref.putFile(File(profileImgPath.value));
//     profileImageLink = await ref.getDownloadURL();
//   }

//   updateProfile({name, password, imgUrl}) async {
//     var store = firestore.collection(userCollection).doc(currentUser!.uid);
//     await store.set({'name': name, 'password': password, 'imageUrl': imgUrl}, SetOptions(merge: true));
//     isloading(false);
//   }
// }
