import 'package:flutter/material.dart';
import 'package:mini_chat/ui/chat/widgets/chat/message_field.dart';

import '../widgets/chat/her_message_bubble.dart';
import '../widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://ih1.redbubble.net/image.2807782304.4235/flat,128x,075,f-pad,128x128,f8f8f8.u2.jpg',
            ),
          ),
        ),
        title: const Text(
          'La otra',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (contex, index) {
                  return (index % 2 == 0)
                      ? const HerMessagueBubble()
                      : const MyMessagueBubble();
                },
              ),
            ),
            const MessageField()
          ],
        ),
      ),
    );
  }
}
