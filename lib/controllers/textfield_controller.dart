import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController {
TextEditingController? tasktitle;
TextEditingController? tasksubtitle;
@override

//این قسمت پایین برای مقدار دهی اولیه متغییرها لازم است
  void onInit() {
    tasktitle = TextEditingController();
    tasksubtitle = TextEditingController();
    super.onInit();
  }

}