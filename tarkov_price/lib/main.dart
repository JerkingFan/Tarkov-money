import 'package:flutter/material.dart';
import 'package:tarkov_price/api/requets.dart';
import 'package:tarkov_price/widgets/ammo.dart';
import 'package:tarkov_price/widgets/body_armor.dart';
import 'package:tarkov_price/widgets/foreground.dart';
import 'package:tarkov_price/widgets/gun.dart';
import 'package:tarkov_price/widgets/headphones.dart';
import 'package:tarkov_price/widgets/keys.dart';
import 'package:tarkov_price/widgets/listview_medicine.dart';

void main() async{

    await main_();
    runApp(MaterialApp(
    title: 'Your App',
    initialRoute: '/',
    routes: {
      '/': (context) => Base_Page(),
      '/medicine': (context) => Medicine(),
      '/armor': (context) => Armor(),
      '/headphones': (context) => Headphones(),
      '/ammo' : (context) => Ammo(),
      '/gun' : (context) => Gun(),
      '/keys' : (context) => Keys(),
      // добавьте здесь другие маршруты, если необходимо
    },
  ));
}


