import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

final List name = [];
final List shortName = [];
final List updated = [];
final List low_price = [];
final List image_link = [];
final List square = [];
final List types = [];

final List name_med = [];
final List shortName_med = [];
final List updated_med = [];
final List low_price_med = [];
final List image_link_med = [];
final List square_med = [];
final List types_med = [];

final List name_armor = [];
final List shortName_armor = [];
final List updated_armor = [];
final List low_price_armor = [];
final List image_link_armor = [];
final List square_armor = [];
final List types_armor = [];

final List name_headphones = [];
final List shortName_headphones = [];
final List updated_headphones = [];
final List low_price_headphones = [];
final List image_link_headphones = [];
final List square_headphones = [];
final List types_headphones = [];

final List name_ammo = [];
final List shortName_ammo = [];
final List updated_ammo = [];
final List low_price_ammo = [];
final List image_link_ammo = [];
final List square_ammo = [];
final List types_ammo = [];

final List name_gun = [];
final List shortName_gun = [];
final List updated_gun = [];
final List low_price_gun = [];
final List image_link_gun = [];
final List square_gun = [];
final List types_gun = [];

final List name_keys = [];
final List shortName_keys = [];
final List updated_keys = [];
final List low_price_keys = [];
final List image_link_keys = [];
final List square_keys = [];
final List types_keys = [];

int _square = 0;
int per_slot = 0;


Future<Map<String, dynamic>> runQuery(String query) async {
  final response = await http.post(
    Uri.parse('https://api.tarkov.dev/graphql'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'query': query,
    }),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Query failed to run with a status code of ${response.statusCode}. $query');
  }
}



void writeJsonToFile(Map<String, dynamic> data, String fileName) {
  final file = File(fileName);
  file.writeAsStringSync(jsonEncode(data));
}

Future<void> main_() async {
  const String newQuery = '''
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
  ''';

  var result = await runQuery(newQuery);
  writeJsonToFile(result, 'output.json');

  final file = File('output.json');
  String contents = file.readAsStringSync();

  String jsonString = contents; // Ваш JSON-строка
  Map<String, dynamic> data = jsonDecode(jsonString);

  // Теперь вы можете обращаться к данным как к словарю
  List<dynamic> items = data['data']['items'];
  for (var item in items) {

    if (item['avg24hPrice'] != 0){

      _square = item['width'] * item['height'];
      per_slot = (item['avg24hPrice'] ~/ _square).toInt();
      name.add(item['name']);
      shortName.add(item['shortName']);
      updated.add(item['updated']);
      types.add(item['types']);
      low_price.add(item['avg24hPrice']);
      image_link.add(item['iconLink']);
      square.add(per_slot);

    }
    else{
      continue;
    }

    if (item['types'].contains('meds')){

      _square = item['width'] * item['height'];
      per_slot = (item['avg24hPrice'] ~/ _square).toInt();
      name_med.add(item['name']);
      shortName_med.add(item['shortName']);
      updated_med.add(item['updated']);
      types_med.add(item['types']);
      low_price_med.add(item['avg24hPrice']);
      image_link_med.add(item['iconLink']);
      square_med.add(per_slot);

    }
    else{
      if (item['types'].contains("armor")){

          _square = item['width'] * item['height'];
          per_slot = (item['avg24hPrice'] ~/ _square).toInt();
          name_armor.add(item['name']);
          shortName_armor.add(item['shortName']);
          updated_armor.add(item['updated']);
          types_armor.add(item['types']);
          low_price_armor.add(item['avg24hPrice']);
          image_link_armor.add(item['iconLink']);
          square_armor.add(per_slot);

    }
    else{
        if (item['types'].contains("headphones")){

          _square = item['width'] * item['height'];
          per_slot = (item['avg24hPrice'] ~/ _square).toInt();
          name_headphones.add(item['name']);
          shortName_headphones.add(item['shortName']);
          updated_headphones.add(item['updated']);
          types_headphones.add(item['types']);
          low_price_headphones.add(item['avg24hPrice']);
          image_link_headphones.add(item['iconLink']);
          square_headphones.add(per_slot);

    }
    else{
        if (item['types'].contains("ammo") && !item['types'].contains("grenade") ){

          _square = item['width'] * item['height'];
          per_slot = (item['avg24hPrice'] ~/ _square).toInt();
          name_ammo.add(item['name']);
          shortName_ammo.add(item['shortName']);
          updated_ammo.add(item['updated']);
          types_ammo.add(item['types']);
          low_price_ammo.add(item['avg24hPrice']);
          image_link_ammo.add(item['iconLink']);
          square_ammo.add(per_slot);

    }
    else{
        if (item['types'].contains("gun") ){

          _square = item['width'] * item['height'];
          per_slot = (item['avg24hPrice'] ~/ _square).toInt();
          name_gun.add(item['name']);
          shortName_gun.add(item['shortName']);
          updated_gun.add(item['updated']);
          types_gun.add(item['types']);
          low_price_gun.add(item['avg24hPrice']);
          image_link_gun.add(item['iconLink']);
          square_gun.add(per_slot);

    }
    else{
        if (item['types'].contains("keys") ){

          _square = item['width'] * item['height'];
          per_slot = (item['avg24hPrice'] ~/ _square).toInt();
          name_keys.add(item['name']);
          shortName_keys.add(item['shortName']);
          updated_keys.add(item['updated']);
          types_keys.add(item['types']);
          low_price_keys.add(item['avg24hPrice']);
          image_link_keys.add(item['iconLink']);
          square_keys.add(per_slot);

    }
    }
    }
    }
    }
    }

  }
  //print(types);


}

