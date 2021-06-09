import '../models/user.model.dart';
import '../classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validators/validators.dart' as validator;

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
              isVisible: true,
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
              isVisible: true,
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
