import 'package:flutter/material.dart';

class MessageField extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageField({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final TextEditingController newMessage = TextEditingController();
    final FocusNode focusNode = FocusNode();
    final outlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    );
    return TextFormField(
      focusNode: focusNode,
      controller: newMessage,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      decoration: InputDecoration(
        hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {
            final String textMessage = newMessage.text;
            onValue(textMessage);
            newMessage.clear();
          },
          icon: const Icon(Icons.send_outlined),
        ),
      ),
      onFieldSubmitted: (value) {
        newMessage.clear();
        onValue(value);
        focusNode.requestFocus();
      },
    );
  }
}
