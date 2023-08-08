import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  final Map<String,dynamic> item;

 DetailPage({required this.item});



  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text("Detail Page"),),
        body:Center(
          child: Column(
            children: [
              Text(item["name"]!),
              Text(item["desc"]!),
              Text(item["place"]!),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){

                    Navigator.pop(context,{"code":1, "item":item});

                  }, child: Text("Mark as completed")),
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context,{"code":2, "item":item});

                  }, child: Text("Delete item")),
                ],
              )
            ],
          ),
        )
    );
  }
}
