import 'models/user.model.dart';
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
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 100, top: 300),
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
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 100),
                child: CampoForm(
                  hintText: "Nome do Planejamento",
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Insira um nome para o Planejamento";
                    }
                    _formKey.currentState.save();
                    return null;
                  },
                  onSaved: (String value) {},
                ),
              ),
              Container(
                child: CampoForm(
                  hintText: "Seu Endereço",
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Insira seu endereço";
                    }
                    _formKey.currentState.save();
                    return null;
                  },
                  onSaved: (String value) {},
                ),
              ),
              Row(
                children: <Widget>[
                  CheckBoxes(),
                ],
              ),
              Botoes(
                'Cadastrar Plano',
                150,
                () {
                  if (_formKey.currentState.validate()) {
                    Navigator.pop(context);
                    _formKey.currentState.save();
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

class CampoForm extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  CampoForm({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
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

class CheckBoxes extends StatelessWidget {
  bool _checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _checkbox,
      onChanged: (value) {},
    );
  }
}
