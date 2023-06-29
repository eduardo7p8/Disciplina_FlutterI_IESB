import 'package:flutter/material.dart';

class AppBarCuston extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarCuston({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(Icons.info),
          onPressed: () {
            Navigator.pushNamed(context, '/about');
          },
        ),
      ],
      // Personalize o AppBar conforme desejado, como definir uma cor de fundo, ícones, etc.
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
