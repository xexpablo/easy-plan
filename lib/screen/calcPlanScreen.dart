import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste/models/Market.model.dart';
import '../classes.dart';
import 'dart:math';

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
                          valor = rng.nextDouble() + rng.nextInt(100);
                          preco.add(valor.toStringAsFixed(2));
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
