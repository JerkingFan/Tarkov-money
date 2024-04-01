import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tarkov_price/api/requets.dart';
import 'package:tarkov_price/widgets/foreground.dart';

void main() {
  main_();
  final file = File('output.json');
  String contents = file.readAsStringSync();

  String jsonString = contents; // Ваш JSON-строка
  Map<String, dynamic> data = jsonDecode(jsonString);

  List name = [];
  List shortName = [];
  List updated = [];
  List low_price = [];

  // Теперь вы можете обращаться к данным как к словарю
  List<dynamic> items = data['data']['items'];
  for (var item in items) {

    name.add(item['name']);
    shortName.add(item['shortName']);
    updated.add(item['updated']);
    low_price.add(item['lastLowPrice']);

  }

  print(name);

  runApp(MaterialApp(home: MyApp(),));
  
}
