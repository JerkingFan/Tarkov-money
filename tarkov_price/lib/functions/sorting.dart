
import 'package:tarkov_price/api/requets.dart';

void sortByAscendingPrice() {
  List<Map<String, dynamic>> items = [];
  

  for (int i = 0; i < name.length; i++) {

    if (types[i] == 'meds'){
      items.add({
      'name': name[i],
      'shortName': shortName[i],
      'updated': updated[i],
      'low_price': low_price[i],
      'image_link': image_link[i],
      'square': square[i],
    });
    }
  }

  items.sort((a, b) => a['low_price'].compareTo(b['low_price']));

  // Обновление списков после сортировки
  name.clear();
  shortName.clear();
  updated.clear();
  low_price.clear();
  image_link.clear();
  square.clear();

  for (var item in items) {
    name.add(item['name']);
    shortName.add(item['shortName']);
    updated.add(item['updated']);
    low_price.add(item['low_price']);
    image_link.add(item['image_link']);
    square.add(item['square']);
  }
}

// Сортировка данных по убыванию цены
void sortByDescendingPrice() {
  List<Map<String, dynamic>> items = [];

  for (int i = 0; i < name.length; i++) {
    items.add({
      'name': name[i],
      'shortName': shortName[i],
      'updated': updated[i],
      'low_price': low_price[i],
      'image_link': image_link[i],
      'square': square[i],
    });
  }

  items.sort((a, b) => b['low_price'].compareTo(a['low_price']));

  // Обновление списков после сортировки
  name.clear();
  shortName.clear();
  updated.clear();
  low_price.clear();
  image_link.clear();
  square.clear();

  for (var item in items) {
    name.add(item['name']);
    shortName.add(item['shortName']);
    updated.add(item['updated']);
    low_price.add(item['low_price']);
    image_link.add(item['image_link']);
    square.add(item['square']);
  }
}