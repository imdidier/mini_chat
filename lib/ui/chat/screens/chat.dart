import 'package:flutter/material.dart';
import 'package:mini_chat/ui/providers/chat_provider.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/message.dart';
import '../widgets/export_widgets.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.watch<ChatProvider>().isDarkMode;
    final colors = Theme.of(context).colorScheme;

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
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Switch.adaptive(
              activeColor: colors.primary,
              value: isDarkMode,
              onChanged: (bool newValue) {
                context.read<ChatProvider>().updateDartMode(newValue);
              },
            ),
          ),
        ],
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
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messagesList.length,
                itemBuilder: (contex, index) {
                  final Message message = chatProvider.messagesList[index];
                  return (message.fromWho == FromWho.me)
                      ? MyMessagueBubble(
                          message: message,
                        )
                      : HerMessageBubble(
                          message: message,
                        );
                },
              ),
            ),
            MessageField(
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
