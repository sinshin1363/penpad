
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newtodo/constant.dart';
import 'package:newtodo/controllers/textfield_controller.dart';
import 'package:newtodo/models/task_model.dart';
import '../controllers/task_controller.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea( child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //
      Container(
  decoration: const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/top.jpg'), 
      fit: BoxFit.cover
    )
  )
),

            //
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child:  const MyCoustomAppBar(),
          ),
          const TittleWidget(),
          const TaskTextField(),
          const MyFieldSubtitle(),
          const MyButton()
                 

        ]
        )
      ),
    );
  }
}

class MyFieldSubtitle extends StatelessWidget {
  const MyFieldSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 1
      ),
      child: TextFormField(
         controller: Get.find<TextFieldController>().tasksubtitle,
        maxLines: 5,
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87)
            
          ),
          hintText: 'Description',
        

          ),
          
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(width: Get.width,
    height: 40,
    margin: const EdgeInsets.only(left: 15, right: 15),
    child: ElevatedButton(
      onPressed: () {
        
                   if (Get.find<TaskController>().isEditing) {
            
            //این چهار خط کد قرار است تسک مورد نظر را ویرایش کند
            //دو خط اول قرار است  ایندکس مورد نظر را بیابد
            
            // در این کد خط میگیم این ایندکس ماست که قرار ویرایش بشه
            //اون رو میدیم به متغیر تسک تا کار ویرایش رو روش شروع کنیم
            var task = Get.find<TaskController>()
            .tasks[Get.find<TaskController>().index];

            //دقت شود که ایندکسی که اینجا داریم در قسمت آنتپ تولید شده و بعد از آن در تسک کنترلر
            //شده و در نهایت در این صفحه قابل دسترسی شده
            
            task.tasktitle = Get.find<TextFieldController>().tasktitle!.text;
            task.tasksubtitle = Get.find<TextFieldController>().tasksubtitle!.text;
            //در کد بالا به زبان خودمانی می گیم این تسک ها میخواد بشه تسک جدید!!


            //در نهایت بعد از کار ویرلیش ایندک مورد نظر به عنوان تسک جایگزین می کنیم
            //جایگزین شدن تسک ویرایش شده با تسک اصلیه
             Get.find<TaskController>().tasks[Get.find<TaskController>().index] = task;
             Get.back();

          }else{
            //اضافه کردن
            //چند خط کد زیر قرار است کار اضافه کردن را انجام دهد
            Get.find<TaskController>().tasks.add(
              TaskModel(
                tasktitle: Get.find<TextFieldController>().tasktitle!.text,
               tasksubtitle: Get.find<TextFieldController>().tasksubtitle!.text,
                status: false,
            ),
            );

          
          Get.back();
          }
      },
    style: TextButton.styleFrom(
      elevation: 0,
      iconColor: kBlackcolor,
    ), child:  Text(
      Get.find<TaskController>().isEditing ? 'Edit' : 'Add'
      ),
    ),
    );
  }
}

class TaskTextField extends StatelessWidget {
  const TaskTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15,right: 15, top: 25,bottom: 25),
      child: TextFormField(
        controller: Get.find<TextFieldController>().tasktitle,
        maxLines: 1,
        cursorColor: kLightblue,
        cursorHeight: 20,
        
         
        decoration: const InputDecoration(border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87)

          ),
           
            hintText: 'Add Note',
              prefixIcon: Icon(Icons.bookmark_border, color: kBlackcolor, size: 20,
            ),
            

            fillColor: Colors.grey,
            focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 210, 235, 163)),
            
             ),
             

        ),
        
      ),
    );

  }
}

class TittleWidget extends StatelessWidget {
  const TittleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 12),
      child: Text('What are you plannig', style: TextStyle(fontSize: 16, color: Colors.grey[600]
      ),
      
      )
      
      );
  }
}

class MyCoustomAppBar extends StatelessWidget {
  const MyCoustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Expanded(child: Text(
          Get.find<TaskController>().isEditing
          ? 'Edit Task' 
          : 'New Task',
          //
         textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
        IconButton(
          onPressed: (){
            Get.back();
            //ویرایش کردن
        }, 
        icon: const Icon(Icons.close)),
      ]
    );

  }
}