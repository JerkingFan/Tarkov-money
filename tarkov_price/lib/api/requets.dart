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

  }
  print(types);


}

