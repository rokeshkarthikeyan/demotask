// Sample data for gold, silver, and platinum
import 'package:flutter/material.dart';

Map<String, dynamic> gold = {
  'name': 'Gold',
  'price': '1,999.00',
  'chngprcnt': '-0.4',
  'ltp': '0.0%',
  'color': Color.fromRGBO(248, 197, 15, 1),
  'hldngs': '22,265.64',
  'weight': '11.050'
};

Map<String, dynamic> silver = {
  'name': 'Silver',
  'price': '26.20',
  'chngprcnt': '-0.15',
  'ltp': '0.0%',
  'color': Color.fromRGBO(103, 103, 103, 1),
  'hldngs': '0.0',
  'weight': '0.000'
};

Map<String, dynamic> platinum = {
  'name': 'Platinum',
  'price': '1,102.30',
  'chngprcnt': '-0.08',
  'ltp': '0.0%',
  'color': Color.fromRGBO(232, 4, 245, 1),
  'hldngs': '0.0',
  'weight': '0.000'
};

// Combined map containing information of gold, silver, and platinum
Map<String, Map<String, dynamic>> metals = {
  'gold': gold,
  'silver': silver,
  'platinum': platinum,
};
