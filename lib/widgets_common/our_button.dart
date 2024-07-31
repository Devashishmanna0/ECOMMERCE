import 'package:emart_app/consts/consts.dart';
import 'package:velocity_x/velocity_x.dart';

Widget ourButton({
  onPress,
  color,
  textColor,
  String? title,
  OutlinedBorder? shape,
}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.all(12),
        shape: shape,
      ),
      onPressed: onPress,
      child: title!.text.color(textColor).fontFamily(bold).make());
}
