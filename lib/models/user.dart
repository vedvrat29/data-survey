class User {
  // String fullName;
  // String email;
  // String phone;
  // String date;
  String HouseNo;
  String BuildingName;
  String Area;
  String CampCode;
  String WardCode;
  int IsHeadOfFamily;
  String NameOfMember;
  double Age;
  String AgeDetails;
  String Sex;
  int NoOfMembers;
  String MobileNo;
  String IsDiabatic;
  String DiabaticUnderMedication;
  String IsHypertension;
  double BPHigh;
  double BPLow;
  String IsHeartDisease;
  String HearthDiseaseMedication;
  String IsKidneyDisease;
  String KidneyDiseaseMedication;
  String TB;
  String TBMedication;
  String HIV;
  String HIVMedication;
  String Leprosy;
  String LeprosyMedication;
  String Fits;
  String FitsMedication;
  String IsPregnant;
  String EstDueDate;
  String Cough;
  String CoughType;
  String Fever;
  double FeverSinceDays;
  String DifficultyInBreathing;
  double DifficultyInBreathingSinceDays;
  String LossOfTaste;
  double LossOfTasteSinceDays;
  String LossOfSmell;
  double LossOfSmellSinceDays;
  double ExaminationBPHigh;
  double ExaminationBPLow;
  double Temprature;
  double Oxygen;
  double PulseRate;
  String AdviceGivenCode;

  User({this.HouseNo = '', this.BuildingName = '', this.Area='', this.CampCode='', this.WardCode='',
        this.IsHeadOfFamily=1, this.NameOfMember='', this.Age=0, this.AgeDetails='', this.Sex='',
        this.NoOfMembers=0, this.MobileNo='',this.IsDiabatic='', this.DiabaticUnderMedication='', this.IsHypertension='',
        this.BPHigh=0,this.BPLow=0,this.IsHeartDisease='',this.HearthDiseaseMedication='',this.IsKidneyDisease='',
        this.KidneyDiseaseMedication='',this.TB='',this.TBMedication='',this.HIV='',this.HIVMedication='',
        this.Leprosy='',this.LeprosyMedication='',this.Fits='',this.FitsMedication='',this.IsPregnant='',this.EstDueDate='',
        this.Cough='', this.CoughType='', this.Fever='', this.FeverSinceDays=0,  this.DifficultyInBreathing='', this.DifficultyInBreathingSinceDays=0, 
        this.LossOfTaste='', this.LossOfTasteSinceDays=0, this.LossOfSmell='', this.LossOfSmellSinceDays=0,  this.ExaminationBPHigh=0, 
        this.ExaminationBPLow=0, this.Temprature=0,  this.Oxygen=0, 
        this.PulseRate=0, this.AdviceGivenCode=''});

   Map toJson() => {
        // 'fullName': fullName,
        // 'email': email,
        // 'phone': phone,
        'CampCode': CampCode,
        'WardCode': WardCode,
        'IsHeadOfFamily': IsHeadOfFamily,
        'NameOfMember': NameOfMember,
        'Age': Age,
        'AgeDetails': AgeDetails,
        'Sex': Sex,
        'NoOfMembers': NoOfMembers,
        'MobileNo': MobileNo,
        'IsDiabatic': IsDiabatic,
        'DiabaticUnderMedication': DiabaticUnderMedication,
        'IsHypertension': IsHypertension,
        'BPHigh': BPHigh,
        'BPLow': BPLow,
        'IsHeartDisease': IsHeartDisease,
        'HearthDiseaseMedication': HearthDiseaseMedication,
        'IsKidneyDisease': IsKidneyDisease,
        'KidneyDiseaseMedication': KidneyDiseaseMedication,
        'TB': TB,
        'TBMedication': TBMedication,
        'HIV': HIV,
        'HIVMedication': HIVMedication,
        'Leprosy': Leprosy,
        'LeprosyMedication': LeprosyMedication,
        'Fits': Fits,
        'FitsMedication': FitsMedication,
        'IsPregnant': IsPregnant,
        'EstDueDate': EstDueDate,
        'Cough': Cough,
        'CoughType': CoughType,
        'Fever': Fever,
        'FeverSinceDays': FeverSinceDays,
        'DifficultyInBreathing': DifficultyInBreathing,
        'DifficultyInBreathingSinceDays': DifficultyInBreathingSinceDays,
        'LossOfTaste': LossOfTaste,
        'LossOfTasteSinceDays': LossOfTasteSinceDays,
        'LossOfSmell': LossOfSmell,
        'LossOfSmellSinceDays': LossOfSmellSinceDays,
        'ExaminationBPHigh': ExaminationBPHigh,
        'ExaminationBPLow': ExaminationBPLow,
        'Temprature': Temprature,
        'Oxygen': Oxygen,
        'PulseRate': PulseRate,
        'AdviceGivenCode': AdviceGivenCode,
      };

      Map<String, dynamic> toMap() {
    return {
        // 'fullName': fullName,
        // 'email': email,
        // 'phone': phone,
        'CampCode': CampCode,
        'WardCode': WardCode,
        'IsHeadOfFamily': IsHeadOfFamily,
        'NameOfMember': NameOfMember,
        'Age': Age,
        'AgeDetails': AgeDetails,
        'Sex': Sex,
        'NoOfMembers': NoOfMembers,
        'MobileNo': MobileNo,
        'IsDiabatic': IsDiabatic,
        'DiabaticUnderMedication': DiabaticUnderMedication,
        'IsHypertension': IsHypertension,
        'BPHigh': BPHigh,
        'BPLow': BPLow,
        'IsHeartDisease': IsHeartDisease,
        'HearthDiseaseMedication': HearthDiseaseMedication,
        'IsKidneyDisease': IsKidneyDisease,
        'KidneyDiseaseMedication': KidneyDiseaseMedication,
        'TB': TB,
        'TBMedication': TBMedication,
        'HIV': HIV,
        'HIVMedication': HIVMedication,
        'Leprosy': Leprosy,
        'LeprosyMedication': LeprosyMedication,
        'Fits': Fits,
        'FitsMedication': FitsMedication,
        'IsPregnant': IsPregnant,
        'EstDueDate': EstDueDate,
        'Cough': Cough,
        'CoughType': CoughType,
        'Fever': Fever,
        'FeverSinceDays': FeverSinceDays,
        'DifficultyInBreathing': DifficultyInBreathing,
        'DifficultyInBreathingSinceDays': DifficultyInBreathingSinceDays,
        'LossOfTaste': LossOfTaste,
        'LossOfTasteSinceDays': LossOfTasteSinceDays,
        'LossOfSmell': LossOfSmell,
        'LossOfSmellSinceDays': LossOfSmellSinceDays,
        'ExaminationBPHigh': ExaminationBPHigh,
        'ExaminationBPLow': ExaminationBPLow,
        'Temprature': Temprature,
        'Oxygen': Oxygen,
        'PulseRate': PulseRate,
        'AdviceGivenCode': AdviceGivenCode,
    };
  }
}
