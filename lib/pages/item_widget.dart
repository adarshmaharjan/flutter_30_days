import 'package:flutter/material.dart';
// item
import 'package:flutter_application/models/catelog.dart';
// import "../models/catelog.dart";

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({required this.item, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          onTap: () {
            // print('Tapped');
          },
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$ ${item.price}",
            textScaleFactor: 1.5,
            style: const TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
