import 'package:get/get.dart';
import 'package:newtodo/pages/add_task_screen.dart';
import 'package:newtodo/pages/home_screen.dart';
import 'package:newtodo/pages/start_page.dart';
import 'package:newtodo/pages/wellcome_page.dart';


//صفحات را اینجا تعریف می کنیم
class Routes { 
  static List<GetPage> get pages => [
    GetPage(name: '/homescreen', page: () => const HomeScreen(),
    ),
     GetPage(name: '/addscreen' , page: () => const AddTaskScreen(),
    ),
    GetPage(name: '/wellcomepage', page: () =>  const WellcomePage(),
     ),
    GetPage(name: '/startpage', page: () => const StartPage(),
    )
  ];
}