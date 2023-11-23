import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class VideoPlayerContainerDetailPage extends StatefulWidget {
  const VideoPlayerContainerDetailPage({super.key, required this.profile});
  final String profile;
  @override
  State<VideoPlayerContainerDetailPage> createState() =>
      _VideoPlayerContainerDetailPageState();
}

class _VideoPlayerContainerDetailPageState
    extends State<VideoPlayerContainerDetailPage> {
  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.sizeOf(context).height;
    var widthMediaQuery = MediaQuery.sizeOf(context).width;
    return Container(
      height: heightMediaQuery * 0.3,
      width: widthMediaQuery,
      color: Colors.black,
      child: Image(image: NetworkImage(widget.profile.toString()),fit: BoxFit.cover),
    );
  }
}





class TitleLikeSubscribeDetailPage extends StatelessWidget {
  const TitleLikeSubscribeDetailPage({
    super.key, 
    required this.videoTitle, 
    required this.viewAndDate, 
    required this.like, 
    required this.unlike, 
    required this.proFileImage, 
    required this.subscribe,
    required this.username});
    
  final String videoTitle;
  final Text viewAndDate;
  final String like;
  final String unlike;
  final String proFileImage;
  final String username;
  final String subscribe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(videoTitle,style: usingText(17, Colors.white, FontWeight.w700),),
          subtitle: viewAndDate,
          trailing:  Icon(LineIcons.angleDown,color: Colors.white.withOpacity(0.6),),
        ),
        const SizedBox(height: 10,),
        // * Row Vise Working .
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              likeDownloadSave(LineIcons.angleUp, like),
              likeDownloadSave(LineIcons.angleDown, unlike),
              likeDownloadSave(LineIcons.share, "Share"),
              likeDownloadSave(LineIcons.download, "Download"),
              likeDownloadSave(LineIcons.save, "Save"),
            ],
          ),
        ),
        
        // ** Divider .
        Divider(color: Colors.white.withOpacity(0.1),),
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(image: NetworkImage(proFileImage))),
          title: Text(username,style: usingText(15, Colors.white, FontWeight.bold),),
          subtitle: Text(subscribe,style: usingText(14, Colors.white.withOpacity(0.6), FontWeight.w100),),
          trailing: Text("SUBSCRIBE",style: usingText(17, Colors.red, FontWeight.bold),),
        ),

        // ** Divider .
        Divider(color: Colors.white.withOpacity(0.1),),
      ],
    );
  }

  TextStyle usingText(double fontSize,Color color,FontWeight fontWeight){
    return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight);
  }
}


Widget likeDownloadSave(IconData icons,String likesText,){
  return Column(
    children: [
      Icon(icons,color: Colors.white.withOpacity(0.6),size: 25,),
      const SizedBox(height: 5,),
      Text(likesText,style: TextStyle(color: Colors.white.withOpacity(0.6),fontSize: 15)),
    ],
  );
}








// ** Songs List 
class SongList extends StatelessWidget {
  const SongList({
  super.key, 
  required this.profileImage,
  required this.title,
  required this.username,
  required this.viewCount});

  final String profileImage;
  final String title;
  final String username;
  final String viewCount;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return ListTile(
      leading: Container(
          height: height*0.8,
          width: width*0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(image: NetworkImage(profileImage),fit: BoxFit.cover,)),
      ),
      title: Text(title,style: const TextStyle(color: Colors.white,),),
      subtitle: Text(username+viewCount,style: TextStyle(color: Colors.white.withOpacity(0.6))),    
      trailing: const Icon(Icons.save),  
    ) ;
  }
}