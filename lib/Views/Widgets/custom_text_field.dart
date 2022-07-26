import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool obsecureInput;
  final String obsecureCharacter;
  final TextEditingController textEditingController;
  final String hint;
  const CustomTextField({
    Key? key,
    required this.obsecureInput,
    required this.obsecureCharacter,
    required this.textEditingController,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            obscureText: obsecureInput,
            obscuringCharacter: obsecureCharacter,
            controller: textEditingController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
