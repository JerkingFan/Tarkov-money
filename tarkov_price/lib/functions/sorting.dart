
import 'package:tarkov_price/api/requets.dart';

void sortByAscendingPrice(List<Item> filteredItems) {
  filteredItems.sort((a, b) => a.lowPrice.compareTo(b.lowPrice));
}

void sortByDescendingPrice(List<Item> filteredItems) {
  filteredItems.sort((a, b) => b.lowPrice.compareTo(a.lowPrice));
}

