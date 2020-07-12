class Visitor {
  int id;
  String FamilyHeadSerialNo;
  String Name;
  double Age;
  String AgeDetails;
  String Sex;
  String IfUNRResident;


  Visitor({this.id=0,this.FamilyHeadSerialNo = '', this.Name = '', this.Age=0, this.AgeDetails = '', this.Sex = '', this.IfUNRResident=''});

   Map toJson() => {
        'id': id,
        'FamilyHeadSerialNo': FamilyHeadSerialNo,
        'Name': Name,
        'Age': Age,
        'AgeDetails': AgeDetails,
        'Sex': Sex,
        'IfUNRResident': IfUNRResident,
      };

      Map<String, dynamic> toMap() {
    return {
        'FamilyHeadSerialNo': FamilyHeadSerialNo,
        'Name': Name,
        'Age': Age,
        'AgeDetails': AgeDetails,
        'Sex': Sex,
        'IfUNRResident': IfUNRResident,
    };

  }
}
