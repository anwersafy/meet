import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';


showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(

      content:AwesomeSnackbarContent(
        title: ':',
        message: text,
        color: Colors.red, contentType: ContentType.warning,
      ),

    ),
  );
}