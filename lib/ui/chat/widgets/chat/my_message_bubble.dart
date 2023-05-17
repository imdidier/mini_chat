import 'package:flutter/material.dart';
import 'package:mini_chat/domain/entities/message.dart';

class MyMessagueBubble extends StatelessWidget {
  final Message message;
  const MyMessagueBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 35,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            message.text,
            maxLines: 3,
          ),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
