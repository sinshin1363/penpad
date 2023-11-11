class TaskModel {
  String? tasktitle;
  String? tasksubtitle;
  bool? status;

 TaskModel({
  required this.tasktitle, 
  required this.tasksubtitle,
  required this.status,
  });

//استفاده از گیت استورج

//کلاس مدل را به فایل جیسون تبدیل می کنیم

  Map<String , dynamic> toJson() {

    return {
      'tasktitle' : tasktitle,
      'tasksubtitle' : tasksubtitle,
      'status' : status

    };
  }

  //حالا باید جیسون را بدهیم و مدل را به ما بدهد
  TaskModel.fromJson( Map<String , dynamic> json) :
   tasktitle    = json['tasktitle'],
   tasksubtitle = json['tasksubtitle'],
   status       = json['status'];
}