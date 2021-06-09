import 'dart:math';

import '../models/Market.model.dart';
import '../models/Travel.model.dart';
import 'calcPlanScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../classes.dart';

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
                      travel.food = double.parse(
                          (Random().nextDouble() + Random().nextInt(50))
                              .toStringAsFixed(2));
                      travel.locomotion = double.parse(
                          (Random().nextDouble() + Random().nextInt(20))
                              .toStringAsFixed(2));
                      travel.locomotion = double.parse(
                          (Random().nextDouble() + Random().nextInt(500))
                              .toStringAsFixed(2));
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
