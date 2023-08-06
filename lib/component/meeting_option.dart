import 'package:flutter/material.dart';

import '../colors/colors.dart';

class MeetingOption extends StatelessWidget {
   MeetingOption({super.key, required this.text, required this.isMuted, required this.onChanged});
  String text;
  final bool isMuted;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(text,style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),),
          Switch.adaptive(
              value: isMuted ,
              onChanged: onChanged,
          )


        ],
      ),

    );
  }
}
