import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Plan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Insira as Informações e Clique no botão para Logar!"),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.only(left: 70, right: 70),
              width: 500,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Email de Login",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 70, right: 70),
              width: 500,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Senha",
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 100,
              child: ElevatedButton(
                child: Text("Entrar"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenu()),
                  );
                },
              ),
            ),
            Container(
              width: 100,
              child: ElevatedButton(
                child: Text("Cadastrar"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Registrar()),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

class Registrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Insira as Informações e Clique no botão para Registrar!"),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.only(left: 70, right: 70),
            width: 500,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Insira seu Email",
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 70, right: 70),
            width: 500,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Insira uma Senha",
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 100,
            child: ElevatedButton(
              child: Text("Cadastrar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sejá Bem-Vindo ao Easy Plan"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 100, top: 300),
            width: 300,
            child: ElevatedButton(
              child: Text("Novo Planejamento"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPlan()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NewPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sejá Bem-Vindo ao Easy Plan"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[],
      ),
    );
  }
}
