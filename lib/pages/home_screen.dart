import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newtodo/constant.dart';
import 'package:newtodo/controllers/task_controller.dart';
import 'package:newtodo/controllers/textfield_controller.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
                  //ما در حالت اضافه کردن هستیم بنابراین مقدار متغییر تعریف شده را فالس می کنیم
                  Get.find<TaskController>().isEditing = false;

                  //برای پاک کردن محتوای فیلدها بعد از اضافه شدن
                   Get.find<TextFieldController>().tasktitle!.text = '';
                   Get.find<TextFieldController>().tasksubtitle!.text = '';

      Get.toNamed('/addscreen');
      }, 
      backgroundColor: kLightblue,
      elevation: 0,
      child: const Icon(Icons.add),
      ),
      body: const SafeArea(child: 
      Stack(
             alignment: Alignment.bottomCenter ,
                children: [

             TopSectionWidget(),
             BottomSectionWidget(),
             

            ]
       )
        )
      ,
    );
  }
}

class BottomSectionWidget extends StatelessWidget {
  const BottomSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    width: Get.width,
    height: Get.height*0.55,
    decoration: const BoxDecoration(
    color: Color.fromARGB(255, 253, 222, 236),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(25),
       topRight: Radius.circular(25)
    )
           ),
           child: Container(
            margin: const EdgeInsets.only(left: 50, top: 20, right: 10),
             child: Obx((){

              return ListView.separated(itemBuilder: (context, index)
              { 
                return ListTile(
                title: Text(Get.find<TaskController>().tasks[index].tasktitle!) ,
                subtitle: Text(Get.find<TaskController>().tasks[index].tasksubtitle!) ,
                

                onTap: (){
                  //این کد خط به این معنی است که ما اینجا در حالت ویرایش قرار داریم
                   Get.find<TaskController>().isEditing = true;

                  //ایندکس مورد نظر را به دست میاوریم
                   Get.find<TaskController>().index = index ;
                    
                    //برای اینکه در بخش ادیت، محتوا درست نمایش داده شود از این کد خط ها استفاده می کنیم
                   Get.find<TextFieldController>().tasktitle!.text =
                   Get.find<TaskController>().tasks[index].tasktitle!;
                   // و
                   Get.find<TextFieldController>().tasksubtitle!.text =
                   Get.find<TaskController>().tasks[index].tasksubtitle!;

                   Get.toNamed('/addscreen');
                } ,
                onLongPress: () {
                  
                  Get.dialog(
                    AlertDialog(
                      title: Container(
                        margin: const EdgeInsets.only(left: 60),
                         child: const Text('از حذف مطمن هستید؟', )
                         ),

                      actions: [
                        TextButton(onPressed: (){
                            Get.back();
                        },
                      
                         child: const Text('خیر')
                         ),
                         TextButton(onPressed: (){
                          Get.find<TaskController>().tasks.removeAt(index);
                          Get.back();
                         },

                          child: const Text('بله'))
                        
                        
                      ],
                    ));
                },
                trailing: Checkbox(
                  
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)
                  ),
                  activeColor: kLightblue ,
                  value: Get.find<TaskController>().tasks[index].status,
                   onChanged: (value){


                    //برای فعال شدن چک باکس
                     Get.find<TaskController>().tasks[index].status =
                     !Get.find<TaskController>().tasks[index].status!;

                     //برای ذخیره و نمایش تیک ها
                     Get.find<TaskController>().tasks[index] = Get.find<TaskController>().tasks[index];

                   }
                   
                   ),
              );
             },
              separatorBuilder: (context, index) {
               return const Divider(color: Colors.black, height: 0.2);
              },
              itemCount: Get.find<TaskController>().tasks.length,
               );
             }),
             
            
           )
    );
  }
}

class TopSectionWidget extends StatelessWidget {
  const TopSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          width: Get.width,
          color: const Color.fromARGB(255, 26, 247, 236),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
     Container(
       margin: const EdgeInsets.symmetric(horizontal: 10,
       vertical: 10),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
         IconButton(onPressed: (){
          Get.toNamed('/startpage');
         }, icon: const Icon(Icons.arrow_back_ios)
         ),
         IconButton(onPressed: (){
            Get.toNamed('/wellcomepage');
         },
          icon: const Icon(Icons.menu)),
     
       ],
       ),
     ),
     Container(
          width: Get.width,
          color: kLightblue,
       margin: const EdgeInsets.only(left: 40, top:20 ),

     ),
       Container(
         margin: const EdgeInsets.only(left:50, top:20 ),
         child: const Text(
         'All', style: TextStyle(
           color: Colors.white, fontSize: 25,  fontWeight: FontWeight.bold),
           ),
           ),

           Container(
         margin: const EdgeInsets.only(left:45, top:20 ),
         child: Obx((){
          return Text(
         '${Get.find<TaskController>().tasks.length} Tasks ', style: const TextStyle(
           color: Colors.white, fontSize: 17,  fontWeight: FontWeight.bold),
           );
         })
           ),

              ],
               ) ,
              );
  }
}