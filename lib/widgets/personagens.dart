import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onTap;

  const CharacterItem({
    required this.name,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return  Card(

      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
              SizedBox(width: 15),
              Text(
                name,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
