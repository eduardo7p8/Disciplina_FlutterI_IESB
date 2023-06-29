import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SobreScreen extends StatelessWidget {
  final String email = 'eduardo.7p8@gmail.com';
  final String github = 'https://github.com/eduardo7p8';
  final String numeroContato = '(61)9 9319-2464';

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    final snackBar =
        const SnackBar(content: Text('Copiado para a área de transferência'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    bool githubCopied = false;
    bool emailCopied = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('icons/pngwing.com.png'),
                ),
                SizedBox(height: 16.0),
                const Text(
                  'Eduardo Alve Rodigues',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Analista Desenvolvedor',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {
                    copyToClipboard(context, numeroContato);
                    emailCopied = true;
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.phone),
                      const SizedBox(width: 8.0),
                      Text(
                        numeroContato,
                        style: TextStyle(
                          color: emailCopied ? Colors.green : null,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {
                    copyToClipboard(context, email);
                    emailCopied = true;
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.email),
                      const SizedBox(width: 8.0),
                      Text(
                        email,
                        style: TextStyle(
                          color: emailCopied ? Colors.green : null,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {
                    copyToClipboard(context, github);
                    githubCopied = true;
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.hub),
                      const SizedBox(width: 8.0),
                      Text(
                        github,
                        style: TextStyle(
                          color: githubCopied
                              ? Colors.green
                              : null, // Altera a cor do texto quando o link é copiado
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                        'Trabalho de conclusão da materia de flutter,\n Eduardo Alves Rodrigues\n	Matrícula: 2373171015\n Curso: Especialização em Aplicativos Móveis\n Matrícula: 2373171015 Série: 1\n Ano Letivo/Período: 2023/1'),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
