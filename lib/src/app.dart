
import 'package:flutter/material.dart';
import 'package:consumer_app/src/theme/app_theme.dart';
import 'package:consumer_app/src/screens/main_wrapper.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consumer App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainWrapper(),
    );
  }
}
