import 'package:flutter/material.dart';
import 'package:youtube_clone/Components/Theme/color_files.dart';
import 'package:youtube_clone/Screens/json/json_file.dart';
import 'package:youtube_clone/Screens/youtube_home_screen/home_screen_main.dart';

import '../youtube_home_screen/home_screen_widget.dart';
import 'detail_page_widget.dart';

class YoutubeDetailPage extends StatefulWidget {
  const YoutubeDetailPage({super.key, required this.modelClass});
  final ModelClass modelClass;
  @override
  State<YoutubeDetailPage> createState() => _YoutubeDetailPageState();
}

class _YoutubeDetailPageState extends State<YoutubeDetailPage> {
  @override
  Widget build(BuildContext context) {
    // var heightMediaQuery = MediaQuery.sizeOf(context).height;
    // var widthMediaQuery = MediaQuery.sizeOf(context).width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: allScreenColor,
      appBar: AppBar(leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back,color: Colors.white,)),
      backgroundColor: Colors.transparent,
      elevation: 0),
        body: Column(
         children: [
        // ** Video Player Widget .
        VideoPlayerContainerDetailPage(
          profile: widget.modelClass.thumbnail.toString(),
        ),

        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            children: [
              //  ** Count This Like And Unlike OR Count The Subscribe And UserName .
          TitleLikeSubscribeDetailPage(
            videoTitle: widget.modelClass.title.toString(),
            viewAndDate: Text(widget.modelClass.viewCount.toString() + widget.modelClass.dayAgo.toString()),
            like: widget.modelClass.likeCount.toString(),
            unlike:widget.modelClass.unlikeCount.toString(),
            proFileImage: widget.modelClass.profile.toString(),
            subscribe: widget.modelClass.subscriberCount.toString(),
            username: widget.modelClass.username.toString(),),
            
            // ** Songs List Text (Up Next) .
            youtubeTitleText("Up Next"),

            // ** Song List
            Column(
              children: List.generate(home_video_detail.length, (int index) {
                return SongList(profileImage: home_video_detail[index]["thumbnail_img"],
            title: home_video_detail[index]["title"],
            username: home_video_detail[index]["username"],
            viewCount:home_video_detail[index]["view_count"],);
              }),
            )
            ],
          ),
        )
          
         




      //  ** using this few minutes later .
      //  SizedBox(
      //    height: heightMediaQuery*0.7,
      //    child: ListView.builder(
      //      scrollDirection: Axis.vertical,
      //      itemCount: 100,
      //      itemBuilder:(context, index) {
      //       return ;
      //      }),
      //  ),

        
      ],
    ));
  }
}
