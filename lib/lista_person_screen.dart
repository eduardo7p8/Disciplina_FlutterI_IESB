import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmortyapi_eduardo_alves_rodrigues/widgets/personagens.dart';
import 'package:rickandmortyapi_eduardo_alves_rodrigues/widgets/app_bar.dart';
import 'dart:convert';

import 'detalha_person_screen.dart';

class ListaPersonagensScreen extends StatefulWidget {
  @override
  _ListaPersonagensScreenState createState() => _ListaPersonagensScreenState();
}

class _ListaPersonagensScreenState extends State<ListaPersonagensScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCuston(title: 'Lista de Personagens'),

      body: FutureBuilder(
        future: _fetchCharacters(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar os dados'));
          } else {
            List characters = snapshot.data;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (BuildContext context, int index) {
                final character = characters[index];
                return CharacterItem(
                  name: character['name'],
                  imageUrl: character['image'],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CharacterDetailScreen(character: character),
                      ),
                    );
                  },
                );
              },
            );

          }
        },
      ),
    );
  }

  Future<List<dynamic>> _fetchCharacters() async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character?page=1'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data['results'];
    } else {
      throw Exception('Falha ao carregar os personagens');
    }
  }
}
