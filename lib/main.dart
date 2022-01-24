import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("TODOS LIST"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 400,
            height: 700,
            child: Image.asset('assets/images/todo.png', fit: BoxFit.cover),
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.75,
            builder: (BuildContext context, ScrollController scrollController){
              return
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
               decoration: BoxDecoration(
                     color: Colors.black,
                     borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))
               ),
                    child: ListView.builder(
                        itemBuilder: (context, index){
                          return ListTile(
                            title: Text("Task No $index", style: TextStyle(fontSize: 20, color: Colors.white),),
                            subtitle: Text("This is the Detail of Task No $index",style: TextStyle(fontSize: 15, color: Colors.white)),
                            trailing: Icon(Icons.check_circle, color: Colors.green,),
                            isThreeLine: true,
                          );
                        },
                        controller: scrollController,
                      itemCount: 21,
                    ),
              ),
                    Positioned(
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.add, color: Colors.white,),
                        backgroundColor: Colors.blueGrey,
                      ),
                      top: -25,
                      right: 40,
                    )
                  ],
                );
            },
          ),

        ],
      ),
    );
  }
}
