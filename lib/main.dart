import 'package:flutter/material.dart';
import 'package:flutter_file_download/app.dart';
import 'package:flutter_file_download/injection/injector.dart';

void main() async {
  // Initialize GetIt service locator
  await initServiceLocator();

  runApp(const MyApp());
}
