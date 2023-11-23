import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:youtube_clone/Components/Theme/color_files.dart';
import 'package:youtube_clone/Screens/routes_method.dart';

import '../json/json_file.dart';
import 'home_screen_widget.dart';

class YoutubeMainPage extends StatefulWidget {
  const YoutubeMainPage({super.key});

  @override
  State<YoutubeMainPage> createState() => _YoutubeMainPageState();
}

class _YoutubeMainPageState extends State<YoutubeMainPage> {
  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.sizeOf(context).height;
    var widthMediaQuery = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: allScreenColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        children: [
          // ** First youtube tag and Profile Picture.
          const YoutubeTagAndIconWorking(),
          //  ** Youtube Title For (Recommended) .
          youtubeTitleText("Recommended"),

          // ** (Recommended Videos) for this ListView.
          // Todo: Don't Using Colum (Children List[]) and [] List Place of (List.generate).
          Column(
            children: List.generate(home_video.length, (int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.secondYoutubePage,
                  arguments: ModelClass(
                    thumbnail: home_video[index]["thumbnail_img"],
                    title: home_video[index]["title"],
                    viewCount: home_video[index]["view_count"],
                    dayAgo: home_video[index]["day_ago"],
                    username: home_video[index]["username"],
                    profile: home_video[index]["profile_img"],
                    subscriberCount: home_video[index]["subscriber_count"],
                    likeCount: home_video[index]["like_count"],
                    unlikeCount: home_video[index]["unlike_count"],
                    videoUrl: home_video[index]["video_url"],
                  ));
                },
                child: Column(
                  children: [
                    Container(
                      height: heightMediaQuery*0.3,
                      width: widthMediaQuery*0.95,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.white,),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(home_video[index]["thumbnail_img"],fit: BoxFit.cover,)),
                    ),
              
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(home_video[index]["profile_img"],height: 30,width: 30,)),
                        title: Text(home_video[index]["title"],style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 14)),
                        subtitle: Text(home_video[index]["username"] + home_video[index]["day_ago"] + home_video[index]["view_count"],
                        style: TextStyle(color: Colors.white.withOpacity(0.4),fontSize: 10)),
                        trailing: Icon(LineIcons.award,size: 30,color: Colors.white.withOpacity(0.4)),
                    ),
                    ],
                ),
              );
            })
          ),
        ],
      ),
    );
  }
}




class ModelClass {
  String? thumbnail;
  String? title;
  String? viewCount;
  String? dayAgo;
  String? username;
  String? profile;
  String? subscriberCount;
  String? likeCount;
  String? unlikeCount;
  String? videoUrl;

  ModelClass({
    this.thumbnail,
    this.title,
    this.viewCount,
    this.dayAgo,
    this.username,
    this.profile,
    this.subscriberCount,
    this.likeCount,
    this.unlikeCount,
    this.videoUrl});
}