import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meet/resourses/jitsi_method.dart';

import '../component/home_meeting_button.dart';
class MeetingScreen extends StatelessWidget {
   MeetingScreen({super.key});
   final JitsiMeetingMethod _jitsiMeetingMethod = JitsiMeetingMethod();
   CerateNewMeeting ()async{
     var random = Random();
      String roomName = random.nextInt(100000+10000).toString();
     _jitsiMeetingMethod.createMeeting(roomName:roomName , isAudioMuted: true, isVideoMuted: true);
   }
   joinMeeting (BuildContext context){
     Navigator.pushNamed(context, '/video');

   }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20,) ,

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed:CerateNewMeeting ,
              icon: Icons.videocam, text: 'New Meeting',),
            HomeMeetingButton(onPressed: (){
              joinMeeting(context);
            },
              icon: Icons.video_call_outlined, text: 'Join Meeting',),

          ],
        ),
        const Expanded(child: Center(child: Text('Create a meeting or join with a code',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),) ,
        ))
      ],
    );
  }
}
