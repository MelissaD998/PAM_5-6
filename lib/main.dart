import 'package:flutter/material.dart';
import 'package:pam_lab4/initializer/di-initializer.dart';
import 'package:pam_lab4/presentation/app.dart';

Future<void> main() async {
  await DIInitializer.init();
  runApp(App());
}