import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newtodo/bindings/bindings.dart';
import 'package:newtodo/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_storage/get_storage.dart';




void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      getPages: Routes.pages,
      initialBinding: MyBindings(),
      initialRoute: '/startpage',
    );
  }
}