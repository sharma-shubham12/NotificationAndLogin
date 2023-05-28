
import 'package:flutter/material.dart';

import '../widget/CommonWidget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController= TextEditingController();
  TextEditingController lastNameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController phoneNumberController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController confirmPasswordController= TextEditingController();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: const Text("Register"),

          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                headingText(
                    "First Name", Colors.black, 14, FontWeight.w500, 18, 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: TextFieldView(
                      firstNameController, "First Name"),
                ),
                headingText(
                    "Last Name", Colors.black, 14, FontWeight.w500, 18, 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: TextFieldView(
                      lastNameController, "Last Name"),
                ),
                headingText("Email", Colors.black, 14, FontWeight.w500, 18, 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: TextFieldView(
                      emailController, "Email"),
                ),
                headingText("Phone", Colors.black, 14, FontWeight.w500, 18, 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: TextFieldView(
                      phoneNumberController, "Phone",type: true),
                ),


                headingText(
                    "Password", Colors.black, 14, FontWeight.w500, 18, 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: TextFieldView(
                      passwordController, "Password",isPassword: true),
                ),
                headingText("Confirm Password", Colors.black, 14,
                    FontWeight.w500, 18, 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: TextFieldView(
                      confirmPasswordController,
                      "ConfirmPassword",isPassword: true),
                ),
                CommonButton(context, (){
                  String firstName =firstNameController.text.toString().trim();
                  String lastName =lastNameController.text.toString().trim();
                  String phone =phoneNumberController.text.toString().trim();
                  String email =emailController.text.toString().trim();

                  String password =passwordController.text.toString().trim();
                  String confirmPassword =confirmPasswordController.text.toString().trim();
                  final bool emailValid =
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(email);
                  if(firstName.isEmpty){
                    showToast(message: "Please enter first name");
                    return;
                  } else if(lastName.isEmpty){
                    showToast(message: "Please enter last name");
                    return;
                  }
                  else if(phone.isEmpty){
                    showToast(message: "Please enter phone Number");
                    return;
                  }
                  else if(email.isEmpty){
                    showToast(message: "Please enter email");
                    return;
                  }
                  else if(!emailValid){
                    showToast(message: "Please enter valid email");
                    return;
                  }
                  else if(password.isEmpty){
                    showToast(message: "Please enter password");
                    return;
                  }else if(password.length<6){
                    showToast(message: "Password min 6 length");
                    return;
                  }
                  else if(confirmPassword.isEmpty){
                    showToast(message: "Please enter password");
                    return;
                  } else if(password!=confirmPassword){
                    showToast(message: "Password same password");
                    return;
                  }

                  Navigator.pop(context);
                }, "Sign Up"),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: headingText("Sign in", Colors.black, 14,
                        FontWeight.bold, 24, 4),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ));
  }
}
