import 'package:flutter_svg/svg.dart';
import '../models/user.model.dart';
import 'cadastroScreen.dart';
import 'mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../classes.dart';

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
              SvgPicture.asset(
                "assets/icons/myeasyplan.svg",
                height: 80,
              ),
              SizedBox(
                height: 30,
              ),
              Text("LOGIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.deepOrangeAccent)),
              SizedBox(
                height: 30,
              ),
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
