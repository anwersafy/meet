import 'package:flutter/material.dart';
import 'package:meet/colors/colors.dart';
class HomeMeetingButton extends StatelessWidget {
  const HomeMeetingButton({super.key ,required this.onPressed , required this.icon , required this.text});
  final VoidCallback onPressed;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(

                  color: Colors.black12,
                  offset: Offset(0, 2),
                  blurRadius: 4.0,
                )
              ]
            ),
            child: Icon(icon , color: Colors.white,),
          ),
          const SizedBox(height: 10,),
          Text(text , textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey , fontSize: 12),)
        ],
      )

    );
  }
}
