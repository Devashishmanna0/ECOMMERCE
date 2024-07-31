import 'package:emart_app/consts/consts.dart';

Widget customTextfield({String? title, String? hint, controller, issPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(blueColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: issPass,
        controller: controller,
        decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontFamily: semibold,
              color: textfieldGrey,
            ),
            hintText: hint,
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: blueColor),
            )),
      ),
      5.heightBox,
    ],
  );
}
