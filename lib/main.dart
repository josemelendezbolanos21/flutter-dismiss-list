import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> items = List<String>.generate(30, (i) => "Items ${i+1}");

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Swipe to dismiss"),),
    body: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, int index) {
        return Dismissible(
          key: Key(items[index]),
          onDismissed: (direction){
            items.removeAt(index);
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Dismissed'),
              )
            );
          },
          background: Container(color: Colors.red),
          child: ListTile(
            title: Text("${items[index]}"),
          ),
        );
      },
    ),
  );
}