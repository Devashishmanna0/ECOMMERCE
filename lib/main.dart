import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'consts/consts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDIhQ4HhWcOvmS0af9eqz4aOkdcvJ8l7b0",
          appId: "1:1098553336488:android:1320ea32a3b86f166b189d",
          messagingSenderId: "1098553336488",
          projectId: "ecommerce-72b7f.appspot.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
        fontFamily: regular,
      ),
      //home: const SplashScreen();
    );
  }
}
