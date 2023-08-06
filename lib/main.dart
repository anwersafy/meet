import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meet/resourses/auth_method.dart';
import 'package:meet/screens/home_screen.dart';
import 'package:meet/screens/login_screen.dart';
import 'package:meet/screens/videocall_screen.dart';

import 'colors/colors.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(

    options:  DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Meet',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/video': (context) => const VideoCallScreen(),

      },

      home:StreamBuilder(
        stream:AuthMethods().authChanges ,
        builder: ( context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasData){
            return const HomeScreen();
          }else if(snapshot.hasError){
            return const Center(child: Text('Something went wrong'),);
          }else{
            return const LoginScreen();
          }
        },
      ) ,
    );
  }
}
