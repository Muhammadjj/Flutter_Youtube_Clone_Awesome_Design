import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';



class YoutubeTagAndIconWorking extends StatelessWidget {
  const YoutubeTagAndIconWorking({super.key});

  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.sizeOf(context).height;
    var widthMediaQuery = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/images/youtube.svg"),
             Row(
              children: [
                const Icon(LineIcons.video,color: Colors.white,size: 30,),
                 SizedBox(width: widthMediaQuery*0.05,),
                const Icon(LineIcons.search,color: Colors.white,size: 30,),
                 SizedBox(width: widthMediaQuery*0.05,),
                const Icon(LineIcons.bell,color: Colors.white,size: 30,),
                 SizedBox(width: widthMediaQuery*0.04,),
                 SizedBox(
                  height: heightMediaQuery*0.05,
                  width: widthMediaQuery*0.1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset("assets/images/jawad.jpg",fit: BoxFit.cover,)),
                ),
                //  SizedBox(width: widthMediaQuery*0.02,),
              ],
            )
          ],
        ),
      ),
    );
  }
}




  // ** Text Using for Youtube Title .
  Widget youtubeTitleText(String titleText){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(titleText,style:const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),maxLines: 1,overflow: TextOverflow.ellipsis,),
    );
  }




  