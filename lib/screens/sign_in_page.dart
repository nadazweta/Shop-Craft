import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/widgets/myDialog_widget.dart';
import 'package:final_project/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hiddenPassword = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red[400],
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const welcome_screen()),
                  );
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white),
            title: Text(
              tr('login_account'),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Center(
                      child: Text(
                    tr('Welcome Back_state'),
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[400],
                    ),
                  )),
                  Center(
                      child: Text(
                    "${tr("login")} ${tr('to')} ShopCraft",
                    style: const TextStyle(color: Colors.grey, fontSize: 18),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          label: Text(tr('email')),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(239, 83, 80, 1),
                              width: 2,
                            ),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return tr('Please enter an email');
                        } else if (!value.contains('@')) {
                          return tr('Email must contain @');
                        } else if (!EmailValidator.validate(value)) {
                          return tr('Invalid email address');
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: hiddenPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return tr('Please enter your password');
                        } else if (value.length < 6) {
                          return tr(
                              'Password must be at least 6 characters long');
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(239, 83, 80, 1),
                              width: 2,
                            ),
                          ),
                          label: Text(tr('password')),
                          suffixIcon: IconButton(
                            onPressed: () {
                              togglePassword();
                            },
                            icon: Icon(hiddenPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        minimumSize:
                            WidgetStateProperty.all(const Size(350, 50)),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20), // radius in px
                          ),
                        ),
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.red.shade400),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showMyDialog(
                            context: context,
                            title: 'welcome',
                            content: 'Login done',
                            buttonText: 'close',
                          );
                        } else {
                          SnackBar snackBar = SnackBar(
                            content: Text(tr('Enter a valid data')),
                            duration: const Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text(
                        tr('login'),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ],
              ),
            ),
          )),
    );
  }

  togglePassword() {
    hiddenPassword = !hiddenPassword;
    setState(() {});
  }
}
