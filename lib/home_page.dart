import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getData()async{
Uri uri=Uri.parse("https://newsapi.org/v2/everything?q=tata&from=2021-09-09&sortBy=publishedAt&apiKey=51bb1eebe403432a8dcbd929e5569fe4"

);
Response response=await get(uri);
String jsonStr=response.body;
Map<String,dynamic> map=jsonDecode(jsonStr);
List<dynamic> articles=map['articles'];
for(int i=0;i<articles.length;i++){
  Map<String,dynamic> newsMap=articles[i];
  print('${newsMap['title']}');
  print("${newsMap["image"]}"
  );
}
print('$map');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(),
      body: Center(child:
        ElevatedButton(onPressed: (){getData();},
          child: Text('Submit'),)
        ,),
    );
  }
}
