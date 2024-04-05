  import 'package:flutter/material.dart';


void showModal(BuildContext context, String modalTitle) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height,
            child: Scaffold(
              backgroundColor: const Color.fromRGBO(38, 38, 38, 1),
              appBar: AppBar(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromRGBO(38, 38, 38, 1) ,
                title: const Text("Tarkov Helper", style: TextStyle(color: Colors.white),),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, '/medicine'); // Переход на страницу Medicine при нажатии
                  }, child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.medication, color: Colors.white ,),
                        Spacer(),
                        Text("Medicine", style: TextStyle(color: Colors.white),),
                        Spacer(),
                      ],
                    ),
                  )),
                  
                  TextButton(onPressed: (){}, 
                  style: const ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Color.fromRGBO(117, 117, 117, 1),)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.shield, color: Colors.white ,),
                        Spacer(),
                        Text("Body armor", style: TextStyle(color: Colors.white),),
                        Spacer(),
                      ],
                    ),
                  )),
                  TextButton(onPressed: (){}, child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.headphones, color: Colors.white ,),
                        Spacer(),
                        Text("Tactical Headphones", style: TextStyle(color: Colors.white),),
                        Spacer(),
                      ],
                    ),
                  )),

                ],
              ),
            ),
          ),
        );
      },
    );
  }