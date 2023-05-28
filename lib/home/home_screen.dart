

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/notification_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  NotificationServices notificationServices = NotificationServices();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();

    notificationServices.getDeviceToken().then((value){
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notifications'),
      ),
      body: Center(
        child: TextButton(onPressed: (){

          // send notification from one device to another
          notificationServices.getDeviceToken().then((value)async{

            var data = {
              'to' : value.toString(),
              'notification' : {
                'title' : 'Testing' ,
                'body' : 'Testing App' ,
                "sound": "jetsons_doorbell.mp3"
            },
              'android': {
                'notification': {
                  'notification_count': 11,
                },
              },
              'data' : {
                'type' : 'Chat' ,
                'id' : 'Shubham'
              }
            };

            await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
            body: jsonEncode(data) ,
              headers: {
                'Content-Type': 'application/json; charset=UTF-8',
                'Authorization' : 'key=AAAA1T7VIDQ:APA91bE3LIbGQzrSBetXJysLTiwvC5VrBTvIyjhdktSlSX4Mm5YoXr7JImhtRiRDgwFnO3-P82NzjN38r3rnD3Y0DEuw5vkxXx-EXYd3CUDx18Q7VB5uoNvnP6ZzLRuGyn3cPCgeFfeL'
              }
            ).then((value){
              if (kDebugMode) {
                print(value.body.toString());
              }
            }).onError((error, stackTrace){
              if (kDebugMode) {
                print(error);
              }
            });
          });
        },
            child: Text('Send Notifications')),
      ),
    );
  }
}
