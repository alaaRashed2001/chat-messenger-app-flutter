import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:instant_messaging/Screens/Auth/forget_screen.dart';
import 'package:instant_messaging/Screens/Auth/setup_profile.dart';
import 'package:instant_messaging/Utils/colors.dart';
import 'package:instant_messaging/Widgets/logo_app.dart';
import 'package:instant_messaging/Widgets/text_field.dart';
import 'package:instant_messaging/layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailEditingController;
  late TextEditingController passwordEditingController;
  @override
  void initState() {
    emailEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoApp(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Welcome Back,',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'New Material Chat App',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Column(
                children: [
                  CustomField(
                    controller: emailEditingController,
                    hintText: "Email",
                    icon: Iconsax.direct,
                    textInputType: TextInputType.emailAddress,
                  ),
                  CustomField(
                    controller: passwordEditingController,
                    hintText: "Password",
                    icon: Iconsax.password_check,
                    obscure: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        child: const Text("Forget Password?"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgetScreen(),
                              ));
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      ///ToDo await performLogin();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LayoutApp(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: kPrimaryColor,
                      padding: const EdgeInsets.all(16),
                    ),
                    child: Center(
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : Text(
                              "Login".toUpperCase(),
                              style: const TextStyle(color: Colors.black),
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(16),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SetupProfile(),
                            ),
                            (route) => false);
                      },
                      child: Center(
                        child: isLoading
                            ? const CircularProgressIndicator()
                            : Text(
                                "Create Account".toUpperCase(),
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                              ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    ///
    setState(() {
      isLoading = false;
    });
  }

  bool checkData() {
    if (emailEditingController.text.isEmpty) {
      // showSnackBar(context,
      //     message: 'The email address must be not empty.', error: true);
      return false;
    } else if (passwordEditingController.text.isEmpty) {
      // showSnackBar(context,
      //     message: 'The password must be not empty.', error: true);
      return false;
    }
    return true;
  }
}
