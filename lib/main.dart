import 'package:flutter/material.dart';
import 'package:mini_chat/config/themes/app_theme.dart';
import 'package:mini_chat/ui/chat/screens/chat.dart';
import 'package:mini_chat/ui/providers/chat_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ChatProvider(),
          )
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.watch<ChatProvider>().isDarkMode;
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 2).themeData(isDarkMode),
      home: const ChatScreen(),
    );
  }
}
