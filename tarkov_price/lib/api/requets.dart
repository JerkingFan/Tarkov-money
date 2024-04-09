import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class Item {
  final String name;
  final String shortName;
  final String updated;
  final List<String> types;
  final int lowPrice;
  final String imageLink;
  final int square;

  Item({
    required this.name,
    required this.shortName,
    required this.updated,
    required this.types,
    required this.lowPrice,
    required this.imageLink,
    required this.square,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    final square = (json['width'] * json['height']).toInt();
    final perSlot = (json['avg24hPrice'] ~/ square).toInt();
    return Item(
      name: json['name'],
      shortName: json['shortName'],
      updated: json['updated'],
      types: List<String>.from(json['types']),
      lowPrice: json['avg24hPrice'],
      imageLink: json['iconLink'],
      square: perSlot,
    );
  }
}

class ItemList {
  final List<Item> items;

  ItemList(this.items);

  factory ItemList.fromJson(List<dynamic> json) {
    return ItemList(json.map((item) => Item.fromJson(item)).toList());
  }
}

Future<ItemList> fetchItems() async {
  final response = await http.post(
    Uri.parse('https://api.tarkov.dev/graphql'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'query': '''
        {
            items {
                id
                name
                types
                shortName
                updated
                width
                height
                avg24hPrice
                iconLink
                updated
                sellFor {
                  price
                  source
                }
            }
        }
        ''',
    }),
  );

  if (response.statusCode == 200) {
    return ItemList.fromJson(jsonDecode(response.body)['data']['items']);
  } else {
    throw Exception('Failed to fetch items');
  }
}

Future<ItemList> fetchItemsFromAPI() async {
  final response = await http.post(
    Uri.parse('https://api.tarkov.dev/graphql'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'query': '''
        {
            items {
                id
                name
                types
                shortName
                updated
                width
                height
                avg24hPrice
                iconLink
                updated
                sellFor {
                  price
                  source
                }
            }
        }
        ''',
    }),
  );

  if (response.statusCode == 200) {
    return ItemList.fromJson(jsonDecode(response.body)['data']['items']);
  } else {
    throw Exception('Failed to fetch items');
  }
}

void writeJsonToFile(Map<String, dynamic> data, String fileName) {
  final file = File(fileName);
  file.writeAsStringSync(jsonEncode(data));
}


