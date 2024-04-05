import 'package:flutter/material.dart';
import 'package:tarkov_price/widgets/foreground.dart';
import 'package:tarkov_price/widgets/listview_medicine.dart';

void main() {
    runApp(MaterialApp(
    title: 'Your App',
    initialRoute: '/',
    routes: {
      '/': (context) => Base_Page(),
      '/medicine': (context) => Medicine(),
      // добавьте здесь другие маршруты, если необходимо
    },
  ));
}


