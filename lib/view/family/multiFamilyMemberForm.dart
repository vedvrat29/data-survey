import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umc_survey/emptyState.dart';
import 'package:umc_survey/models/user.dart';
import 'package:umc_survey/services/dbManager.dart';
import 'package:umc_survey/view/family/familyMemberForm.dart';

class MultiFamilyMemberForm extends StatefulWidget {
  @override
  _MultiFamilyMemberFormState createState() => _MultiFamilyMemberFormState();
}

class _MultiFamilyMemberFormState extends State<MultiFamilyMemberForm> {
  final DbManager dbmanager = new DbManager();
  List<FamilyMemberForm> users = [];
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
        title: Text('REGISTER USERS'),
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
        child: users.length <= 0
            ? Center(
                child: EmptyState(
                  title: 'Oops',
                  message: 'Add form by tapping add button below',
                ),
              )
            : ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount: users.length,
                itemBuilder: (_, i) => users[i],
              ),
      ),
      floatingActionButton: new Visibility( 
        // visible: _isVisible,
        child: new FloatingActionButton(
          onPressed: onAddForm,
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),     
      ),
    );
  }


   ///on form user deleted
  void onDelete(User _user) {
    setState(() {
      var find = users.firstWhere(
        (it) => it.user == _user,
        orElse: () => null,
      );
      if (find != null) users.removeAt(users.indexOf(find));
    });
  }

  ///on add form
  void onAddForm() {
    setState(() {
      _counter++;
      _isVisible = false;
      var _user = User();
      users.add(FamilyMemberForm(
        user: _user,
        onDelete: () => onDelete(_user),
        title: users.length == 0 ? "Family Head" : "Family member"
      ));
    });
  }

  ///on save forms
  void onSave() async{
    if (users.length > 0) {
      print("USers lenth");
      print(users.length);
      var allValid = true;
      users.forEach((form) => allValid = allValid && form.isValid());
      if (allValid) {
        var data = users.map((it) => it.user).toList();
        // print(data.runtimeType); 
        String jsonUser = jsonEncode(data);
        print(jsonUser.runtimeType);
        print(jsonUser);
        print("save data into local db...");
        // print(PersonDatabaseProvider.db.newUser(data[0]).runtimeType);
        for (var i = 0; i < data.length ; i++) {
          // print(data[i].date.runtimeType);
          print("save data into local db...");
          // print(PersonDatabaseProvider.db.newUser(data[0]).runtimeType);
          //  await PersonDatabaseProvider.db.newUser(data[0]).then((res) => print(res)).catchError((error) => print(error));
          // print(jsonUser);
          print("save data into local db...");
        }
      }
     
    }
    //  Navigator.of(context).push(
    //           MaterialPageRoute(
    //             builder: (BuildContext context)=>MultiVisitorForm()
    //             ),
    //         );
  }
}