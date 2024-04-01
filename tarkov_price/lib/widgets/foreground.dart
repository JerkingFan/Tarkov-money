import 'package:flutter/material.dart';
import 'package:tarkov_price/api/requets.dart';



class MyApp extends StatelessWidget {

  MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color.fromRGBO(163, 22, 33, 1),
              Color.fromRGBO(78, 128, 152, 1),
              Color.fromRGBO(252, 247, 248, 1),
            ],
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body:
          Column(
            children: [
              const SizedBox(height: 25,),
              const SizedBox(
                    width: 250,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: "Item",
                      ),
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
              const SizedBox(height: 25,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: shortName.take(10).map((number) => Column(
                      children: [
                        const SizedBox(height: 25,),
                        Button_item(number: number),  
                        const SizedBox(height: 25,),
                      ],
                    )).toList(),
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
  final String number;

  const Button_item({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: 250,
    height: 100,
    child: ElevatedButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(117, 117, 117, 1),
        foregroundColor: const Color.fromRGBO(117, 117, 117, 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32))
        )
      ), 
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text("$number", style: const TextStyle(color: Colors.white),),
              const SizedBox(width: 30,),
              Text('Avg', style: const TextStyle(color: Colors.white)),
              const SizedBox(width: 30,),
              Text('High', style: const TextStyle(color: Colors.white)),
            ],
          ),
          Row(
            children: [
              const Text("Last update:", style: TextStyle(color: Colors.white), ),
              Text("22-05-2022", style: const TextStyle(color: Colors.white),),
            ],
          ),
        ],
      ),
    ),
                      );
  }
}
