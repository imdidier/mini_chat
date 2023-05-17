import 'package:flutter/material.dart';
import 'package:mini_chat/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 35,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            message.text,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(imageUrl: message.imageUrl!),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        height: 300,
        width: size.width * 0.6,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            height: 300,
            width: size.width * 0.6,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
