import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


Widget TextFieldView(TextEditingController controller, String title,{bool isPassword=false,bool type=false}) {
  return TextField(
    controller: controller,
    obscureText: isPassword,
    keyboardType: type?TextInputType.phone:TextInputType.text,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 3, color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      enabledBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ) ,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),


      // Added this
      contentPadding: EdgeInsets.all(12),
      hintText: title,
    ),
  );
}

Widget CommonButton(BuildContext context, dynamic function, String title) {
  return Container(
    width: MediaQuery
        .of(context)
        .size
        .width,
    margin: EdgeInsets.all(16),
    child: ElevatedButton(
      child: Text(title),
      onPressed: () {
        function();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          padding:
          MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
          textStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    ),
  );
}


Widget headingText(String title, Color color, double size,
    FontWeight fontWeight, double horizontal, double vertical) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
    child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
        )),
  );
}

showToast({required String message}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
  );
}

