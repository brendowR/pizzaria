import 'package:flutter/material.dart';
import 'package:pizzaria/models/mpizza.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pizza> listaPizzas = [
    Pizza(
      nome: "Batata Frita",
      ingredientes: "Batata frita, molho de tomate, mussarela, azeitona",
      imagem: "images/pizzas/pizza_batata_frita.png",
    ),
    Pizza(
      nome: "Calabresa",
      ingredientes: "Calabresa, molho de tomate, mussarela, azeitona",
      imagem: "images/pizzas/pizza_calabresa.png",
    ),
    Pizza(
      nome: "Camarao",
      ingredientes: "Camarao, molho de tomate, mussarela, azeitona",
      imagem: "images/pizzas/pizza_camarao.png",
    ),
    Pizza(
      nome: "Frutos do mar",
      ingredientes: "Frutos do mar, molho de tomate, mussarela, azeitona",
      imagem: "images/pizzas/pizza_frutos_mar.png",
    ),
    Pizza(
      nome: "Manjericao",
      ingredientes: "Manjericao, molho de tomate, mussarela, azeitona",
      imagem: "images/pizzas/pizza_manjericao.png",
    ),
    Pizza(
      nome: "Mussarela",
      ingredientes: "molho de tomate, mussarela, azeitona",
      imagem: "images/pizzas/pizza_mussarela.png",
    ),
    Pizza(
      nome: "Portuguesa",
      ingredientes: "tomate, ovo, cebola, molho de tomate, mussarela, azeitona",
      imagem: "images/pizzas/pizza_portuguesa.png",
    ),
    Pizza(
      nome: "Strogonoff",
      ingredientes: "Strogonoff, molho de tomate, mussarela, azeitona",
      imagem: "images/pizzas/pizza_strogonoff.png",
    ),
  ];

  ListTile criarListTile(IconData icone, String texto) {
    return ListTile(
      leading: Icon(
        icone,
        color: Colors.white,
      ),
      title: Text(
        texto,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 186, 92),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.local_pizza),
            SizedBox(width: 5.0),
            Text("Ma'que Pizza"),
          ],
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: ListView.builder(
        itemCount: listaPizzas.length,
        itemBuilder: (context, int index) {
          print("Qual é o índce da pizza? ${listaPizzas[index].nome}? $index");
          return Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(listaPizzas[index].imagem),
                ),
                title: Text(listaPizzas[index].nome),
                subtitle: Text(listaPizzas[index].ingredientes),
              ),
              Divider(color:Colors.black),
            ],
          );
        },
      ),
      //Widget que serve para construir o menu "gaveta"
      //É o menu q aparece quando apertamos nos três barrinhas (hamburger);
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 30, 45, 62),
          child: Column(
            children: <Widget>[
              Container(
                color: Color.fromARGB(255, 38, 52, 69),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 140.0,
                      ),
                    ),
                    //É um botão que parece só um texto
                    //ou seja, não tem sombreamento
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 28.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //ListTile cria itens de lista
              //Pode ter ícones no começo e no fim de cada item
              //separamos em um método para ficar mais organizad
              criarListTile(Icons.list, "Cardápio"),
              criarListTile(Icons.local_drink, "Bebidas"),
              criarListTile(Icons.cake, "Sobremesas"),
              Divider(color: Colors.white),
              criarListTile(Icons.star, "Avalie o App"),
              criarListTile(Icons.info, "Sobre"),
              criarListTile(Icons.perm_phone_msg, "contato"),
              criarListTile(Icons.settings, "Configurações"),
            ],
          ),
        ),
      ),
    );
  }
}
