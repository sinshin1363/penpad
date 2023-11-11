import 'package:get/get.dart'; 
import 'package:get_storage/get_storage.dart';
import 'package:newtodo/models/task_model.dart';

class TaskController extends GetxController {

  var isEditing = false;
  var index = 0;
  var tasks = <TaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    loadTasks();

  }

  void loadTasks() {
    var box = GetStorage();

    if(box.read('tasks') != null) {
      var list = box.read('tasks');

      for(var item in list) {
        tasks.add(TaskModel.fromJson(item));  
      }
    }

    ever(tasks, (value) {
      box.write('tasks', tasks.toJson());
    });

  }

  int getSelectedTasksCount() {
    var count = 0;
    for (var task in tasks) {
      if(task.status!) count++;   
    }
    return count;
  }

}