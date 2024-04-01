import 'package:flutter/material.dart';
import 'package:tarkov_price/api/requets.dart';



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final myController = TextEditingController();
  List<dynamic> filteredNames = shortName;

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
          backgroundColor: Colors.transparent,
          body:
          Column(
            children: [
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                        width: 250,
                        child: TextField(
                          controller: myController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "Item",
                          ),
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                  IconButton(onPressed: () {
                          int flag = 0;
                          String result = myController.text;
                          flag++;
                          setState(() {

                            if (flag == 1){
                              filteredNames = shortName.where((name) => name == result).toList();
                            }


                          });
                        }, icon: Icon(Icons.search))
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: List.generate(filteredNames.length, (index) => Column(
                      children: [
                        const SizedBox(height: 25,),
                        Button_item(name: filteredNames[index], price: low_price[index], update: updated[index],),  
                        const SizedBox(height: 25,),
                      ],
                    )),
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

  const Button_item({
    super.key,
    required this.name,
    required this.price,
    required this.update
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: 450,
    height: 150,
    child: ElevatedButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1),
        foregroundColor: const Color.fromRGBO(117, 117, 117, 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32))
        )
      ), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Row(
              children: [
                Text("$name", style: const TextStyle(color: Colors.white),),
                const SizedBox(width: 30,),
                const Text("Last Low Price: ",style: TextStyle(color: Colors.white),),
                Text('$price', style: const TextStyle(color: Colors.white)),
                const SizedBox(width: 30,),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              const Text("Last update: ", style: TextStyle(color: Colors.white), ),
              Text("$update", style: const TextStyle(color: Colors.white),),
              ],
            ),
          ],
        ),
      ),
    );
  }

}


