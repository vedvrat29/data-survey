import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:umc_survey/models/visitor.dart';


class DbManager {

  Database _database;

  Future openDb() async {
      if(_database == null) {
      _database = await openDatabase(
        join(await getDatabasesPath(), "survey.db"),
        version: 1,
        onCreate: (Database db , int version) async {
          await db.execute("CREATE TABLE SurveyVisitorsData (id integer primary key AUTOINCREMENT, FamilyHeadSerialNo TEXT, Name TEXT, Age REAL, AgeDetails TEXT, Sex TEXT, IfUNRResident TEXT)");
        }
      );
    }
  }

  Future<int> insertVisitor(Visitor visitor) async{
    await openDb();
    return await _database.insert('SurveyVisitorsData', visitor.toMap());
  }

  Future<List<Visitor>> getVisitorList() async{
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('SurveyVisitorsData');
    // print('++++++name++++++');
    // print(maps[0]['Name']);
    // print('++++++name++++++');

    return List.generate(maps.length, (i) {
        return Visitor(
          id:maps[i]['id'],
          FamilyHeadSerialNo:maps[i]['FamilyHeadSerialNo'],
          Name:maps[i]['Name'],
          Age:maps[i]['Age'],
          AgeDetails:maps[i]['AgeDetails'],
          Sex:maps[i]['Sex'],
          IfUNRResident:maps[i]['IfUNRResident']
        );
    });

  }

  // Future<int> updatePerson(Visitor visitor) async{
  //   await openDb();
  //   return await _database.update(
  //     'SurveyVisitorsData', visitor.toMap(), where: "id = ?" , whereArgs:[visitor.id]);
  // }

  // Future<void> deletePerson(int id) async {
  //   await openDb();
  //   await _database.delete(
  //     'person', where: "id = ?", whereArgs: [id]
  //   );
  // }


}


