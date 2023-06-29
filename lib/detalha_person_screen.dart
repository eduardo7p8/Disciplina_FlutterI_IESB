import 'package:flutter/material.dart';
import 'package:rickandmortyapi_eduardo_alves_rodrigues/widgets/especificacoes_personagen.dart';
import 'package:rickandmortyapi_eduardo_alves_rodrigues/widgets/app_bar.dart';

class CharacterDetailScreen extends StatelessWidget {
  final dynamic character;

  const CharacterDetailScreen({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCuston(title: 'Detalhes do Personagem'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(character['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              '${character['name']}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            CardEspecificacoes(
              imagePath: 'icons/especie.jpg',
              title: 'Especie',
              description: '${character['species']}',
            ),
            CardEspecificacoes(
              imagePath: 'icons/genero.jpg',
              title: 'Gênero',
              description: '${character['gender']}',
            ),
            CardEspecificacoes(
              imagePath: 'icons/origem.jpg',
              title: 'Origem',
              description: '${character['origin']['name']}',
            ),
            CardEspecificacoes(
              imagePath: 'icons/estadia.jpg',
              title: 'Estadia Atual',
              description: '${character['location']['name']}',
            ),
          ],
        ),
      ),
    );
  }
}
