import 'package:flutter/material.dart';

class Question extends StatelessWidget {

  var myTextQuestion='';
  var myFirstChoice='';
  var mySecondChoice='';
  var myThirdChoice='';
  var myForthChoice = '';
  var myOnChanged;
  int myRadioGroup;
  int s1;
  int s2;
  int s3;
  int s4;

  Question(textquestion,firstchoice,secondchoice,thirdchoice,forthchoice
      ,score1,score2,score3,score4,radioGroup){
    myTextQuestion = textquestion;
    myFirstChoice = firstchoice;
    mySecondChoice = secondchoice;
    myThirdChoice = thirdchoice;
    myForthChoice = forthchoice;
   // myOnChanged = onchanged;
    myRadioGroup = radioGroup;
    s1 = score1;
    s2 = score2;
    s3 = score3;
    s4 = score4;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //here the backgroundColor will not be useful because of color of Material widget
      backgroundColor: Colors.black54,
      appBar:AppBar(
      ),
      body: Material(
        color: Colors.black54,
        child: Column(
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
                  Text(' $myTextQuestion',
                    style: TextStyle(color: Colors.white,fontSize: 20.0
                    ),
                  ),
                    ],
              ),
            ),
            RadioListTile(
              value: 1,
              title: Text(myFirstChoice,style: TextStyle(color: Colors.white,
              //    fontWeight: FontWeight.bold
              ),),
              //subtitle: Text('textquestion',style: TextStyle(color: Colors.black54),),
              activeColor: Colors.yellow,
              //The next property prefer to which group this radiolisttile follow
              groupValue: myRadioGroup,
              onChanged: myOnChanged,
            ),
            RadioListTile(
              value: 2,
              title: Text(mySecondChoice,style: TextStyle(color: Colors.white,
                 // fontWeight: FontWeight.bold
              ),),
              //subtitle: Text('textquestion',style: TextStyle(color: Colors.black54),),
              activeColor: Colors.yellow,
              groupValue: myRadioGroup,
              onChanged: myOnChanged,
              //secondary: Icon(Icons.accessibility_new),

            ),
            RadioListTile(
              value: 3,
              title: Text(myThirdChoice,style: TextStyle(color: Colors.white,
                  //fontWeight: FontWeight.bold
                ),),
              //subtitle: Text('textquestion',style: TextStyle(color: Colors.black54),),
              activeColor: Colors.yellow,
              groupValue: myRadioGroup,
              onChanged: myOnChanged,
            ),
            RadioListTile(
              value: 4,
              title: Text(myForthChoice,style: TextStyle(color: Colors.white,
                //  fontWeight: FontWeight.bold
              ),),
              //subtitle: Text('textquestion',style: TextStyle(color: Colors.black54),),
              activeColor: Colors.yellow,
              //The next property prefer to which group this radiolisttile follow
              groupValue: myRadioGroup,
              onChanged: (value){print(value);},
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(100.0),
                //I have to hide this button unless the user answer the question
                child: RaisedButton(
                  onPressed: (){print('jmbv');},
                  child: Text('Next',style: TextStyle(color: Colors.black54,
                      fontWeight: FontWeight.bold,fontSize: 19.0,
                  ),
                  ),
                  color: Colors.yellow,
                  //if I didn't put the onPressed property the button will be grey and cannot press
                 // onPressed:  (){Navigator.of(context).NEXT}
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
