class TestModel {
  int id;
  String HouseNo;
  String BuildingName;
  // String Area;
  // String CampCode;
  // String WardCode;
  // int IsHeadOfFamily;
  // String NameOfMember;
  // double Age;
  // String AgeDetails;
  // String Sex;
  // int NoOfMembers;
  // String MobileNo;
  // String IsDiabatic;
  // String DiabaticUnderMedication;


  TestModel({this.id=0,this.HouseNo = '', this.BuildingName = '',
  //  this.Area='', this.CampCode = '', this.WardCode = '', this.IsHeadOfFamily=1,
  // this.NameOfMember='', this.Age=0, this.AgeDetails='', this.Sex='', this.NoOfMembers=0, this.MobileNo='', this.IsDiabatic='No', this.DiabaticUnderMedication=''
  });

   Map toJson() => {
        'id': id,
        'HouseNo': HouseNo,
        'BuildingName': BuildingName,
        // 'Area': Area,
        // 'CampCode': CampCode,
        // 'WardCode': WardCode,
        // 'IsHeadOfFamily': IsHeadOfFamily,
        // 'NameOfMember': NameOfMember,
        // 'Age': Age,
        // 'AgeDetails': AgeDetails,
        // 'Sex': Sex,
        // 'NoOfMembers': NoOfMembers,
        // 'MobileNo': MobileNo,
        // 'IsDiabatic': IsDiabatic,
        // 'DiabaticUnderMedication': DiabaticUnderMedication,
      };

      Map<String, dynamic> toMap() {
    return {
        'HouseNo': HouseNo,
        'BuildingName': BuildingName,
        // 'Area': Area,
        // 'CampCode': CampCode,
        // 'WardCode': WardCode,
        // 'IsHeadOfFamily': IsHeadOfFamily,
        // 'NameOfMember': NameOfMember,
        // 'Age': Age,
        // 'AgeDetails': AgeDetails,
        // 'Sex': Sex,
        // 'NoOfMembers': NoOfMembers,
        // 'MobileNo': MobileNo,
        // 'IsDiabatic': IsDiabatic,
        // 'DiabaticUnderMedication': DiabaticUnderMedication,
    };

  }
}
