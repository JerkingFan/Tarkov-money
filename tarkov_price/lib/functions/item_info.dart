
import 'package:flutter/material.dart';
import 'package:tarkov_price/api/requets.dart';
import 'package:tarkov_price/functions/sorting.dart';
import 'package:tarkov_price/functions/left_widgets.dart';
import 'package:tarkov_price/functions/button_item.dart';

class Item_Info_Page extends StatefulWidget {
  @override
  _Item_Info_PageState createState() => _Item_Info_PageState();
}

class _Item_Info_PageState extends State<Item_Info_Page> {
  final myController = TextEditingController();
  List<Item> filteredItems = [];
  bool _up = true;

  @override
  void initState() {
    super.initState();
    fetchItems(); // Вызываем метод для загрузки товаров из API
  }

  // Метод для загрузки товаров из API
  void fetchItems() async {
    try {
      final itemList = await fetchItemsFromAPI(); // Загружаем товары из API
      setState(() {
        filteredItems = itemList.items.where((item) => item.lowPrice != 0).toList(); // Сохраняем загруженные товары в состоянии
      });
    } catch (e) {
      print('Error fetching items: $e');
    }
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color.fromRGBO(28, 28, 28, 1),
              Color.fromRGBO(18, 18, 18, 1),
            ],
          ),
        ),
        child: Scaffold(appBar: AppBar(
          backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            decoration: const BoxDecoration(
                      color: Color.fromRGBO(28, 28, 28, 1),
                      borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            
          ),
        ),),
      ),
    );
  }
}

