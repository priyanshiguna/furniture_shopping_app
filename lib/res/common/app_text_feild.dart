import 'package:flutter/material.dart';

class TextFieldScreen extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final bool? isDense;
  final String? hintText;
  final Widget? hidePassword;
  final String? labelText;
  final TextStyle? labelStyle;
  final Function(String)? onChanged;
  final String Function(String?)? validator;

  const TextFieldScreen({
    Key? key,
    this.controller,
    this.keyboardType,
    this.textCapitalization,
    this.textInputAction,
    this.obscureText,
    this.onChanged,
    this.validator,
    this.hintText,
    this.hidePassword,
    this.isDense,
    this.labelText,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      autocorrect: false,
      autofocus: true,
      keyboardType: keyboardType ?? TextInputType.name,
      textAlign: TextAlign.start,
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      textInputAction: textInputAction ?? TextInputAction.done,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        isDense: isDense ?? false,
        hintText: hintText ?? "",
        hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF909090)),
        fillColor: Colors.white,
        filled: true,
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(4),
        //   // borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(4),
        //   borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(4),
        //   borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
        // ),

        labelText: labelText,
        labelStyle: labelStyle,
        suffixIcon: hidePassword ?? const SizedBox(),
      ),
    );
  }
}
