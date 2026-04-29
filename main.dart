import 'package:flutter/material.dart';

// Esse app é uma mimica do Spells5e, disponível na appstore

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.red,
        ),
        cardColor: Colors.grey[900],
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.red, fontSize: 22),
        ),
      ),
      home: ListaMagias()));
}

class ListaMagias extends StatelessWidget {
  final List<Map<String, dynamic>> magias = [
    {
      "nome": "Amizade",
      "nivel": "0",
      "tipo": "Cantrip",
      "escola": "Encantamento",
      "tags": ["BUFF", "Social"]
    },
    {
      "nome": "Ataque Certeiro",
      "nivel": "0",
      "tipo": "Cantrip",
      "escola": "Adivinhação",
      "tags": ["BUFF"]
    },
    {
      "nome": "Bordão Místico",
      "nivel": "0",
      "tipo": "Cantrip",
      "escola": "Transmutação",
      "tags": ["BUFF", "Damage"]
    },
    {
      "nome": "Chama Sagrada",
      "nivel": "0",
      "tipo": "Cantrip",
      "escola": "Evocação",
      "tags": ["Damage"]
    },
    {
      "nome": "Chicote Elétrico",
      "nivel": "0",
      "tipo": "Cantrip",
      "escola": "Evocação",
      "tags": ["Control", "Damage"]
    },
    {
      "nome": "Chicote de Espinhos",
      "nivel": "0",
      "tipo": "Cantrip",
      "escola": "Transmutação",
      "tags": ["Control", "Damage"]
    },
    {
      "nome": "Consertar",
      "nivel": "0",
      "tipo": "Cantrip",
      "escola": "Transmutação",
      "tags": ["Utility"]
    },
    {
      "nome": "Controlar Chamas",
      "nivel": "0",
      "tipo": "Cantrip",
      "escola": "Transmutação",
      "tags": ["Creation", "Damage"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.add_chart_rounded),
          onPressed: () {
            print("add personagem clicado");
          },
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: "Pesquisar...",
            border: InputBorder.none,
          ),
          onChanged: (value) {
            print("Digitando: $value");
          },// não funciona mas não precisa funcionar mesmo <3
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
              print("Filtro clicado");
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: magias.length,
        itemBuilder: (context, index) {
          final magia = magias[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.add_circle_outline_rounded),
              title: Text(magia["nome"]!),
              subtitle: Text(
                  "Nível: ${magia["nivel"]} • ${magia["tipo"]} • ${magia["escola"]}"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalheMagia(magia: magia),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetalheMagia extends StatelessWidget {
  final Map<String, dynamic> magia;

  DetalheMagia({required this.magia});

  @override
  Widget build(BuildContext context) {
    final List<String> tags = List<String>.from(magia["tags"] ?? []);

    return Scaffold(
      appBar: AppBar(title: Text(magia["nome"]!)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nível: ${magia["nivel"]}", style: TextStyle(fontSize: 25)),
            Text("Tipo: ${magia["tipo"]}", style: TextStyle(fontSize: 25)),
            Text("Escola: ${magia["escola"]}", style: TextStyle(fontSize: 25)),
            SizedBox(height: 20),

            Wrap(
              spacing: 8,
              children: tags.map((tag) {
                return Chip(
                  label: Text(tag),
                  backgroundColor: Colors.black,
                  labelStyle: TextStyle(color: Colors.white),
                );
              }).toList(),
            ),

            SizedBox(height: 20),
            Text(
              "Preguiça de botar pra todos mas ta funcionando-",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
