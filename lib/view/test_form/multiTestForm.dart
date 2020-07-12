import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:umc_survey/emptyState.dart';
import 'package:umc_survey/models/testModel.dart';
import 'package:umc_survey/services/dbManager.dart';
import 'package:umc_survey/view/test_form/testForm.dart';

class MultiTestForm extends StatefulWidget {
  @override
  _MultiTestFormState createState() => _MultiTestFormState();
}

class _MultiTestFormState extends State<MultiTestForm> {

  final DbManager dbmanager = new DbManager();
  List<TestForm> testForm = [];
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
        child: testForm.length <= 0
            ? Center(
                child: EmptyState(
                  title: 'Oops',
                  message: 'Add form by tapping add button below',
                ),
              )
            : ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount: testForm.length,
                itemBuilder: (_, i) => testForm[i],
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

    void onDeleteVisitor(TestModel _testForm) {
    setState(() {
      var find = testForm.firstWhere(
        (it) => it.testModel == _testForm,
        orElse: () => null,
      );
      if (find != null) testForm.removeAt(testForm.indexOf(find));
    });
  }

  //on visitor form 
  void onAddVisitorForm() {
    setState(() {

      var _visitor = TestModel();
      testForm.add(TestForm(
        testModel: _visitor,
        onDelete: () => onDeleteVisitor(_visitor),
        title: "test Details"
      ));

    });
  }

  ///on save forms
  void onSave() async{
    if (testForm.length > 0) {
      var allValid = true;
      testForm.forEach((form) => allValid = allValid && form.isValid());
      if (allValid) {
        var data = testForm.map((it) => it.testModel).toList();
        print(data.runtimeType); 
        String jsonUser = jsonEncode(data);
        print(jsonUser.runtimeType);
        print(jsonUser);
        // print("save data into local db..."); 
          print('data lenght ${data.length}');
        // for (var i = 0; i < data.length ; i++) {
          // print("data type...............");
          // print(data[i].runtimeType);
          // print("data type...............");
          // data.add();
          // print("save data into local db...");
          // await dbmanager.insertVisitor(data[i]).then((id) => {
          //   print('Visitor added into $id the db')
          // }); 
          // print("save data into local db...");
        // }
      }
     
    }
    //  Navigator.of(context).push(
    //           MaterialPageRoute(
    //             builder: (BuildContext context)=>ViewVisitors()
    //             ),
    //         );
  }



}