import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

Future<void> main() async {
  const String newQuery = '''
  {
      items {
          id
          name
          shortName
          updated
          lastLowPrice
      }
  }
  ''';

  var result = await runQuery(newQuery);
  print(result);
}

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
          shortName
          updated
          lastLowPrice
      }
  }
  ''';

  var result = await runQuery(newQuery);
  print(result);
  writeJsonToFile(result, 'output.json');
}