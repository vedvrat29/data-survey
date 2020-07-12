import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:umc_survey/emptyState.dart';
import 'package:umc_survey/models/visitor.dart';
import 'package:umc_survey/services/dbManager.dart';
import 'package:umc_survey/viewVisitors.dart';
import 'package:umc_survey/view/visitor/visitorForm.dart';


class MultiVisitorForm extends StatefulWidget {
  @override
  _MultiVisitorFormState createState() => _MultiVisitorFormState();
}

class _MultiVisitorFormState extends State<MultiVisitorForm> {
  final DbManager dbmanager = new DbManager();
  List<VisitorForm> visitors = [];
  int _counter = 0;
  bool _isVisible = true; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        leading: Icon(
          Icons.wb_cloudy,
        ),
        title: Text('Register Visitors'),
        actions: <Widget>[
          FlatButton(
            child: Text('Save'),
            textColor: Colors.white,
            onPressed: onSave,
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF30C1FF),
              Color(0xFF2AA7DC),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: visitors.length <= 0
            ? Center(
                child: EmptyState(
                  title: 'Oops',
                  message: 'Add form by tapping add button below',
                ),
              )
            : ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount: visitors.length,
                itemBuilder: (_, i) => visitors[i],
              ),
      ),
      floatingActionButton: new Visibility( 
        // visible: _isVisible,
        child: new FloatingActionButton(
          onPressed: onAddVisitorForm,
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),     
      ),
      
    );
  }


  void onDeleteVisitor(Visitor _visitor) {
    setState(() {
      var find = visitors.firstWhere(
        (it) => it.visitor == _visitor,
        orElse: () => null,
      );
      if (find != null) visitors.removeAt(visitors.indexOf(find));
    });
  }

  //on visitor form 
  void onAddVisitorForm() {
    setState(() {

      var _visitor = Visitor();
      visitors.add(VisitorForm(
        visitor: _visitor,
        onDelete: () => onDeleteVisitor(_visitor),
        title: "Visitor Detials"
      ));

    });
  }

  ///on save forms
  void onSave() async{
    if (visitors.length > 0) {
      // print("USers lenth");
      // print(visitors.length);
      var allValid = true;
      visitors.forEach((form) => allValid = allValid && form.isValid());
      if (allValid) {
        var data = visitors.map((it) => it.visitor).toList();
        print(data.runtimeType); 
        String jsonUser = jsonEncode(data);
        print(jsonUser.runtimeType);
        print(jsonUser);
        print("save data into local db...");
          print('data lenght ${data.length}');
        for (var i = 0; i < data.length ; i++) {
          // print('Name ${data[i].FamilyHeadSerialNo}');
          // print('Name ${data[i].Name}');
          // print('Name ${data[i].Sex}');
          // print('Name ${data[i].Age}');
          // print('Name ${data[i].AgeDetails}');
          // print('Name ${data[i].IfUNRResident}');
          print("data type...............");
          print(data[i].runtimeType);
          print("data type...............");
          // data.add();
          print("save data into local db...");
          // await dbmanager.insertVisitor(data[i]).then((id) => {
          //   print('Visitor added into $id the db')
          // }); 
          print("save data into local db...");
        }
      }
     
    }
    //  Navigator.of(context).push(
    //           MaterialPageRoute(
    //             builder: (BuildContext context)=>ViewVisitors()
    //             ),
    //         );
  }
}
