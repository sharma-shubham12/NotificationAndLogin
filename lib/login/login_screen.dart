
import 'package:flutter/material.dart';
import 'package:simple_notification_and_login/home/home_screen.dart';
import 'package:simple_notification_and_login/login/sign_up_screen.dart';

import '../widget/CommonWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            child: Image.asset(
                              "assets/logo.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          headingText("Sign in to continue", Colors.black, 18,
                              FontWeight.bold, 24, 4),
                          SizedBox(
                            height: 24,
                          ),
                          Column(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 4),
                                    child: TextFieldView(
                                        emailController,
                                        "Enter Email"),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 4),
                                    child: TextFieldView(
                                        passwordController,
                                        "Enter Password",isPassword:true ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: GestureDetector(
                                        onTap: () {
                                          /*Get.to(ForgotPassword());*/
                                        },
                                        child: headingText(
                                            "Forgot Password",
                                            Colors.blue,
                                            14,
                                            FontWeight.bold,
                                            20,
                                            4)),
                                  )
                                ],
                              ),
                            ],
                          ),
                          CommonButton(context, () {
                            String email =emailController.text.toString().trim();
                            String password =passwordController.text.toString().trim();
                            final bool emailValid =
                            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email);
                            if(email.isEmpty){
                              showToast(message: "Please enter email");
                              return;
                            }
                            if(!emailValid){
                              showToast(message: "Please enter valid email");
                              return;
                            }
                            if(password.isEmpty){
                              showToast(message: "Please enter password");
                              return;
                            }
                            Navigator.pushAndRemoveUntil<dynamic>(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (BuildContext context) => const HomeScreen(),
                              ),
                                  (route) => false,//if you want to disable back feature set to false
                            );

                          }, "Sign in"),
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            alignment: AlignmentDirectional.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                headingText("Need an account?", Colors.black, 12,
                                    FontWeight.w500, 0, 0),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => SignUpScreen()
                                    ));
                                  },
                                  child: headingText(
                                      'SIGN UP', Colors.blue, 14, FontWeight.w500, 8, 4),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            alignment: AlignmentDirectional.center,
                            child: GestureDetector(
                              onTap: () {},
                              child: headingText(
                                  "Terms & conditions and privacy policy", Colors.grey, 12, FontWeight.w500, 0, 0),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
