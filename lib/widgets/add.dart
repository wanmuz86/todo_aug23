import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
 var nameEditingController = TextEditingController();
 var descEditingController = TextEditingController();
 var placeEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add Page"),),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(decoration: InputDecoration(hintText: "Enter item name"),
                controller: nameEditingController,),
              TextField(decoration: InputDecoration(hintText: "Enter item description"),
                controller: descEditingController,),
              TextField( decoration: InputDecoration(hintText: "Enter item place"),
                controller: placeEditingController,),
              ElevatedButton(onPressed: (){
                print(nameEditingController.text);
                print(placeEditingController.text);
                print(descEditingController.text);

                var newItem = {
                  "name":nameEditingController.text,
                  "place":placeEditingController.text,
                  "desc":descEditingController.text
                };

                Navigator.pop(context, newItem);

              },
                  child: Text("Add new item"))
            ],
          ),
        )
    );
  }
}
