import 'package:get/get.dart';
import 'package:newtodo/controllers/task_controller.dart';
import 'package:newtodo/controllers/textfield_controller.dart';


class MyBindings extends Bindings {
  @override
  void dependencies() {
    //در کم مصرفها
    Get.lazyPut(() => TaskController()
    );
    //در پرمصرفها
    Get.put(TextFieldController()
    );
  }

}