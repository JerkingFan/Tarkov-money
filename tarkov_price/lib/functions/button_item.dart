import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:tarkov_price/api/requets.dart';

class ButtonItem extends StatelessWidget {
  final Item item;

  const ButtonItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      height: 80,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(38, 38, 38, 1),
          foregroundColor: const Color.fromRGBO(117, 117, 117, 1),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Row(
                children: [
                  Image.network("${item.imageLink}"),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${item.name}",
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          "Updated ${Jiffy.parse("${item.updated}").fromNow()}",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${item.lowPrice}₽', style: const TextStyle(color: Colors.white, fontSize: 16)),
                      Text("${item.square}₽/slot",
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
