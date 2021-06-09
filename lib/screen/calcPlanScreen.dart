import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste/models/Market.model.dart';
import '../classes.dart';
import 'dart:math';

import 'createPlanScreen.dart';
import 'mainMenu.dart';

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
  final _formKey = GlobalKey<FormState>();
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    cards.add(createCard());
  }

  var rng = new Random();
  Market market = Market();
  double valor;
  List preco = [];
  List itens = [];
  var itemTECs = <TextEditingController>[];
  var cards = <Card>[];
  Card createCard() {
    var itemController = TextEditingController();
    itemTECs.add(itemController);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            validator: (String value) {
              /*if (value.isEmpty) {
                return "Insira um Item";
              }*/
              _formKey.currentState.save();
              return null;
            },
            onSaved: (String value) {
              itens.add(value);
            },
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
                      () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          market.price.clear();
                          market.item.clear();
                          market.price.add(preco);
                          market.item.add(itens);
                          for (int i = 0; i < cards.length; i++) {
                            valor = rng.nextDouble() + rng.nextInt(100);
                            preco.add(valor.toStringAsFixed(2));
                          }
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ),
                          );*/
                          print(market.price[0]);
                          print(market.item[0]);
                        }
                      },
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
