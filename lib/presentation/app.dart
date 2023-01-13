import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pam_lab4/presentation/navigation.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: ThemeData(primarySwatch: Colors.cyan),
      initialRoute: Navigation.ROUTE_HOME,
      getPages: Navigation.pages(),
    );
  }
}