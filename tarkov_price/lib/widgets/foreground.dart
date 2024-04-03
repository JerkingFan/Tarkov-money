import 'package:flutter/material.dart';
import 'package:tarkov_price/api/requets.dart';
import 'package:jiffy/jiffy.dart';



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final myController = TextEditingController();
  List<dynamic> filteredNames = name;

  @override
  void dispose() {
    // Очистка ресурсов контроллера при удалении виджета
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
          )
        ),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){}, 
                                icon: const Icon(Icons.list), 
                                style: const ButtonStyle(
                                      foregroundColor: MaterialStatePropertyAll(Colors.white)),),
            title: const Text("Search", style: TextStyle(color: Colors.white),),
            backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
            foregroundColor: const Color.fromRGBO(117, 117, 117, 1),

            // actions: [
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       SizedBox(
            //             width: 250,
            //             child: TextField(
            //               enabled: false,
            //               enableInteractiveSelection: false,
            //               controller: myController,
            //               decoration: const InputDecoration(
            //                 border: OutlineInputBorder(),
            //                 hintStyle: TextStyle(color: Colors.white),
            //               ),
            //               style: const TextStyle(
            //                 color: Colors.white
            //               ),
            //             ),
            //           ),
            //       IconButton(onPressed: () {
            //               int flag = 0;
            //               String result = myController.text;
            //               flag++;
            //               setState(() {                
            //                 if (flag == 1){
            //                   filteredNames = shortName.where((name) => name == result).toList();
            //                 }
            //               });
            //             }, icon: Icon(Icons.search))
            //     ],
            //   ),
            // ],

          ),
          backgroundColor: Colors.transparent,
          body:
          Column(
            children: [
              const SizedBox(height: 25,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: filteredNames.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(height: 5),
                            Button_item(
                              name: filteredNames[index],
                              price: low_price[index],
                              update: updated[index],
                              image_link: image_link[index],
                              per_slot: square[index],
                            ),
                          ],
                        );
                      },
                    ),
                ),
              ),
            ],
          ) 
        )
      )
    );
  }
}

class Button_item extends StatelessWidget {
  final String name;
  final int price;
  final String update;
  final String image_link;
  final int per_slot;

  const Button_item({
    super.key,
    required this.name,
    required this.price,
    required this.update,
    required this.image_link,
    required this.per_slot,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: 450,
    height: 80,
    child: ElevatedButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1),
        foregroundColor: const Color.fromRGBO(117, 117, 117, 1),
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
        ),
      ), 
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Row(
  children: [
    Image.network("$image_link"),
    const SizedBox(width: 5),
    Expanded( // Заменяем Spacer на Expanded
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$name",
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 5,),
          Text(
            "Updated ${Jiffy.parse("$update").fromNow()}",
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('$price₽', style: const TextStyle(color: Colors.white, fontSize: 16)),
        Text("$per_slot₽/slot",
              style: TextStyle(fontSize: 12))
      ],
    ),
  ],
),


          ),
          ],
        ),
      ),
    );
  }
}


