import 'package:flutter/material.dart';
import 'package:teste/Data/Database.dart';

import '../Models/Market.model.dart';

class MarketsProvider with ChangeNotifier {
  final Map<String, Market> items = {...dataMarket};
}
