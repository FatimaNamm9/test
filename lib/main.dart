import 'package:flutter/material.dart';
import 'package:quiz_app/UIs/Questions.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        //When I set the next property with yallow ,I will not
        // need to wrap every TextField with a Theme widget and set
        // data: Theme.of(context).copyWith(primaryColor: Colors.yellow),
        primarySwatch: Colors.yellow,
        primaryColor: Colors.yellow,
        backgroundColor: Colors.black54
      ),
      home: MyHomePage(),
      routes: <String,WidgetBuilder>{
        '/Questions': (BuildContext context) => new Questions(),
      } ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var boolTextFieldName=true;
  var boolTextFieldPassword=true;
  var userInfo='User Info';
  final TextEditingController _firstNameController=new TextEditingController();
  final TextEditingController _lastNameController=new TextEditingController();
  final TextEditingController _nicknameController=new TextEditingController();
  final TextEditingController _ageController=new TextEditingController();

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }

  dynamic data;

  Future<String> loadJsonData() async {
    String jsonText = await rootBundle.loadString('assets/Json/questions.json');
    data = json.decode(jsonText);
    return data;
  }
  @override
  Widget build(BuildContext context){

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text('Q&A',
          style: TextStyle(color: Colors.black54,
              fontWeight: FontWeight.bold),
        ),
        elevation: 40.0,
      ),
      drawer: Drawer(
        child: Material(
          color: Color(0xFF464646),
          child: Container(
            margin: EdgeInsets.only(top: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                MaterialButton(
                  onPressed: (){},
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(right: 20.0),
                          child: IconButton(
                              icon: Icon(Icons.score),
                              onPressed: (){print('jhb');},
                              color: Colors.yellow,
                            iconSize: 40.0,
                            tooltip: "Score",
                              ),
                      ),
                      Text('Score',
                        style: TextStyle(
                           color: Colors.yellow,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: (){},
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 20.0),
                        child: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: (){print('jhb');},
                          color: Colors.yellow,
                          iconSize: 40.0,
                          tooltip: "Score",
                        ),
                      ),
                      Text('Edit Profile',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height ,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(20.0)),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40.0,0.0,40.0,0.0),
                          child: TextField(
                            controller: _firstNameController,
                            enabled: boolTextFieldName,
                            textAlign: TextAlign.center,
                            showCursor: true,
                            //scrollPhysics: ScrollPhysics(),
                            //obscureText hide the letters
                            obscureText: false,
                            textDirection: TextDirection.ltr,
                            autocorrect: true,
                            decoration: InputDecoration(
                              // hintText: '',
                              // hintStyle: TextStyle(color: Colors.white),
                              filled: true,
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow),
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              ),
                              focusColor: Colors.yellow,
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow),
                                borderRadius: BorderRadius.all(Radius.circular(50.0),),
                              ),
                              disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow),
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              ),
                              //hoverColor: Colors.yellow,
                              // fillColor: Colors.white70,
                             // icon: Icon(Icons.person,size: 40.0,color: Colors.yellow,),
                              labelText: 'First Name',
                              alignLabelWithHint: false,
                              labelStyle: TextStyle(color: Colors.white,fontSize: 20.0,
                              ),
                            ),
                            //Every single change in TextField will be printed,the function must has a one parameter
                            //the parameter will take the content of TextField
                            onChanged: (value) { setState(() {
                              print(value);
                            });
                            },
                            style: TextStyle(color: Colors.white,),
                            onSubmitted: (value){print('g');},
                          ),
                        ),
                      ),
                      // Padding(padding: EdgeInsets.all(10.0)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40.0,0.0,40.0,0.0),
                          child: TextField(
                            controller: _lastNameController,
                            enabled: boolTextFieldPassword,
                            textAlign: TextAlign.center,
                            showCursor: true,
                            //obscureText hide the letters
                            obscureText: true,
                            textDirection: TextDirection.ltr,
                            autocorrect: true,
                            decoration: InputDecoration(
                              //hintText: 'Hint Text',
                                hintStyle: TextStyle(color: Colors.white),
                                filled: true,
                                //fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow),
                                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                ),
                                focusColor: Colors.yellow,
                                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow),
                                  borderRadius: BorderRadius.all(Radius.circular(50.0),),
                                ),
                                disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow),
                                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                ),
                                // icon: Icon(Icons.lock,size: 40.0,color: Colors.yellow,),
                                labelText: 'Last Name',
                                alignLabelWithHint: false,
                                labelStyle: TextStyle(color: Colors.white,fontSize: 20.0,
                                )
                            ),
                            //Every single change in TextField will be printed,the function must has a one parameter
                            //the parameter will take the content of TextField
                            onChanged: (value) { setState(() {
                              print(value);
                            });
                            },
                            onSubmitted: (value){print('g');},
                            //
                          ),
                        ),
                      ),
                      // Padding(padding: EdgeInsets.all(10.0)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40.0,0.0,40.0,0.0),
                          child: TextField(
                            controller: _nicknameController,
                            enabled: boolTextFieldName,
                            textAlign: TextAlign.center,
                            showCursor: true,
                            //scrollPhysics: ScrollPhysics(),
                            //obscureText hide the letters
                            obscureText: false,
                            textDirection: TextDirection.ltr,
                            autocorrect: true,
                            decoration: InputDecoration(
                              // hintText: '',
                              // hintStyle: TextStyle(color: Colors.white),
                              filled: true,
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow),
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              ),
                              focusColor: Colors.yellow,
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow),
                                borderRadius: BorderRadius.all(Radius.circular(50.0),),
                              ),
                              disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow),
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              ),
                              //hoverColor: Colors.yellow,
                              // fillColor: Colors.white70,
                              //  icon: Icon(Icons.person,size: 40.0,color: Colors.yellow,),
                              labelText: 'Nick Name',
                              alignLabelWithHint: false,
                              labelStyle: TextStyle(color: Colors.white,fontSize: 20.0,
                              ),
                            ),
                            //Every single change in TextField will be printed,the function must has a one parameter
                            //the parameter will take the content of TextField
                            onChanged: (value) { setState(() {
                              print(value);
                            });
                            },
                            style: TextStyle(color: Colors.white,),
                            onSubmitted: (value){print('g');},
                          ),
                        ),
                      ),
                      // Padding(padding: EdgeInsets.all(10.0)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40.0,0.0,40.0,0.0),
                          child: TextField(

                            controller: _ageController,
                            enabled: boolTextFieldName,
                            textAlign: TextAlign.center,
                            showCursor: true,
                            //scrollPhysics: ScrollPhysics(),
                            //obscureText hide the letters
                            obscureText: false,
                            textDirection: TextDirection.ltr,
                            autocorrect: true,
                            decoration: InputDecoration(
                              // hintText: '',
                              // hintStyle: TextStyle(color: Colors.white),
                              filled: true,
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow),
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              ),
                              focusColor: Colors.yellow,
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow),
                                borderRadius: BorderRadius.all(Radius.circular(50.0),),
                              ),
                              disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow),
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              ),
                              //hoverColor: Colors.yellow,
                              // fillColor: Colors.white70,
                              // icon: Icon(Icons.age,size: 40.0,color: Colors.yellow,),
                              labelText: 'Age',
                              alignLabelWithHint: false,
                              labelStyle: TextStyle(color: Colors.white,fontSize: 20.0,
                              ),
                            ),
                            //Every single change in TextField will be printed,the function must has a one parameter
                            //the parameter will take the content of TextField
                            onChanged: (value) { setState(() {
                              print(value);
                            });
                            },
                            style: TextStyle(color: Colors.white,),
                            onSubmitted: (value){print('g');},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Padding(padding: EdgeInsets.all(10.0)),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40.0,0.0,20.0,0.0),
                            child: RaisedButton(
                                textTheme: ButtonTextTheme.accent,
                              child: Text('Submit',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 19.0),),
                                color: Colors.yellow,
                                //if I didn't put the onPressed property the button will be grey and cannot press
                              onPressed: () {setState(()
                              {
                                if(_firstNameController.text.trim().isEmpty && _lastNameController.text.trim().isEmpty
                                && _nicknameController.text.trim().isEmpty && _ageController.text.trim().isEmpty) {
                                  userInfo='Please fill information';
                                  //print(data.toString());
                                }
                                else{userInfo='Welcome ${_firstNameController.text}';}
                              });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40.0,0.0,40.0,0.0),
                            child: RaisedButton(
                              textTheme: ButtonTextTheme.accent,
                              child: Text('Take Quiz',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 19.0),),
                              color: Colors.yellow,
                              //if I didn't put the onPressed property the button will be grey and cannot press
                              onPressed: (){
                                if(_firstNameController.text.isEmpty || _lastNameController.text.isEmpty
                                && _nicknameController.text.isEmpty || _ageController.text.isEmpty)
                                ;//message
                                else {
                                  //Navigator.of(context).pushNamed('/ClsQuestions',);
                                  Navigator.pushNamed(context, '/Questions',arguments: {
                                    'myData':data,
                                  });
                                   }
                                },
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(Icons.clear_all),
                              color: Colors.yellow,
                              onPressed:() {setState(() {
                                _firstNameController.clear();
                                _lastNameController.clear();
                                _nicknameController.clear();
                                _ageController.clear();
                              }
                              );
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(userInfo,style: TextStyle(color: Colors.yellow,fontSize: 15.0),),
                      ),
                    ],
                  ),
                ),
              //  Padding(padding: EdgeInsets.all(8.0)),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}