import 'package:aseto_assignment/src/common/colors.dart';
import 'package:aseto_assignment/src/common/custom_textfield.dart';
import 'package:aseto_assignment/src/common/toast.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Enter the information below to Sign up for your account.',
                    style: TextStyle(color: textColor, fontSize: 18),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  labelText: 'Full Name',
                  isRequired: true,
                  controller: nameController,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  labelText: 'Date of birth(MM-DD-YYYY)',
                  isRequired: true,
                  controller: dobController,
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  labelText: 'Email',
                  isRequired: true,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  labelText: 'Phone',
                  isRequired: true,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  labelText: 'Password',
                  controller: passwordController,
                  isPassword: true,
                  isBottom: true,
                ),
                CustomTextField(
                  labelText: 'Confirm Password',
                  controller: confirmPasswordController,
                  isPassword: true,
                  isTop: true,
                ),
                SizedBox(height: 20),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (nameController.text.isEmpty) {
                              showCustomToast('Error', 'Name is required');
                              return;
                            }
                            if (dobController.text.isEmpty) {
                              showCustomToast(
                                  'Error', 'Date of birth is required');
                              return;
                            }
                            if (emailController.text.isEmpty) {
                              showCustomToast('Error', 'Email is required');
                              return;
                            }
                            if (phoneController.text.isEmpty) {
                              showCustomToast('Error', 'Phone is required');
                              return;
                            }
                            if (phoneController.text.length != 10) {
                              showCustomToast('Error',
                                  'Phone number must be 10 digits long');
                              return;
                            }
                            if (passwordController.text.isEmpty) {
                              showCustomToast('Error', 'Password is required');
                              return;
                            }
                            if (passwordController.text.length < 8) {
                              showCustomToast('Error',
                                  'Password must be at least 8 characters long');
                              return;
                            }
                            if (confirmPasswordController.text.isEmpty) {
                              showCustomToast(
                                  'Error', 'Confirm Password is required');
                              return;
                            }
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              showCustomToast(
                                  'Error', 'Passwords do not match');
                              return;
                            }

                            RegExp emailRegExp = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                            if (!emailRegExp.hasMatch(emailController.text)) {
                              showCustomToast('Error', 'Email is invalid');
                              return;
                            }
                            showCustomToast(
                                'Success', 'Account created successfully',
                                durationInSeconds: 3);
                          }
                        },
                        style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor:
                                WidgetStatePropertyAll(primaryColor)),
                        child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white),
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: textColor),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Log in',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ]),
        ),
      )),
    );
  }
}
