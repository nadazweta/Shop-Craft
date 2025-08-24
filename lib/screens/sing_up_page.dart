import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/widgets/myDialog_widget.dart';
import 'package:final_project/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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
              tr('new account'),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    tr('create_account'),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[400],
                    ),
                  ),
                  Text(
                    "${tr('join')} ${tr('to')} ShopCraft",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 70, 66, 66), fontSize: 20),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: "${tr('enter')} ${tr('full_name')}",
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
                        return "${tr('enter')} ${tr('full_name')}";
                      } else if (value[0] != value[0].toUpperCase()) {
                        if (context.locale == const Locale('en', 'US')) {
                          return tr('first letter must be uppercase');
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: "${tr('enter')} ${tr('email')}",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(211, 47, 47, 1),
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
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: hiddenPassword,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            togglePassword();
                          },
                          icon: Icon(hiddenPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        labelText: "${tr('enter')} ${tr('password')}",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(211, 47, 47, 1),
                            width: 2,
                          ),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "${tr('enter')} ${tr('password')}";
                      } else if (value.length < 6) {
                        return tr(
                            'Password must be at least 6 characters long');
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: hiddenPassword,
                    decoration: InputDecoration(
                        labelText: "${tr('enter')} ${tr('password')}",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(211, 47, 47, 1),
                            width: 2,
                          ),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "${tr('enter')} ${tr('Confirm_Password')}";
                      } else if (value != passwordController.text) {
                        return tr('Passwords do not match');
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: ElevatedButton(
                        style: ButtonStyle(
                          minimumSize:
                              WidgetStateProperty.all(const Size(350, 50)),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // radius in px
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all<Color>(
                              Colors.red.shade400),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showMyDialog(
                              context: context,
                              title: 'Success!',
                              content: 'Account created successfully',
                              buttonText: 'close',
                            );
                          } else {
                            SnackBar snackBar = const SnackBar(
                              content: Text("Enter a valid data"),
                              duration: Duration(seconds: 2),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: Text(
                          tr('create_account'),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        )),
                  ),
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
