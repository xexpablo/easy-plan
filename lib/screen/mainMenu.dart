import 'createPlanScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../classes.dart';

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
                padding: EdgeInsets.only(left: 105, top: 100),
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
