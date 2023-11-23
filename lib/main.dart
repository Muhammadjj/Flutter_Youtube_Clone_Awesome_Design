import 'package:flutter/material.dart';
import 'Screens/routes_method.dart';

void main() {
  runApp(const YoutubeClone());
}

class YoutubeClone extends StatelessWidget {
  const YoutubeClone({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,),
        initialRoute: RoutesName.firstYoutubePage,
        onGenerateRoute: RoutesMethod.onGenerate,
    );
  }
}
