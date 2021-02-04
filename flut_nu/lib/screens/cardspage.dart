
import 'package:audioplayers/audio_cache.dart';
import 'package:chopper/chopper.dart';
import 'package:flutnu/data/numbersapiservice.dart' as numbersservice;
import 'package:flutnu/data/numbersmodel.dart';
import 'package:flutter/material.dart';

/* attribution - "multimedia_button_click_019.mp3" , “Sound effects obtained from https://www.zapsplat.com“ */

class CardsPage extends StatefulWidget {
  CardsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override CardsPageState createState() => CardsPageState();
}

class CardsPageState extends State<CardsPage> {
  final List<int> codes = <int>[100, 150, 200, 250, 300, 350, 400];
  AudioCache cache = new AudioCache();
  NumbersApi model = NumbersApi(null);

  void updateModel(Function update) => setState( () { model = update(); } );

  void updateCards(Future<Response> getCards(), Function update) async {
    update(() => NumbersApi(null));
    model.entries.clear();
    for(var i = 0; i < 5; i++){
      var card = await getCards();
      var response = NumbersModel.fromJson(card.body);
      model.entries.add(response.text);
      update(() => model);
    }
  }

  @override Widget build(BuildContext context) {
    return CardsPageUi.buildUi(
      context
      , widget.title
      , () => updateCards(numbersservice.NumbersApiService.create().getNumbers, (function) => updateModel(function))
      , model
      , cache
      , codes);
  }
}

class CardsPageUi{
  static buildUi(
      BuildContext context
      , String title
      , Function update
      , NumbersApi model
      , AudioCache cache
      , List<int> codes){
    return Scaffold(
      appBar: AppBar(
        title: Text(
            title,
            style: TextStyle(
                color: Colors.white
            )
        ),
        centerTitle: true,
        elevation: 11,
      ),
      body: Builder(builder: (context) =>
          Center(
              child: SizedBox(width: double.infinity, height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.entries.length,
                    itemBuilder: (BuildContext context, int index){
                      return Card(
                       color: Colors.blueAccent[codes[0]].withAlpha(10),
                       child: GestureDetector(
                          child: InkWell(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  RichText(text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: Helper().wrap("${model.entries[index]}")
                                            , style: TextStyle(color: Colors.red[codes[0]]
                                                , fontWeight: FontWeight.bold, fontSize: 30))
                                      ]
                                  ), textAlign: TextAlign.center),
                                  RichText(text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: Helper().wrapper("${model.entries[index]}")
                                          , style: TextStyle(
                                            color: Colors.purple[codes[0]],
                                            fontSize: 19,
                                          ))
                                      ]
                                  ), textAlign: TextAlign.start),
                                ],
                            ),
                            splashColor: Colors.red,
                            onTap: () {
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Enjoy the demo :)'
                                          , textAlign: TextAlign.center
                                          , style: TextStyle(fontSize: 12.0))
                                      , duration: Duration(seconds: 2)
                                      , backgroundColor: Colors.purple)
                              );
                            },
                          )
                       )
                        ,elevation: 11,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                  )
              )
          )
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {
            cache.play("sound/multimedia_button_click_019.mp3").whenComplete(update)
          },
          child: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(),
          elevation: 11
      )
    );
  }
}

class NumbersApi {
  NumbersApi(this.data);
  Object data;
  List<String> entries = <String>["","","","","",""];
}

class Helper {
  String wrapper(String s){
    String temp = "";
    int cnt = 0;
    for(var i = 0; i < s.length; i++){
      if(s[i] == " "){
        cnt++;
        if(cnt == 5){
          temp += "\n";
          cnt = 0;
        }
      }
      temp += s[i];
    }
    return temp;
  }

  String wrap(String s){
    int flag = 0;
    String temp = "";
    for(var i = 0; i < s.length; i++) {
      if (s[i] == " " && flag == 0) {
        temp = s.substring(0, i);
        flag++;
        break;
      }
    }
    return temp;
  }
}