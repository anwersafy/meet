import 'package:flutter/material.dart';
import 'package:meet/component/custom_button.dart';
import 'package:meet/resourses/auth_method.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Start or join a meeting', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.only(top: 38.0, bottom:38.0,right: 18.0,left: 18.0),
            child: Image.asset('images/meeting.png'),
          ),
          CustomButton(
            text: 'Login',
            onPressed: () async{
              bool res = await _authMethods.signWithGoogle(context);
              if( res){
                Navigator.pushNamed(context, '/home');
              }
            },
          ),

        ],
      ),


    );
  }
}
