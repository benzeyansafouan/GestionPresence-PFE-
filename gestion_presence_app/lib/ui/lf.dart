import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flexible/flexible.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gestionpresenceapp/ui/ip.dart';

class Lf extends StatefulWidget {
  @override
  _LfState createState() => _LfState();
}

class _LfState extends State<Lf> {

  TextEditingController _rfid = new TextEditingController();
  TextEditingController _apogee = new TextEditingController();
  TextEditingController _nomComplet = new TextEditingController();
  TextEditingController _cne = new TextEditingController();
  TextEditingController _cin = new TextEditingController();
  TextEditingController _searchField = new TextEditingController();
//  String dropdownValue1 = 'Filière';
//  String dropdownValue2 = 'Matiere';

  String result = "";
  List r;



  Future  _scanQR()  async{
    try {
      var qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult.rawContent;
        r = result.split(";");
        _apogee.text = r[0].toString();
        _cin.text = r[1].toString();
        _cne.text = r[2].toString();
        _nomComplet.text = r[3].toString();
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown error $ex";
      });
    }
  }

   Future  _searchApogee() async {
    var alert = new AlertDialog(
      content: new Row(
        children: [
          new Expanded(
              child: TextField(
                controller: _searchField,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Search Student",
                  hintText: 'Apogee',
                  icon: Icon(Icons.search),
                ),
              )
          )
        ],
      ),
      actions: [

        new FlatButton(
            onPressed: ()=>Navigator.pop(context),
            child: Text("Cancel")),
        new FlatButton(
            onPressed: (){
              searchStudentLf();
              _searchField.clear();
              Navigator.pop(context);
            },
            child: Text("Search")
        ),
      ],
    );
    showDialog(context: context,
        builder: (BuildContext context){
          return alert;
        }
    );
  }




  Map<String ,String>listFilieresM= Map();
  String dropdownValue1 = null;
  List _listFilieres;

  void printFiliere()
  {
    for(var i=0;i<_listFilieres.length;i++)
    {
      listFilieresM[_listFilieres[i]['code_filiere']]=_listFilieres[i]['libelle_filiere'];
    }
    dropdownValue1=listFilieresM[_listFilieres[0]['code_filiere']];
  }

  Future<List> listFilieres() async {
    var resBody ;
    final response = await http.get("${Ip().getIp()}:8090/PFE/getFiliere.php");
    setState(() {
      resBody = json.decode(response.body);
      setState(() {
        _listFilieres = resBody['data'];
      });
    });
    printFiliere();
  }

  Map<String ,String>listMatieresM= Map();
  String dropdownValue2 = null;
  List _listMatieres;

  void printMatiere()
  {
    for(var i=0;i<_listMatieres.length;i++)
    {
      listMatieresM[_listMatieres[i]['code_matiere']]=_listMatieres[i]['libelle_matiere'];
    }
    dropdownValue2=listMatieresM[_listMatieres[0]['code_matiere']];
  }

  Future<List> listMatieres() async {
    var resBody ;
    final response = await http.get("${Ip().getIp()}:8090/PFE/getMatiere.php");
    setState(() {
      resBody = json.decode(response.body);
      setState(() {
        _listMatieres = resBody['data'];
      });
    });
    printMatiere();
  }

  @override
  void initState(){
    super.initState();
    listFilieres();
    listMatieres();
  }


  var checkRfid;
  Future<String> checkRfidLf() async{

    final response = await http.post("${Ip().getIp()}:8090/PFE/checkRfidLf.php", body: {
      "rfid": _rfid.text
    });
    setState(() {
      var resBody = json.decode(response.body);
      setState(() {
        checkRfid  = resBody['data'];
          print(checkRfid['prenom']);
          _apogee.text=checkRfid['code_apogee'];
          _cin.text=checkRfid['cin'];
          _cne.text=checkRfid['cne'];
          _nomComplet.text=checkRfid['nom']+" "+checkRfid['prenom'];
      });
    });
  }





  Future<String> saveExamLf() async{

    final response = await http.post("${Ip().getIp()}:8090/PFE/saveExamLf.php", body: {
      "apogee": _apogee.text,
      "matiere": dropdownValue2.toString()
    });
  }





  var _searchStudentLf;
  Future<String> searchStudentLf() async{

    final response = await http.post("${Ip().getIp()}:8090/PFE/serchStudentLf.php", body: {
      "apogee": _searchField.text
    });
    setState(() {
      var resBody = json.decode(response.body);
      setState(() {
        _searchStudentLf  = resBody['data'];
        if(_searchStudentLf != null){
        print(_searchStudentLf['prenom']);
        _rfid.text=_searchStudentLf['rfid'];
        _apogee.text=_searchStudentLf['code_apogee'];
        _cin.text=_searchStudentLf['cin'];
        _cne.text=_searchStudentLf['cne'];
        _nomComplet.text=_searchStudentLf['nom']+" "+_searchStudentLf['prenom'];
        }
        else {_rfid.text="Etudiant non trouvé";}
      });
    });
  }













@override
Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(
      title: Text("LF"),
      backgroundColor: Colors.blue,
      centerTitle: true,
      actions: [
        IconButton(icon: Icon(Icons.camera_alt), onPressed: _scanQR),
        IconButton(icon: Icon(Icons.search), onPressed: _searchApogee),
      ],
    ),
    body: ScreenFlexibleWidget(
      child: Builder(builder: (BuildContext context) {
        return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/backg1.jpeg"), fit: BoxFit.cover),
            ),
            child: ListView(children: [
              new Padding(padding: new EdgeInsets.all(3.0)),
              Image.asset(
                'images/logo2.png',
                width: 90.0,
                height: 90.0,
              ),
              new Padding(padding: new EdgeInsets.all(5.0)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
//                  Container(
//                      width: 200,
//                      decoration: new BoxDecoration(
//                          color: Colors.white70,
//                          borderRadius: new BorderRadius.only(
//                            topLeft: const Radius.circular(20.0),
//                            topRight: const Radius.circular(20.0),
//                            bottomLeft: const Radius.circular(20.0),
//                            bottomRight: const Radius.circular(20.0),
//                          )),
//                      child: Center(
//                          child: DropdownButton<String>(
//                            value: dropdownValue1,
//                            icon: Icon(
//                              Icons.arrow_downward,
//                              color: Colors.blue,
//                            ),
//                            iconSize: 24,
//                            elevation: 16,
//                            style: TextStyle(color: Colors.blue),
//                            underline: Container(
//                              height: 2,
//                              color: Colors.blue,
//                            ),
//                            onChanged: (String newValue) {
//
//                              setState(() {
//                                dropdownValue1 = newValue;
//                              });
//                            },
//                            items: listFilieresM.values
//                                .map<DropdownMenuItem<String>>((String value) {
//                              return DropdownMenuItem<String>(
//                                value: value,
//                                child: Text(value),
//                              );
//                            }).toList(),
//                          ))),
                  new Padding(padding: new EdgeInsets.all(3.0)),
                  Container(
                      width: 176,
                      decoration: new BoxDecoration(
                          color: Colors.white70,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(20.0),
                            topRight: const Radius.circular(20.0),
                            bottomLeft: const Radius.circular(20.0),
                            bottomRight: const Radius.circular(20.0),
                          )),
                      child: Center(
                          child: DropdownButton<String>(
                            value: dropdownValue2,
                            icon: Icon(
                              Icons.arrow_downward,
                              color: Colors.blue,
                            ),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.blue),
                            underline: Container(
                              height: 2,
                              color: Colors.blue,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue2 = newValue;
                              });
                            },
                            items: listMatieresM.values
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ))),
                  new Padding(padding: new EdgeInsets.all(3.0)),
                  Row(
                    children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: 50,
                    child: TextField(
                            enabled: true,
                            controller: _rfid,
                            decoration: new InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ),
//                          hintText: 'Numéro de la carte',
                                labelText: 'Numéro de la carte',
                                labelStyle: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
                                icon: new Icon(
                                  Icons.sim_card,
                                  color: Colors.blue,
                                  size: 35,
                                ))),

                      ),
                      Container(
                        padding: new EdgeInsets.only(left:7.5),
                        width:MediaQuery.of(context).size.width / 2.5-106,
                        height: 50,
                        child: RaisedButton(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                side: BorderSide(color: Colors.blue)),
                            onPressed: () {
                              debugPrint("starting..");
                              checkRfidLf();
                              debugPrint("end");
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width / 2.5-28,
                                child: Center(
                                    child: Icon(Icons.refresh,color: Colors.white,)))),
                      )
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(3.0)),
                  TextField(
                      enabled: false,
                      controller: _apogee,
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
//                          hintText: 'Apogee',
                          labelText: 'Apogee',
                          labelStyle: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
                          icon: new Icon(
                            Icons.credit_card,
                            color: Colors.blue,
                            size: 35,
                          ))),
                  new Padding(padding: new EdgeInsets.all(3.0)),
                  TextField(
                      enabled: false,
                      controller: _cin,
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
//                          hintText: 'CIN',
                          labelText: 'CIN',
                          labelStyle: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
                          icon: new Icon(
                            Icons.assignment_ind,
                            color: Colors.blue,
                            size: 35,
                          ))),
                  new Padding(padding: new EdgeInsets.all(3.0)),
                  TextField(
                      enabled: false,
                      controller: _cne,
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
//                          hintText: 'CNE',
                          labelText: 'CNE',
                          labelStyle: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
                          icon: new Icon(
                            Icons.school,
                            color: Colors.blue,
                            size: 35,
                          ))),
                  new Padding(padding: new EdgeInsets.all(3.0)),
                  TextField(
                      enabled: false,
                      controller: _nomComplet,
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(25.7),
                          ),
//                          hintText: 'Nom et Prènom',
                          labelText: 'Nom et Prènom',
                          labelStyle: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
                          icon: new Icon(
                            Icons.person,
                            color: Colors.blue,
                            size: 35,
                          ))),
                  new Padding(padding: new EdgeInsets.all(10.0)),
                  RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(color: Colors.blue)),
                      onPressed: () {
                        saveExamLf();

//                        _apogee.text = result;

//                        _apogee.text = r[0].toString();
//                        _nomComplet.text = r[1].toString();
//                        _cne.text = r[2].toString();
//                        _cin.text = r[3].toString();
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Center(
                              child: Text(
                                "Valider",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              ))))
                ],
              ),
            ]));
      }),
    ),
  );
}
}
