import 'package:flutter/material.dart';
import 'package:flexible/flexible.dart';
import 'package:gestionpresenceapp/ui/lp.dart';
import 'package:gestionpresenceapp/ui/lf.dart';
import 'package:gestionpresenceapp/ui/master.dart';

class SecondPage extends StatefulWidget {

  @override
  _SecondPageState createState() => _SecondPageState();

  SecondPage();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Dashboard"),
          backgroundColor: Colors.blue,
        ),
        body:  ScreenFlexibleWidget(
            child: Builder(builder: (BuildContext context){
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/backg1.jpeg"),fit: BoxFit.cover ),

                ),
                width: flexible(context, 500.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Image.asset('images/logo2.png',width: 90.0,height: 90.0,),
                    ),
                    Flexible(
                        flex: 1,

                        child: RaisedButton(

                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                side: BorderSide(color: Colors.blue)
                            ),
                            onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => Lf()));},
                            child: Container(
                                width: MediaQuery.of(context).size.width / 1.5 ,
                                child: Center(child:  Text("LF",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),))
                            )
                        )
                    ),
                    new Padding(padding: new EdgeInsets.all(20.0)),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: RaisedButton(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                side: BorderSide(color: Colors.blue)
                            ),
                            onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => Lp()));} ,
                            child: Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Center(child:  Text("LP",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),))
                            )
                        )
                    ),
                    new Padding(padding: new EdgeInsets.all(20.0)),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: RaisedButton(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                side: BorderSide(color: Colors.blue)
                            ),
                            onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => Master()));},
                            child: Container(
                                width: MediaQuery.of(context).size.width / 1.5 ,
                                child: Center(child:  Text("MASTER",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),))
                            )
                        )
                    ),
                    new Padding(padding: new EdgeInsets.all(20.0)),
                  ],
                ),
              );
            })
        )

    );
  }
}




