import 'package:aseto_assignment/src/common/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final bool isRequired;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isPassword;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? isTop;
  final bool? isBottom;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.isRequired = false,
    this.controller,
    this.keyboardType,
    this.isPassword = false,
    this.onChanged,
    this.validator,
    this.isTop = false,
    this.isBottom = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return FormField(
        validator: widget.validator,
        builder: (FormFieldState<String> state) {
          return TextField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword ? _obscureText : false,
            onChanged: widget.onChanged,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
            ),
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: TextStyle(
                color: textColor,
                fontSize: 14,
              ),
              suffixIcon: widget.isRequired
                  ? Padding(
                      padding: const EdgeInsets.only(right: 12.0, top: 12),
                      child: Text(
                        "(${widget.isRequired ? 'Required' : 'Optional'})",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                        ),
                      ),
                    )
                  : widget.isPassword
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: textColor,
                          ))
                      : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(widget.isTop ?? true ? 0 : 10),
                  topRight: Radius.circular(widget.isTop ?? true ? 0 : 10),
                  bottomLeft: Radius.circular(widget.isBottom ?? true ? 0 : 10),
                  bottomRight:
                      Radius.circular(widget.isBottom ?? true ? 0 : 10),
                ),
                borderSide: BorderSide(
                  color: secondaryColor,
                  width: 1,
                ),
              ),
            ),
          );
        });
  }
}
