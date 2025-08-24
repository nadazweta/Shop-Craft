import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/sign_in_page.dart';
import 'package:final_project/screens/sing_up_page.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class welcome_screen extends StatelessWidget {
  const welcome_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.language),
          onPressed: () {
            changLanguage(context);
          },
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red[700],
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const SignUpScreen(),
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
              tr('new account'),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red[700],
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const SignInScreen(),
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
              tr('login_account'),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            "ShopCraft",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.red[700],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: SizedBox(
                      height: 200,
                      child: Image.asset(
                        'assets/shopping_image.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: SizedBox(
                      width: 100,
                      height: 200,
                      child: Image.network(
                        'https://i.pinimg.com/1200x/dc/c1/a0/dcc1a0837c2869b0d63f5d0793e73bf0.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            tr('welcome statement'),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void changLanguage(BuildContext context) {
    if (context.locale == const Locale('en', 'US')) {
      context.setLocale(const Locale('ar', 'EG'));
    } else {
      context.setLocale(const Locale('en', 'US'));
    }
  }
}
