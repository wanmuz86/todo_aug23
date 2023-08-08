import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_app/widgets/detail.dart';
import 'add.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _todos = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var itemsString = prefs.getString("todos");
    if (itemsString != null){
      setState(() {
        _todos = jsonDecode(itemsString);
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"), actions: [
        IconButton(onPressed: () async {


          var newItem = await Navigator.push(context,
          MaterialPageRoute(builder: (context)=>AddPage())
          );
          if (newItem != null){
            _todos.add(newItem);
            // Retrieve the shared preference (as if I'm doing File on words, excel...)
            final SharedPreferences prefs  = await SharedPreferences.getInstance();
            // Shared Preference only allow you to save as String, Numbers , boolean or List of String
            // Our data type is list of Map
            // We transform our List of Map into String, before saving it using jsonEncode
            var listString = jsonEncode(_todos);
            prefs.setString("todos", listString);
            setState(() {
              _todos;
            });
          }

        }, icon: Icon(Icons.add))
      ],),
      body:ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _todos.length,  // number of items in the list
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(_todos[index]["name"]!),
                subtitle: Text(_todos[index]["place"]!),
                trailing: Icon(Icons.chevron_right),
                onTap: () async {
                  // Navigate to detail page
                  var item = await Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>DetailPage(item:_todos[index])));
                  if (item != null){
                    if (item["code"] == 1){
                      // TODO as homework
                    } else if (item["code"]==2) {
                      _todos.remove(item["item"]);
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString("todos", jsonEncode(_todos));
                      setState(() {
                        _todos;
                      });
                    }
                  }


                },
              ),
            );
          }
      )
    );
  }
}
