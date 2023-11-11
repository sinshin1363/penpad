        import 'package:flutter/material.dart';
        import 'package:get/get.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

    
     body: Stack(
      alignment: Alignment.center,
       children: [

         Image.asset('assets/images/startnew.png',
              alignment: Alignment.topCenter,
              width: Get.width ,
              height: Get.height,
              
              ),


          Container(
          margin: const EdgeInsets.only(top: 80),
          width: 280,
          height: 70,
          decoration: 
          
          BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black87,

          ),


         ),
           GestureDetector(
            onTap: () {
              Get.toNamed('/homescreen');
              
            },
             child: Container(
              margin: const EdgeInsets.only(top: 80),
                         width: 270,
                         height: 60,
                         decoration: 
                         
                         BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFF46F436),
           
                         ),
              child:   Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      right: 15
                  ), child: const Icon(Icons.login_rounded,size: 40,)
                  ),
                  const Text('Login to PenPad', 
                   style: TextStyle(
                    color: Colors.black54,fontSize: 22, fontWeight: FontWeight.w900,  ) 
                    ,)
                ],
              ) ,

           
           
                        ),
           ),
                           Container(
                  margin: const EdgeInsets.only(bottom: 250, right: 350),
                  child: Tooltip(
                      richMessage:const TextSpan(text: 'با پن پد میتونی کارهاتو لیست کنی و کارهای ناتمومت رو تفکیک کنی ', ),
                      child: IconButton(onPressed: () {
                        ;
                      },
                       icon: const Icon(Icons.tips_and_updates_rounded)),
                        ),
                ),


   
       ],
     ),


      );
    
  }
}