import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

import 'package:flutter/material.dart';
import 'package:vendor_app_only/vendor/views/auth/vendor_auth_screen.dart';
import 'package:vendor_app_only/vendor/views/auth/vendor_registeration_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  // Platform.isAndroid? await Firebase.initializeApp(options: FirebaseOptions(
  //   apiKey: 'AIzaSyDi2EKBcNqHKrlSpvRgjRR67ZDw4PLosUU', 
  //   appId:'1:6329481609:android:4d8e8a3e0cb52d4c99c958', 
  //   messagingSenderId: '6329481609',
  //    projectId: 'multi-vendor-app-7c8e0',
  //    storageBucket: 'gs://multi-vendor-app-7c8e0.appspot.com')
  //    ):Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:VendorRegisterationScreen(),
    );
  }
}
