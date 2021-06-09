import 'dart:math';
import '../screen/calcPlanScreen.dart';

class Market {
  var rng = new Random();
  String nameMarket;
  int idMarket;
  String adress;
  List price = [];
  Market({this.adress, this.idMarket = 0, this.nameMarket});
}

void price() {
  Market().price.add('');
}
