import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "dart:convert";
// models
import 'package:flutter_application/models/catelog.dart';
// item_widtet
import 'package:flutter_application/pages/item_widget.dart';
//drawer
import 'package:flutter_application/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // get json
    final catelogJson =
        await rootBundle.loadString("assets/files/catelog.json");
    // parse json
    var decocdeData = jsonDecode(catelogJson);
    // get proudt map data from json
    var productsData = decocdeData["products"];
    setState(() {
      // reinitilize catelog items
      CatelogModel.items = List.from(productsData)
          .map<Item>((item) => Item.fromMap(item))
          .toList();
    });
    print(CatelogModel.items);
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(10, (index) => CatelogModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatelogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = CatelogModel.items[index];

                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GridTile(
                      header: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.deepPurple,
                        ),
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: Image.network(item.image),
                      footer: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Text(
                          item.price.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: CatelogModel.items.length,
              )
            // ListView.builder(
            //     itemCount: CatelogModel.items.length,
            //     itemBuilder: (context, index) {
            //       return ItemWidget(
            //         item: CatelogModel.items[index],
            //       );
            //     },
            //   )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
