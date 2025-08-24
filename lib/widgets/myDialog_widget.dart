import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/home_page.dart';
import 'package:flutter/material.dart';

Future<void> showMyDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String buttonText,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          tr(title),
          style: TextStyle(color: Colors.red[400], fontSize: 40),
        ),
        content: Text(
          tr(content),
          style: const TextStyle(color: Colors.grey, fontSize: 20),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const HomeScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 800),
                ),
              );
            },
            child: Text(
              tr(buttonText),
              style: TextStyle(color: Colors.red[400], fontSize: 20),
            ),
          ),
        ],
      );
    },
  );
}
