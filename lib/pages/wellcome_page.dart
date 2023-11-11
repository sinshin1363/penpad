        import 'package:flutter/material.dart';
        import 'package:get/get.dart';
        import 'package:newtodo/controllers/task_controller.dart';


        
        
class WellcomePage extends StatelessWidget {
  const WellcomePage({super.key});

  @override
  Widget build(BuildContext context)
   {
    int count = Get.find<TaskController>().getSelectedTasksCount();          

    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            margin: const EdgeInsets.only(left: 200),
            child: const Text('State', style: TextStyle(color: Colors.black54, fontSize: 25),
             textAlign: TextAlign.justify,
             ),
          )
        
        ),
        body: Container(
          
          margin: const EdgeInsets.all(40) 
          ,
          alignment: Alignment.center,
          child:  Column(
            children: [
             Row(
              children: [
             GestureDetector(
              onTap: () {
              Get.dialog(
                AlertDialog(
                  title: Container(margin: const EdgeInsets.only(bottom: 30,right: 30,top: 1, left: 30),
                  color: const Color.fromARGB(115, 240, 236, 31),
                  child: const Text('subjects', style: TextStyle(fontSize: 18 ),
                  textAlign: TextAlign.center
                  ),
                  ),
                actions: [
                  
                  ElevatedButton(
                    
                     onPressed: (){
                    Get.back();
                  },
                   child: const Text('Exit'),
                    
                   ),
                   
                ],
                )
              );
                
              },
               child: Container(
               
                height: 200,
                width: 420,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(10),
                   color: const Color.fromARGB(255, 162, 146, 233)
                   
                   ),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: [
                    Container(
                      margin: const EdgeInsets.only(top: 25, left: 15, bottom: 15),
                      child:  Text('End Tasks $count'
                      , maxLines: 5
                      ,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
                      textAlign: TextAlign.center
                      )
                    ),

                    
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(Icons.accessibility_new,
                      size: 35,
                      ),
                    )

                    
                  ]),
               ),
             )  
         
              ],
             )
            ],
    
            )
          ),
          ),
    );
  
  }
}