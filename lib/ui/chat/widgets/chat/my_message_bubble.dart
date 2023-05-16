import 'package:flutter/material.dart';

class MyMessagueBubble extends StatelessWidget {
  const MyMessagueBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 50,
          width: 300,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Text(
            'Ipsum dolor pariatur elit culpa nulla ',
            maxLines: 3,
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
