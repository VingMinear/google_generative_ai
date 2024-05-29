import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.keyboardType,
    this.style,
    this.maxLengthEnforcement,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.maxLines,
    this.onTap,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.label,
    this.fillColor,
    this.borderColor,
    this.errorColor,
    this.focusedColor,
    this.enabledColor,
    this.labelText,
    this.hintText,
    this.prefix,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixIconConstraints,
    this.suffix,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffixIconConstraints,
  });
  final Widget? label;
  final Color? fillColor;
  final Color? borderColor;
  final Color? errorColor;
  final Color? focusedColor;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final BoxConstraints? suffixIconConstraints;
  final Color? enabledColor;

  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final bool autofocus = false;
  final bool readOnly = false;
  final String obscuringCharacter = '•';
  final bool obscureText = false;
  final bool autocorrect = true;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      autocorrect: autocorrect,
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLines,
      onSaved: onSaved,
      onTapOutside: onTapOutside,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      onEditingComplete: onEditingComplete,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      enabled: enabled,
      onTap: onTap,
      minLines: minLines,
      maxLengthEnforcement: maxLengthEnforcement,
      initialValue: initialValue,
      obscuringCharacter: obscuringCharacter,
      readOnly: readOnly,
      focusNode: focusNode,
      style: style,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        // prefixIcon: Icon(Icons.email),
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        label: label,
        labelText: labelText,
        suffix: suffix,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        suffixIconConstraints: suffixIconConstraints,
        prefix: prefix,
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        prefixIconConstraints: prefixIconConstraints,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Colors.grey, width: 0.3),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: focusedColor ?? context.theme.canvasColor, width: 0.3),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorColor ?? Colors.red, width: 0.3),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: enabledColor ?? context.theme.canvasColor, width: 0.3),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
