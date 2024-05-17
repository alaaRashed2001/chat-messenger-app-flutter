import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:instant_messaging/Widgets/logo_app.dart';
import 'package:instant_messaging/Utils/colors.dart';
import 'package:instant_messaging/Widgets/text_field.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  late TextEditingController emailEditingController;
  @override
  void initState() {
    emailEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailEditingController.dispose();
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
                "Reset Password,",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "Please Enter Your Email",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              CustomField(
                controller: emailEditingController,
                hintText: "Email",
                icon: Iconsax.direct,
                 textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () async{
                 await performSendEmail();
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
                    "Send Email".toUpperCase(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> performSendEmail() async {
    if (checkData()) {
      await sendEmail();
    }
  }

  Future<void> sendEmail() async {
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
    }
    return true;
  }
}
