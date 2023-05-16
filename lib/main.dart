import 'package:flutter/material.dart';
import 'package:mini_chat/config/themes/app_theme.dart';
import 'package:mini_chat/ui/chat/screens/chat.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 2).themeData(),
      home: const ChatScreen(),
    );
  }
}
