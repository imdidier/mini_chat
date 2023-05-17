import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mini_chat/config/helpers/get_yes_no_answer.dart';
import 'package:mini_chat/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer _getYesNoAnswer = GetYesNoAnswer();
  bool isDarkMode = false;
  final List<Message> messagesList = [];

  Future<void> sendMessage(String text) async {
    try {
      if (text.isEmpty) return;
      final Message newMessage = Message(text: text, fromWho: FromWho.me);
      messagesList.add(newMessage);
      if (text.endsWith('?')) {
        herReply();
      }

      notifyListeners();
      moveScrollBottom();
    } catch (e) {
      if (kDebugMode) {
        print('ChatProvider, sendMessge $e');
      }
    }
  }

  void moveScrollBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<void> herReply() async {
    final Message herMessage = await _getYesNoAnswer.getAnswer();
    messagesList.add(herMessage);
    notifyListeners();
    moveScrollBottom();
  }

  void updateDartMode(bool newValue) {
    isDarkMode = newValue;
    notifyListeners();
  }
}
