import 'package:flutter/material.dart';

class HerMessagueBubble extends StatelessWidget {
  const HerMessagueBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          width: 250,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Text(
            'Ipsum dolor pariatur elit culpa nulla ',
            maxLines: 3,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const _ImageBubble(),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://i1.sndcdn.com/artworks-l6LWYksUxAeSRDul-wt4vPQ-t500x500.jpg',
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
