import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umc_survey/models/visitor.dart';
import 'package:umc_survey/services/dbManager.dart';

class ViewVisitors extends StatefulWidget {
  @override
  _ViewVisitorsState createState() => _ViewVisitorsState();
}

class _ViewVisitorsState extends State<ViewVisitors> {
  final DbManager dbmanager = new DbManager();
  List<Visitor> visitorList;
  Future _visitorFuture;


 @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async{
    final _userData = await dbmanager.getVisitorList();
    print("Length");
    print(_userData.length);
    print("Length");
    
    for (var i = 0; i < _userData.length ; i++) {
          // print(data[0].fullName = 'shantanu');
          print(_userData[i].id);
          print(_userData[i].FamilyHeadSerialNo);
          print(_userData[i].Name);
          print(_userData[i].Age);
          print(_userData[i].AgeDetails);
          // data.add();
          // print("save data into local db...");
        }
    return _userData;


  }

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Available Records')
      ),
      body:  FutureBuilder(
                  future: dbmanager.getVisitorList(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                        visitorList = snapshot.data;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: visitorList == null ? 0 : visitorList.length,
                          itemBuilder: (BuildContext context, int index){
                            Visitor vs = visitorList[index];
                            return Card(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    // width: width* 0.6,
                                    child: Column(
                                      children: <Widget>[
                                        Text("Id: ${vs.id}"),
                                        Text("Serial number: ${vs.FamilyHeadSerialNo}"),
                                        Text("Name: ${vs.Name}"),
                                        Text("Age: ${vs.Age}"),
                                        Text("Dob: ${vs.AgeDetails}"),
                                        Text("Sex: ${vs.Sex}"),
                                        Text("UMC residance: ${vs.IfUNRResident}"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                    }
                    return CircularProgressIndicator();
                  },
                )
   );
  }

}