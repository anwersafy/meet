import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../resourses/firestore_methods.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingHistory,
        builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(

          itemCount:(snapshot.data! as dynamic).docs.length,
            itemBuilder: (context,index){
            return ListTile(
              title: Text('Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}' ),
              subtitle: Text('Joined On : ${DateFormat.yMd().add_jm().format(DateTime.fromMicrosecondsSinceEpoch(snapshot.data!.docs[index]['time'].microsecondsSinceEpoch))}' ),

            );
            }
        );

        }
    );
  }
}
