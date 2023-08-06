import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:meet/resourses/auth_method.dart';

import 'firestore_methods.dart';


class JitsiMeetingMethod {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  void createMeeting( {required String roomName ,
    required bool isAudioMuted,
    required bool isVideoMuted,


  } ) async{
    try {

      var options = JitsiMeetingOptions(
        userDisplayName: _authMethods.currentUser.displayName,
        userAvatarUrl: _authMethods.currentUser.photoURL,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        roomNameOrUrl: roomName,
      );
      _firestoreMethods.addToMeetingHistory(roomName);


      await JitsiMeetWrapper.joinMeeting( options: options);
    } catch (error) {
      debugPrint("error: $error");
    }

  }
}