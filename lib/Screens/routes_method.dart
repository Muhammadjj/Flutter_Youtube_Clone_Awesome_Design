import 'package:flutter/material.dart';
import 'package:youtube_clone/Screens/youtube_detail_page/detail_page_main.dart';

import 'youtube_home_screen/home_screen_main.dart';


class RoutesName {
  static const String firstYoutubePage = "firstHomePage";
  static const String secondYoutubePage = "secondDetailPage";
}



class RoutesMethod {
  static Route<dynamic>? onGenerate(RouteSettings settings){
    if (settings.name == RoutesName.firstYoutubePage) {
      return MaterialPageRoute(builder: (context) => const YoutubeMainPage(),);
    }else if(settings.name == RoutesName.secondYoutubePage){
      return MaterialPageRoute(builder: (context) =>  YoutubeDetailPage(modelClass: settings.arguments as ModelClass),);
    }else{
      return MaterialPageRoute(builder: (context) => const Scaffold(
          body: Center(child: Text("Don't Found Pages"),),
      ),);
    }

  }
}