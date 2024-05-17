import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:instant_messaging/Utils/colors.dart';

class CustomField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final TextInputType textInputType;
  final bool obscure;
  const CustomField({
    super.key,
    required this.hintText,
    this.textInputType = TextInputType.text,
    required this.controller,
    this.obscure = false,
    required this.icon,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  late bool showPassword = widget.obscure;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        validator: (value) => value!.isEmpty ? "Required" : null,
        obscureText: showPassword,
        keyboardType: widget.textInputType,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: widget.obscure
              ? InkWell(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Icon(
                    showPassword ? Iconsax.eye : Iconsax.eye_slash,
                  ),
                )
              : null,
          contentPadding: const EdgeInsets.all(16),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: kPrimaryColor),),
          prefixIcon: Icon(widget.icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
