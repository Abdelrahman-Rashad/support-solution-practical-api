import 'package:flutter/material.dart';
import 'package:support_plant/sign_in.dart';
import 'package:support_plant/sign_up.dart';

main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignIn(),
    );
  }
}