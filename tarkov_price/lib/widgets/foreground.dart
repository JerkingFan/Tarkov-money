import 'package:flutter/material.dart';
import 'package:tarkov_price/api/requets.dart';
import 'package:tarkov_price/functions/sorting.dart';
import 'package:tarkov_price/functions/left_widgets.dart';
import 'package:tarkov_price/functions/button_item.dart';

class Base_Page extends StatefulWidget {
  @override
  _Base_PageState createState() => _Base_PageState();
}

class _Base_PageState extends State<Base_Page> {
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
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                showModal(context, 'Page');
              },
              icon: const Icon(Icons.list),
              style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white)),
            ),
            title: const Text(
              "Search",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
            foregroundColor: const Color.fromRGBO(117, 117, 117, 1),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (_up) {
                        sortByAscendingPrice(filteredItems);
                        _up = false;
                      } else {
                        sortByDescendingPrice(filteredItems);
                        _up = true;
                      }
                    });
                  },
                  icon: Icon(Icons.sort))
            ],
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return Column(
                        children: [
                          SizedBox(height: 5),
                          ButtonItem(item: item),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

