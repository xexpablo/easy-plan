import 'dart:math';
import '../screen/calcPlanScreen.dart';

class Market {
  var rng = new Random();
  String nameMarket;
  int idMarket;
  String adress;
  List price = [];
  List item = [];
  Market({this.adress, this.idMarket = 0, this.nameMarket});
}
