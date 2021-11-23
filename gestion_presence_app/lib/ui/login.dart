import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestionpresenceapp/ui/dashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:gestionpresenceapp/ui/ip.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
//  String _userName= "Safouan Benzeyan";
//  String _password= "Safouan123";



   _login(BuildContext contex) async {
    print("starting..");
//    ${Ip().getIp()}
//     http://192.168.1.14
    var response = await http.post("${Ip().getIp()}:8090/PFE/users.php", body: {
      "username": _usernameController.text,
      "password": _passwordController.text
    });
    var resBody = json.decode(response.body);
    if (resBody.length == 0){_loginFalse(contex);}
    else {
      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
      });
    }
    print(resBody);
    print("end..");

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Flexible(
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/backg1.jpeg"),fit: BoxFit.cover ),

                ),
                alignment: Alignment.center,
                padding: new EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      new Padding(padding: new EdgeInsets.all(80.0)),
                      Image.asset('images/logo2.png',width: 90.0,height: 90.0,),
                      new Padding(padding: new EdgeInsets.all(10.0)),
                      new TextField(
                          controller: _usernameController,
                          decoration: new InputDecoration(
                              filled: true,
                              fillColor: Colors.white,

                              border: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(25.7),
                              ),

                              hintText: 'UserName',
                              icon: new Icon(Icons.person,color: Colors.blue,))
                      ),
                      new Padding(padding: new EdgeInsets.all(10.0)),
                      new TextField(
                        controller: _passwordController,
                        decoration: new InputDecoration(
                            filled: true,
                            fillColor: Colors.white,

                            border: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(25.7),
                            ),
                            hintText: 'Password',
                            icon: new Icon(Icons.lock,color: Colors.blue,)),
                        obscureText: true,
                      ),
                      new Padding(padding: new EdgeInsets.all(18.0)),
                      new Builder(
                          builder: (context) =>
                              Center(
                                child: new RaisedButton(
                                  onPressed:(){
                                    _login(context);
//                                    _submit(context) ;
                                    },
                                  child: new Text("login".toUpperCase(),style: new TextStyle(color: Colors.white,fontSize: 20.0),),
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.blue)
                                  ),
                                ),
                              )
                      )
                    ],
                  )
                  ,)
            ),
          )
        ],
      ),
    );
  }

//  void _submit(BuildContext contex) {
//    setState(() {if(_usernameController.text == _userName && _passwordController.text == _password)
//    {
//      Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
//    }
//    else
//    {
//      _loginFalse(contex);
//
//    }
//    });
//  }


  void _loginFalse(BuildContext context) {

    final snackBar = new SnackBar(content: Text("Username or Password wrong"));
    Scaffold.of(context).showSnackBar(snackBar);

  }
}



