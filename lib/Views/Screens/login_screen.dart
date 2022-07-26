import 'package:cemex_task/Views/Screens/error_screen.dart';
import 'package:flutter/material.dart';
import '../Widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  static const String loginScreenKey = '/loginScreenKeyNavigation';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Function onSubmit;
  final bool havingError;
  final String errorMessage;

  LoginScreen(
      {Key? key,
      required this.onSubmit,
      required this.havingError,
      required this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: Image.asset(
                  'assets/images/cemex.png',
                  fit: BoxFit.fill,
                ),
              ),
              CustomTextField(
                hint: 'Enter Your Email',
                obsecureInput: false,
                textEditingController: _emailController,
                obsecureCharacter: '*',
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                hint: 'Enter Your Password',
                obsecureInput: true,
                obsecureCharacter: '*',
                textEditingController: _passwordController,
              ),
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    onSubmit(_emailController.text, _passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    fixedSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      havingError ? ErrorScreen(errorMessage: errorMessage) : Container()
    ]);
  }
}
