import 'dart:convert';
import 'dart:math';

import 'models/user.model.dart';
import 'models/Market.model.dart';
import 'models/Travel.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validators/validators.dart' as validator;

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

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  User user = User();
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CampoForm(
                hintText: 'Email',
                isEmail: true,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Insira seu Email";
                  }
                  if (value.toString() != user.email) {
                    return "O Email não coincide com o cadastrado";
                  }
                  _formKey.currentState.save();
                  return null;
                },
              ),
              CampoForm(
                hintText: 'Senha',
                isPassword: true,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Insira sua Senha";
                  }
                  if (value.toString() != user.password) {
                    return "A Senha não coincide com o cadastrado";
                  }
                  _formKey.currentState.save();
                  return null;
                },
              ),
              Botoes(
                "Logar",
                100,
                () {
                  if (_formKey.currentState.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainMenu()),
                    );
                    _formKey.currentState.save();
                  }
                },
              ),
              Botoes(
                "Cadastrar",
                130,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cadastrar()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Cadastrar extends StatefulWidget {
  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  final _formKey = GlobalKey<FormState>();
  User user = User();
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: CampoForm(
                    hintText: "Primeiro Nome",
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Coloque seu Primeiro Nome";
                      }
                      _formKey.currentState.save();
                      return null;
                    },
                    onSaved: (String value) {
                      user.name = value;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: CampoForm(
                    hintText: "Sobrenome",
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Coloque seu Sobrenome";
                      }
                      _formKey.currentState.save();
                      return null;
                    },
                    onSaved: (String value) {
                      user.lastname = value;
                    },
                  ),
                ),
              ],
            ),
            CampoForm(
              hintText: "Email",
              isEmail: true,
              validator: (String value) {
                if (!validator.isEmail(value)) {
                  return "Coloque seu Email";
                }
                _formKey.currentState.save();
                return null;
              },
              onSaved: (String value) {
                user.email = value;
              },
            ),
            CampoForm(
              hintText: "Senha",
              isPassword: true,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Coloque sua Senha";
                }
                /*if (value.length < 7) {
                  return "Senha deve ter mais de 7 Caractéres";
                }*/
                _formKey.currentState.save();
                return null;
              },
              onSaved: (String value) {
                user.password = value;
              },
            ),
            CampoForm(
              hintText: "Confirmar Senha",
              isPassword: true,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Confirme sua Senha";
                }
                if (value.toString() != user.password) {
                  return "Senhas devem ser iguais!";
                }
                return null;
              },
            ),
            Botoes(
              "Cadastrar",
              130,
              () {
                if (_formKey.currentState.validate()) {
                  Navigator.pop(context);
                  _formKey.currentState.save();
                  user.idUser = user.idUser + 1;
                  print("ID " + (user.idUser).toString());
                  print("Nome " + user.name);
                  print("Sobrenome " + user.lastname);
                  print("Email " + user.email);
                  print("Senha " + user.password);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final _formKey = GlobalKey<FormState>();
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 100, top: 100),
                child: Botoes(
                  "Novo Planejamento",
                  200,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CriarPlano()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CriarPlano extends StatefulWidget {
  @override
  _CriarPlanoState createState() => _CriarPlanoState();
}

class _CriarPlanoState extends State<CriarPlano> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked1 = false;
  bool isChecked2 = false;
  Travel travel = Travel();
  Market market = Market();
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 50),
                child: CampoForm(
                  hintText: "Nome do Planejamento",
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Insira um nome para o Planejamento";
                    }
                    _formKey.currentState.save();
                    return null;
                  },
                  onSaved: (String value) {
                    if (isChecked1 == true) {
                      market.nameMarket = value;
                    }
                    if (isChecked2 == true) {
                      travel.nameTravel = value;
                    }
                  },
                ),
              ),
              Container(
                child: CampoForm(
                  hintText: "Seu Endereço (Mercado) / Local (Viagem)",
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Insira seu endereço";
                    }
                    _formKey.currentState.save();
                    return null;
                  },
                  onSaved: (String value) {
                    if (isChecked1 == true) {
                      market.adress = value;
                    }
                    if (isChecked2 == true) {
                      travel.location = value;
                    }
                  },
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 75),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: isChecked1,
                          onChanged: (newValue) {
                            setState(() {
                              if (isChecked2 != true) {
                                isChecked1 = !isChecked1;
                              }
                            });
                          },
                        ),
                        Text("Mercado"),
                        SizedBox(
                          width: 50,
                        ),
                        Checkbox(
                          value: isChecked2,
                          onChanged: (newValue) {
                            setState(() {
                              if (isChecked1 != true) {
                                isChecked2 = !isChecked2;
                              }
                            });
                          },
                        ),
                        Text("Viagem"),
                      ],
                    ),
                  ),
                ],
              ),
              Botoes(
                'Cadastrar Plano',
                150,
                () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    if (isChecked1 == true) {
                      market.idMarket = market.idMarket + 1;
                      print("ID " + (market.idMarket).toString());
                      print("Nome " + market.nameMarket);
                      print("Endereço " + market.adress);
                      List<PersonEntry> items = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CalcPlan()),
                      );
                      if (items != null) items.forEach(print);
                    }
                    if (isChecked2 == true) {
                      travel.idTravel = travel.idTravel + 1;
                      print("ID " + (travel.idTravel).toString());
                      print("Nome " + travel.nameTravel);
                      print("Endereço " + travel.location);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonEntry {
  final String item;

  PersonEntry(this.item);
  @override
  String toString() {
    return 'Item: name= $item';
  }
}

class CalcPlan extends StatefulWidget {
  @override
  _CalcPlanState createState() => _CalcPlanState();
}

class _CalcPlanState extends State<CalcPlan> {
  var itemTECs = <TextEditingController>[];
  var cards = <Card>[];
  Card createCard() {
    var itemController = TextEditingController();
    itemTECs.add(itemController);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: itemController,
            decoration: InputDecoration(
              labelText: 'Item ${cards.length + 1}',
              contentPadding: EdgeInsets.all(5),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    cards.add(createCard());
  }

  _onDone() {
    List<PersonEntry> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var item = itemTECs[i].text;
      entries.add(PersonEntry(item));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: cards.length,
                  itemBuilder: (BuildContext context, int index) {
                    return cards[index];
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(100),
                child: Column(
                  children: <Widget>[
                    Botoes(
                      'Calcular Planejamento',
                      200,
                      () {},
                    ),
                    Botoes(
                      "Adicionar Item",
                      130,
                      () => setState(() => cards.add(createCard())),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CampoForm extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;
  bool justRead = false;

  CampoForm({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
    this.justRead = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.all(15),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.grey[300],
          ),
          readOnly: justRead,
          obscureText: isPassword ? true : false,
          validator: validator,
          onSaved: onSaved,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
        ),
      ),
    );
  }
}

class Botoes extends StatelessWidget {
  final String text;
  final double width;
  final Function onPressed;
  Botoes([
    this.text,
    this.width,
    this.onPressed,
  ]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Container(
        width: width,
        height: 40,
        child: ElevatedButton(
          child: Text(text),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
