import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:instant_messaging/Utils/colors.dart';
import 'package:instant_messaging/Widgets/text_field.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({super.key});

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  late TextEditingController nameEditingController;
  @override
  void initState() {
    nameEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameEditingController.dispose();
    super.dispose();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.logout_1))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome,",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                "Messenger Alaa Noman",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Please Enter Your Name",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              CustomField(
                controller: nameEditingController,
                hintText: "Name",
                icon: Iconsax.user,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () async {
                  await performSetupProfile();
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
                          "Continue".toUpperCase(),
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

  Future<void> performSetupProfile() async {
    if (checkData()) {
      await setupProfile();
    }
  }

  Future<void> setupProfile() async {
    setState(() {
      isLoading = true;
    });

    ///
    setState(() {
      isLoading = false;
    });
  }

  bool checkData() {
    if (nameEditingController.text.isEmpty) {
      // showSnackBar(context,
      //     message: 'The email address must be not empty.', error: true);
      return false;
    }
    return true;
  }
}
