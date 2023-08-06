import 'package:flutter/material.dart';
import 'package:meet/colors/colors.dart';
import 'package:meet/resourses/auth_method.dart';
import 'package:meet/resourses/jitsi_method.dart';

import '../component/meeting_option.dart';
class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIDController;
  late TextEditingController nameController;
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  final JitsiMeetingMethod _jitsiMeetingMethod = JitsiMeetingMethod();
  @override
  void initState() {
    meetingIDController = TextEditingController();
    nameController = TextEditingController(
        text: _authMethods.currentUser.displayName

    );
    super.initState();
  }
  @override
  void dispose() {
    meetingIDController.dispose();
    nameController.dispose();
    super.dispose();
  }
  _JoinMeeting(){
    _jitsiMeetingMethod.createMeeting(
        roomName:meetingIDController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
    );
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text('Join a Meeting',style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: TextFormField(
              textAlign: TextAlign.center,
               controller:meetingIDController ,
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter Meeting Code',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: TextFormField(
              textAlign: TextAlign.center,
               controller:nameController ,
              maxLines: 1,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          MaterialButton(
            onPressed: _JoinMeeting,
            child: Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(child: Text('Join',style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),)),
            ),
          ),
          MeetingOption(text: 'Turn off Audio ', isMuted:isAudioMuted  , onChanged:onAudioMuted,),
          MeetingOption(text: 'Turn off Video ', isMuted:isVideoMuted  , onChanged: onVideoMuted,),

        ],
      ),

    );
  }
  void onAudioMuted(bool value){
    setState(() {
      isAudioMuted = value;
    });
  }
  void onVideoMuted(bool value){
    setState(() {
      isVideoMuted = value;
    });
  }
}
