import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {

  var dataLength;
  var jsonData;
  int radioGroup = 0;
  int indexQues = 0;
  bool visibleButton = false;
  int score = 0;

  void radioEvent(int rValue ){
    setState(()  {
      radioGroup = rValue;
      visibleButton = true;
      print('radioGroup in radio $radioGroup');
    });
  }

   getDataScore() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    setState(() {
      score = prefs.getInt('score');
    });
  }

  incDataScore() async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    ++score;
    prefs.setInt('score', score);
  }

   @override
   void initState(){
    super.initState();
    getDataScore();
   }

  Map dataMap = {};
  
  @override
  Widget build(BuildContext context) {

    dataMap = ModalRoute.of(context).settings.arguments;
    dataMap = dataMap['myData'];

    return  Scaffold(
          backgroundColor: Colors.white54,
          //here the backgroundColor will not be useful because of color of Material widget
          /*backgroundColor: Colors.black54,*/
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
          onPressed: (){Navigator.pop(context);},
        ),
      ),
            body: SizedBox(
              child: Material(
                color: Colors.black54,
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(20.0),
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                //I wrap thw Text to the Row just to appear on left :)
                                children: <Widget>[
                                  Text('Question:',style: TextStyle(color: Colors.yellow,fontSize: 20.0
                                    //    fontWeight: FontWeight.bold
                                  ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              Text(dataMap["questions"][indexQues]["questionText"],
                                style: TextStyle(color: Colors.white,fontSize: 20.0
                                ),
                              ),
                            ],
                          ),
                        ),
                        RadioListTile(
                          value: 1,
                          title: Text(dataMap["questions"][indexQues]["answers"][0]["text"],
                            style: TextStyle(color: Colors.white,
                            //    fontWeight: FontWeight.bold
                          ),
                          ),
                          activeColor: Colors.yellow,
                          //The next property prefer to which group this radiolisttile follow
                          groupValue: radioGroup,
                          onChanged: radioEvent,
                        ),
                        RadioListTile(
                          value: 2,
                          title: Text(dataMap["questions"][indexQues]["answers"][1]["text"],
                            style: TextStyle(color: Colors.white,
                          ),),
                          activeColor: Colors.yellow,
                          groupValue: radioGroup,
                          onChanged: radioEvent,
                        ),
                        RadioListTile(
                          value: 3,
                          title: Text(dataMap["questions"][indexQues]["answers"][2]["text"],style: TextStyle(color: Colors.white,
                          ),
                          ),
                          activeColor: Colors.yellow,
                          groupValue: radioGroup,
                          onChanged: radioEvent,
                        ),
                        RadioListTile(
                          value: 4,
                          title: Text(dataMap["questions"][indexQues]["answers"][3]["text"],style: TextStyle(color: Colors.white,
                            //  fontWeight: FontWeight.bold
                          ),),
                          //subtitle: Text('textquestion',style: TextStyle(color: Colors.black54),),
                          activeColor: Colors.yellow,
                          //The next property prefer to which group this radiolisttile follow
                          groupValue: radioGroup,
                          onChanged: radioEvent,
                        ),
                      ],
                    ),
                    Visibility(
                      visible: visibleButton,
                      child:RaisedButton(
                              color: Colors.yellow,
                              onPressed: () async {
                                //I have to call getDataScore to refresh score value
                                 getDataScore();
                                print('score is $score');
                                if(dataMap["questions"][indexQues]["answers"][radioGroup-1]["score"] == 1)
                                {
                                  incDataScore();
                                }
                                if(indexQues == 3)
                                  {
                                    print('scorefinal is $score');
                                    showAboutDialog(context: context,
                                    children: <Widget>[

                                    ]
                                    );
                                   // Navigator.pop(context);
                                  }
                               else setState(() {
                                  if(indexQues < 3)
                                  {
                                   ++indexQues;
                                    visibleButton = false;
                                  }
                                });
                               radioGroup = 0 ;
                                },
                              child: Text('Next',style: TextStyle(color: Colors.black54,
                                fontWeight: FontWeight.bold,fontSize: 19.0,
                              ),
                              ),
                              //color: Colors.yellow,
                              //if I didn't put the onPressed property the button will be grey and cannot press
                              // onPressed:  (){Navigator.of(context).NEXT}
                            ),
                      ),
                  ],
                ),
              ),
            ),
    );
  }
  final dial = AboutDialog(

  );
}
//Container(
//                                        margin: EdgeInsets.only(right: 10.0),
//                                        child: IconButton(
//                                          icon: Icon(Icons.close),
//                                          onPressed: (){print('jhb');},
//                                          color: Colors.yellow,
//                                          iconSize: 40.0,
//                                          tooltip: "Close",
//                                        ),
//                                      ),