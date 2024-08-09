import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hint, this.validator, this.onSaved, required this.obscureText, this.suffixIcon});
  final String hint;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscureText ,
      onSaved: onSaved,
      // obscureText: true,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon:suffixIcon ,
        constraints:const BoxConstraints(
          minWidth: 410,
          minHeight: 48
        ),
        errorMaxLines: 1,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Color(0xff5D5D5D),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
          ),
        ),
      ),
    );
  }
}
