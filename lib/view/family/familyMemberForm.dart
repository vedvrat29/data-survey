import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:umc_survey/models/user.dart';
typedef OnDelete();

class FamilyMemberForm extends StatefulWidget {
  final User user;
  // final state = _UserFormState();
  final OnDelete onDelete;
  final String title;
  var state = _FamilyMemberFormState();  

  // var state= _UserFormState();  

  FamilyMemberForm({Key key, this.user, this.onDelete, this.title}) : super(key: key);
  @override
  _FamilyMemberFormState createState() {
   return this.state = new _FamilyMemberFormState();
  }

 bool isValid() => this.state.validate();
 
}


class _FamilyMemberFormState extends State<FamilyMemberForm> {
  var opdStartTime =TextEditingController();
  var opdEndTime =TextEditingController();
  String _myActivity;
  String _myActivityResult;
  final form = GlobalKey<FormState>();
  bool diabaticUnderMedication = false;
  bool isHypertension = false;
  bool hearthDiseaseMedication = false;
  bool kidneyDiseaseMedication = false;
  bool tBMedication = false;
  bool hIVMedication = false;
  bool leprosyMedication = false;
  bool fitsMedication = false;
  bool estDueDate = false;
  bool cough = false;
  bool fever = false;
  bool difficultyInBreathing = false;
  bool lossOfTaste = false;
  bool lossOfSmell = false;



  String _selectedDate = 'Tap to select date';
  var dateAge =TextEditingController();
  var dateDelivery =TextEditingController();
  var dateCtl =TextEditingController();
  // var dateCtl =TextEditingController();

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime d = await showDatePicker(
  //     context: context,
  //    firstDate: DateTime(1900),
  //             initialDate: DateTime.now(),
  //             lastDate: DateTime(2100));
    
  //   if (d != null) 
  //     setState(() {
  //       widget.user.date = new DateFormat.yMMMMd("en_US").format(d).toString();
  //       print("selected date");
  //       print(widget.user.date.runtimeType);
      
  //     });

  // }
      
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: Icon(Icons.verified_user),
                elevation: 0,
                title: Text(widget.title),
                backgroundColor: Theme.of(context).accentColor,
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: widget.onDelete,
                  )
                ],
              ),
              // House Number
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  maxLength: 20,
                  initialValue: widget.user.HouseNo,
                  onSaved: (val) => widget.user.HouseNo = val,
                  validator: (val) =>
                      val.length > 1 ? null : 'Invald House Number',
                  decoration: InputDecoration(
                    labelText: 'House Number',
                    hintText: 'Enter your house number',
                    icon: Icon(Icons.home),
                    isDense: true,
                  ),
                ),
              ),
              // Building Name
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  maxLength: 50,
                  initialValue: widget.user.BuildingName,
                  onSaved: (val) => widget.user.BuildingName = val,
                  validator: (val) =>
                      val.length > 1 ? null : 'Invalid Building Name',
                  decoration: InputDecoration(
                    labelText: 'Building Name',
                    hintText: 'Enter your building name',
                    icon: Icon(Icons.home),
                    isDense: true,
                  ),
                ),
              ),
              // Building Area
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  maxLength: 50,
                  initialValue: widget.user.Area,
                  onSaved: (val) => widget.user.Area = val,
                  validator: (val) =>
                      val.length > 1 ? null : 'Invalid Area',
                  decoration: InputDecoration(
                    labelText: 'Area',
                    hintText: 'Enter your Area',
                    icon: Icon(Icons.location_on),
                    isDense: true,
                  ),
                ),
              ),
              // Camp Code
              Visibility(
                 visible: true,
                 child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                  child: DropDownFormField(
                  titleText: 'Camp Code',
                  hintText: 'Please choose one',
                  value: widget.user.CampCode,
                  onSaved: (value) {
                    setState(() {
                      widget.user.CampCode = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      widget.user.CampCode = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Camp No. 1",
                      "value": "00001",
                    },
                    {
                      "display": "Camp No. 2",
                      "value": "00002",
                    },
                    {
                      "display": "Camp No. 3",
                      "value": "00003",
                    },
                    {
                      "display": "Camp No. 4",
                      "value": "00004",
                    },
                    {
                      "display": "Camp No. 5",
                      "value": "00005",
                    }
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
                ),
              ),
              //Ward Code
              Visibility(
                 visible: true,
                 child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                  child: DropDownFormField(
                  titleText: 'Ward Code',
                  hintText: 'Please choose one',
                  value: widget.user.WardCode,
                  onSaved: (value) {
                    setState(() {
                      widget.user.WardCode = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      widget.user.WardCode = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Ward Committee No. 1",
                      "value": "00001",
                    },
                    {
                      "display": "Ward Committee No. 2",
                      "value": "00002",
                    },
                    {
                      "display": "Ward Committee No. 3",
                      "value": "00003",
                    },
                    {
                      "display": "Ward Committee No. 4",
                      "value": "00004",
                    },
                   
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
                ),
              ),
              // head of family
              Visibility(
                 visible: true,
                 child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                  child: DropDownFormField(
                  titleText: 'Is Head of Family',
                  hintText: 'Please choose one',
                  // value: widget.title == "Family member" ? '0' :(widget.user.IsHeadOfFamily).toString(),
                   value: widget.user.IsHeadOfFamily.toString(),
                  onSaved: (value) {
                    setState(() {
                      widget.user.IsHeadOfFamily = int.parse(value);
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      widget.user.IsHeadOfFamily = int.parse(value);
                    });
                  },
                  dataSource: [
                    {
                      "display": "Yes",
                      "value": '1',
                    },
                    {
                      "display": "No",
                      "value": '0',
                    }
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
                ),
              ),
              // Name of member
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  maxLength: 100,
                  initialValue: "",
                  onSaved: (val) => widget.user.NameOfMember = val,
                  validator: (val) =>
                      val.length > 3 ? null : 'Name of the member is invalid',
                  decoration: InputDecoration(
                    labelText: 'Name of the Member',
                    hintText: 'Name of the Member',
                    icon: Icon(Icons.person),
                    isDense: true,
                  ),
                ),
              ),
              // Age
              // Padding(
              //   padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              //   child: TextFormField(
              //     maxLength: 3,
              //     initialValue: "",
              //     onSaved: (val) => widget.user.Age = double.parse(val),
              //     validator: (val) =>
              //         val.length > 1 ? null : 'Age is invalid',
              //     decoration: InputDecoration(
              //       labelText: 'Age',
              //       hintText: 'Age',
              //       icon: Icon(Icons.person),
              //       isDense: true,
              //     ),
              //   ),
              // ),
              //Age Details
              // Visibility(
              //    visible: true,
              //     child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              //     child: TextFormField(
              //         controller: dateAge,
              //         decoration: InputDecoration(
              //         labelText: "Age Detials",
              //         hintText: "Ex. Insert your dob",
              //         icon: Icon(Icons.calendar_today),), 
              //         onTap: () async{
              //   DateTime date = DateTime(1900); 
              //   FocusScope.of(context).requestFocus(new FocusNode());
              //   date = await showDatePicker(
              //                 context: context, 
              //                 firstDate:DateTime(1900),
              //                 initialDate:DateTime.now(),
              //                 lastDate: DateTime(2100));
              //   dateAge.text = DateFormat.yMMMMd('en_US').format(date);
              //   setState(() {
              //         widget.user.AgeDetails = dateAge.text;
              //       });
                    
              //   },
              //   )
              // ),
              //  ),
              // //Sex
              // Visibility(
              //    visible: true,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Sex',
              //     hintText: 'Please choose one',
              //     value: widget.user.Sex,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.Sex = value;
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.Sex = value;
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Male",
              //         "value": "Male",
              //       },
              //       {
              //         "display": "Female",
              //         "value": "Female",
              //       },
              //       {
              //         "display": "Other",
              //         "value": "Other",
              //       }
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // Number of Members
              // Visibility(
              //     // visible: widget.title == "Family member" ? false : true,
              //     visible:true,
              //     child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              //     child: TextFormField(
                    
              //       initialValue: '',
              //       onSaved: (val) => widget.user.NoOfMembers = int.parse(val),
              //       validator: (val) =>
              //           val.length > 0 ? null : 'No of the member is invalid',
              //       decoration: InputDecoration(
              //         labelText: 'No. the Member',
              //         hintText: 'No. the Member',
              //         icon: Icon(Icons.person),
              //         isDense: true,
              //       ),
              //     ),
              //   ),
              // ),
              // // Mobile Number
              // Padding(
              //   padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              //   child: TextFormField(
              //     initialValue: widget.user.MobileNo,
              //     onSaved: (val) => widget.user.MobileNo = val,
              //     validator: (val) =>
              //         val.length > 9 ? null : 'Mobile number is invalid',
              //     decoration: InputDecoration(
              //       labelText: 'Mobile Number',
              //       hintText: 'Mobile Number',
              //       icon: Icon(Icons.phone),
              //       isDense: true,
              //     ),
              //   ),
              // ),
              // // Diabatic
              // Visibility(
              //    visible: true,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Are you Diabatic ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.IsDiabatic,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.IsDiabatic = value;
              //         if(value == 'Yes') {
              //           diabaticUnderMedication = true;
              //         }
              //         if(value == 'No') {
              //           diabaticUnderMedication = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           diabaticUnderMedication = false;
              //         }
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.IsDiabatic = value;
              //         if(value == 'Yes') {
              //           diabaticUnderMedication = true;
              //         }
              //         if(value == 'No') {
              //           diabaticUnderMedication = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           diabaticUnderMedication = false;
              //         }
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       },
              //       {
              //         "display": "Don't Know",
              //         "value": "Don't Know",
              //       }
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // If Diabatic == yes 
              // Visibility(
              //    visible: diabaticUnderMedication,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Diabatic: Under Regular Medication  ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.DiabaticUnderMedication,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.DiabaticUnderMedication = value;
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.DiabaticUnderMedication = value;
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       },
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // Hypertension
              // Visibility(
              //    visible: true,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'You have hypertension ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.IsHypertension,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.IsHypertension = value;
              //         if(value == 'Yes') {
              //           isHypertension = true;
              //         }
              //         if(value == 'No') {
              //           isHypertension = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           isHypertension = false;
              //         }
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.IsHypertension = value;
              //         if(value == 'Yes') {
              //           isHypertension = true;
              //         }
              //         if(value == 'No') {
              //           isHypertension = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           isHypertension = false;
              //         }
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       },
              //       {
              //         "display": "Don't Know",
              //         "value": "Don't Know",
              //       }
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // If Hypertension == yes , Measured High BP
              // Visibility(
              //     visible: isHypertension,
              //     child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              //     child: TextFormField(
              //       initialValue: '',
              //       onSaved: (val) => widget.user.BPHigh = double.parse(val),
              //       validator: (val) =>
              //           val.length > 1 ? null : 'High BP is invalid',
              //       decoration: InputDecoration(
              //         labelText: 'Last Measured High BP',
              //         hintText: 'High BP',
              //         icon: Icon(Icons.timer),
              //         isDense: true,
              //       ),
              //     ),
              //   ),
              // ),
              // // If Hypertension == yes , Measure Low BP
              // Visibility(
              //     visible: isHypertension,
              //     child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              //     child: TextFormField(
              //       initialValue: '',
              //       onSaved: (val) => widget.user.BPLow = double.parse(val),
              //       validator: (val) =>
              //           val.length > 1 ? null : 'Low BP is invalid',
              //       decoration: InputDecoration(
              //         labelText: 'Last Measured Low BP',
              //         hintText: 'Low BP',
              //         icon: Icon(Icons.timer),
              //         isDense: true,
              //       ),
              //     ),
              //   ),
              // ),
              // // Heart Disease
              // Visibility(
              //    visible: true,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Is Heart Disease',
              //     hintText: 'Please choose one',
              //     value: widget.user.IsHeartDisease,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.IsHeartDisease = value;
              //         if(value == 'Yes') {
              //           hearthDiseaseMedication = true;
              //         }
              //         if(value == 'No') {
              //           hearthDiseaseMedication = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           hearthDiseaseMedication = false;
              //         }
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.IsHeartDisease = value;
              //         if(value == 'Yes') {
              //           hearthDiseaseMedication = true;
              //         }
              //         if(value == 'No') {
              //           hearthDiseaseMedication = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           hearthDiseaseMedication = false;
              //         }
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       },
              //       {
              //         "display": "Don't Know",
              //         "value": "Don't Know",
              //       }
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // If Heart Disease == yes
              // Visibility(
              //    visible: hearthDiseaseMedication,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Heart Disease: Under Regular Medication  ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.HearthDiseaseMedication,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.HearthDiseaseMedication = value;
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.HearthDiseaseMedication = value;
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       },
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // Kidney Disease
              // Visibility(
              //    visible: true,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Is Kidney Disease??',
              //     hintText: 'Please choose one',
              //     value: widget.user.IsKidneyDisease,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.IsKidneyDisease = value;
              //         if(value == 'Yes') {
              //           kidneyDiseaseMedication = true;
              //         }
              //         if(value == 'No') {
              //           kidneyDiseaseMedication = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           kidneyDiseaseMedication = false;
              //         }
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.IsKidneyDisease = value;
              //         if(value == 'Yes') {
              //           kidneyDiseaseMedication = true;
              //         }
              //         if(value == 'No') {
              //           kidneyDiseaseMedication = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           kidneyDiseaseMedication = false;
              //         }
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       },
              //       {
              //         "display": "Don't Know",
              //         "value": "Don't Know",
              //       }
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // If Kidney Disease == yes
              // Visibility(
              //    visible: kidneyDiseaseMedication,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Kidney Disease: Under Regular Medication  ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.KidneyDiseaseMedication,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.KidneyDiseaseMedication = value;
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.KidneyDiseaseMedication = value;
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       },
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              //  // TB
              // Visibility(
              //    visible: true,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Is TB ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.TB,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.TB = value;
              //         if(value == 'Yes') {
              //           tBMedication = true;
              //         }
              //         if(value == 'No') {
              //           tBMedication = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           tBMedication = false;
              //         }
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.TB = value;
              //         if(value == 'Yes') {
              //           tBMedication = true;
              //         }
              //         if(value == 'No') {
              //           tBMedication = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           tBMedication = false;
              //         }
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       },
              //       {
              //         "display": "Don't Know",
              //         "value": "Don't Know",
              //       }
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // If TB == yes
              // Visibility(
              //    visible: tBMedication,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'TB: Under Regular Medication  ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.TBMedication,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.TBMedication = value;
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.TBMedication = value;
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       },
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // HIV
              // Visibility(
              //    visible: true,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Is HIV ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.HIV,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.HIV = value;
              //         if(value == 'Yes') {
              //           hIVMedication = true;
              //         }
              //         if(value == 'No') {
              //           hIVMedication = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           hIVMedication = false;
              //         }
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.HIV = value;
              //         if(value == 'Yes') {
              //           hIVMedication = true;
              //         }
              //         if(value == 'No') {
              //           hIVMedication = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           hIVMedication = false;
              //         }
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       },
              //       {
              //         "display": "Don't Know",
              //         "value": "Don't Know",
              //       }
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // If HIV == yes 
              // Visibility(
              //    visible: hIVMedication,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'HIV: Under Regular Medication  ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.HIVMedication,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.HIVMedication = value;
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.HIVMedication = value;
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       },
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // Leprosy
              // Visibility(
              //    visible: true,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Is leprosy ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.Leprosy,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.Leprosy = value;
              //         if(value == 'Yes') {
              //           leprosyMedication = true;
              //         }
              //         if(value == 'No') {
              //           leprosyMedication = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           leprosyMedication = false;
              //         }
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.Leprosy = value;
              //         if(value == 'Yes') {
              //           leprosyMedication = true;
              //         }
              //         if(value == 'No') {
              //           leprosyMedication = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           leprosyMedication = false;
              //         }
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       },
              //       {
              //         "display": "Don't Know",
              //         "value": "Don't Know",
              //       }
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // If Leprosy == yes 
              // Visibility(
              //    visible: leprosyMedication,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Leprosy: Under Regular Medication  ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.LeprosyMedication,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.LeprosyMedication = value;
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.LeprosyMedication = value;
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       },
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // Fits
              // Visibility(
              //    visible: true,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Is Fits ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.Fits,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.Fits = value;
              //         if(value == 'Yes') {
              //           fitsMedication = true;
              //         }
              //         if(value == 'No') {
              //           fitsMedication = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           fitsMedication = false;
              //         }
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.Fits = value;
              //         if(value == 'Yes') {
              //           fitsMedication = true;
              //         }
              //         if(value == 'No') {
              //           fitsMedication = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           fitsMedication = false;
              //         }
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       },
              //       {
              //         "display": "Don't Know",
              //         "value": "Don't Know",
              //       }
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // If Fits == yes  
              // Visibility(
              //    visible: fitsMedication,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Fits: Under Regular Medication  ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.FitsMedication,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.FitsMedication = value;
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.FitsMedication = value;
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       },
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // Pregnant
              // Visibility(
              //    visible: true,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Is Pregnant ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.IsPregnant,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.IsPregnant = value;
              //         if(value == 'Yes') {
              //           estDueDate = true;
              //         }
              //         if(value == 'No') {
              //           estDueDate = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           estDueDate = false;
              //         }
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.IsPregnant = value;
              //         if(value == 'Yes') {
              //           estDueDate = true;
              //         }
              //         if(value == 'No') {
              //           estDueDate = false;
              //         }
              //         if(value == 'Don\'t Know') {
              //           estDueDate = false;
              //         }
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       },
              //       {
              //         "display": "Don't Know",
              //         "value": "Don't Know",
              //       }
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // //If Pregnant == yes
              // Visibility(
              //    visible: estDueDate,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
              //     child: TextFormField(
              //         controller: dateDelivery,
              //         decoration: InputDecoration(
              //         labelText: "Expected Date Of Delivery",
              //         hintText: "Expected Date Of Delivery",
              //         icon: Icon(Icons.calendar_today),), 
              //         onTap: () async{
              //   DateTime date = DateTime(1900); 
              //   FocusScope.of(context).requestFocus(new FocusNode());

              //   date = await showDatePicker(
              //                 context: context, 
              //                 firstDate:DateTime(1900),
              //                 initialDate:DateTime.now(),
              //                 lastDate: DateTime(2100));

              //   dateDelivery.text = DateFormat.yMMMMd('en_US').format(date);
              //   setState(() {
              //         widget.user.EstDueDate = dateDelivery.text;
              //       });
                    
              //   },
              //   )
              // ),
              // ),
              // //cough 
              // Visibility(
              //    visible: true,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Symptons : Cough ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.Cough,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.Cough = value;
              //         if(value == 'Yes') {
              //           cough = true;
              //         }
              //         if(value == 'No') {
              //           cough = false;
              //         }
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.Cough = value;
              //         if(value == 'Yes') {
              //           cough = true;
              //         }
              //         if(value == 'No') {
              //           cough = false;
              //         }
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       }
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // //if cough == yes
              // Visibility(
              //    visible: cough,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Cough Type: Dry / Wet',
              //     hintText: 'Please choose one',
              //     value: widget.user.CoughType,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.CoughType = value;
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.CoughType = value;
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Dry",
              //         "value": "Dry",
              //       },
              //       {
              //         "display": "Wet",
              //         "value": "Wet",
              //       },
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // //Fever 
              // Visibility(
              //    visible: true,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Symptons : Fever ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.Fever,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.Fever = value;
              //         if(value == 'Yes') {
              //           fever = true;
              //         }
              //         if(value == 'No') {
              //           fever = false;
              //         }
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.Fever = value;
              //         if(value == 'Yes') {
              //           fever = true;
              //         }
              //         if(value == 'No') {
              //           fever = false;
              //         }
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       }
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // if fever == yes
              // Visibility(
              //     visible: fever,
              //     child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              //     child: TextFormField(
              //       initialValue: '',
              //       onSaved: (val) => widget.user.FeverSinceDays = double.parse(val),
              //       validator: (val) =>
              //           val.length > 1 ? null : 'Days is invalid',
              //       decoration: InputDecoration(
              //         labelText: 'Fever : Since how many days ??',
              //         hintText: 'Fever : Since how many days ??',
              //         icon: Icon(Icons.calendar_today),
              //         isDense: true,
              //       ),
              //     ),
              //   ),
              // ),
              // //Breathing
              // Visibility(
              //    visible: true,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Symptons : Difficulty in breathing ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.DifficultyInBreathing,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.DifficultyInBreathing = value;
              //         if(value == 'Yes') {
              //           difficultyInBreathing = true;
              //         }
              //         if(value == 'No') {
              //           difficultyInBreathing = false;
              //         }
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.DifficultyInBreathing = value;
              //         if(value == 'Yes') {
              //           difficultyInBreathing = true;
              //         }
              //         if(value == 'No') {
              //           difficultyInBreathing = false;
              //         }
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       }
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // if Difficulty in breathing == yes
              // Visibility(
              //     visible: difficultyInBreathing,
              //     child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              //     child: TextFormField(
              //       initialValue: '',
              //       onSaved: (val) => widget.user.DifficultyInBreathingSinceDays = double.parse(val),
              //       validator: (val) =>
              //           val.length > 1 ? null : 'Days is invalid',
              //       decoration: InputDecoration(
              //         labelText: 'Difficulty in breathing : Since how many days ??',
              //         hintText: 'Difficulty in breathing : Since how many days ??',
              //         icon: Icon(Icons.calendar_today),
              //         isDense: true,
              //       ),
              //     ),
              //   ),
              // ),
              // //Loss Of Taste
              // Visibility(
              //    visible: true,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Symptons : Loss of taste ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.LossOfTaste,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.LossOfSmell = value;
              //         if(value == 'Yes') {
              //           lossOfTaste = true;
              //         }
              //         if(value == 'No') {
              //           lossOfTaste = false;
              //         }
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.LossOfTaste = value;
              //         if(value == 'Yes') {
              //           lossOfTaste = true;
              //         }
              //         if(value == 'No') {
              //           lossOfTaste = false;
              //         }
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       }
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              // // if loss of test == yes
              // Visibility(
              //     visible: lossOfTaste,
              //     child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              //     child: TextFormField(
              //       initialValue: '',
              //       onSaved: (val) => widget.user.LossOfTasteSinceDays = double.parse(val),
              //       validator: (val) =>
              //           val.length > 1 ? null : 'Days is invalid',
              //       decoration: InputDecoration(
              //         labelText: 'Loss of taste : Since how many days ??',
              //         hintText: 'Loss of taste : Since how many days ??',
              //         icon: Icon(Icons.calendar_today),
              //         isDense: true,
              //       ),
              //     ),
              //   ),
              // ),
              // //Loss Of Smell
              //  Visibility(
              //    visible: true,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Symptons : Loss of smell ??',
              //     hintText: 'Please choose one',
              //     value: widget.user.LossOfSmell,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.LossOfSmell = value;
              //         if(value == 'Yes') {
              //           lossOfSmell = true;
              //         }
              //         if(value == 'No') {
              //           lossOfSmell = false;
              //         }
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.LossOfSmell = value;
              //         if(value == 'Yes') {
              //           lossOfSmell = true;
              //         }
              //         if(value == 'No') {
              //           lossOfSmell = false;
              //         }
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Yes",
              //         "value": "Yes",
              //       },
              //       {
              //         "display": "No",
              //         "value": "No",
              //       }
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
              //  // if loss of Smell == yes
              //  Visibility(
              //     visible: lossOfSmell,
              //     child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              //     child: TextFormField(
              //       initialValue: '',
              //       onSaved: (val) => widget.user.LossOfSmellSinceDays = double.parse(val),
              //       validator: (val) =>
              //           val.length > 1 ? null : 'Days is invalid',
              //       decoration: InputDecoration(
              //         labelText: 'Loss of taste : Since how many days ??',
              //         hintText: 'Loss of taste : Since how many days ??',
              //         icon: Icon(Icons.calendar_today),
              //         isDense: true,
              //       ),
              //     ),
              //   ),
              // ),
              // //Examinations
              // // High BP
              // Padding(
              //   padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              //   child: TextFormField(
              //     initialValue: '',
              //     onSaved: (val) => widget.user.ExaminationBPHigh = double.parse(val),
              //     validator: (val) =>
              //         val.length > 1 ? null : 'Hight BP is invalid',
              //     decoration: InputDecoration(
              //       labelText: 'Examination : High BP',
              //       hintText: 'Examination : High BP',
              //       icon: Icon(Icons.timer),
              //       isDense: true,
              //     ),
              //   ),
              // ),
              // // Low BP
              // Padding(
              //   padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              //   child: TextFormField(
              //     initialValue: '',
              //     onSaved: (val) => widget.user.ExaminationBPLow = double.parse(val),
              //     validator: (val) =>
              //         val.length > 1 ? null : 'Low BP is invalid',
              //     decoration: InputDecoration(
              //       labelText: 'Examination : Low BP',
              //       hintText: 'Examination : Low BP',
              //       icon: Icon(Icons.timer),
              //       isDense: true,
              //     ),
              //   ),
              // ),
              //  // Temprature
              // Padding(
              //   padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              //   child: TextFormField(
              //     initialValue: '',
              //     onSaved: (val) => widget.user.Temprature = double.parse(val),
              //     validator: (val) =>
              //         val.length > 1 ? null : 'Temprature is invalid',
              //     decoration: InputDecoration(
              //       labelText: 'Examination : Temprature',
              //       hintText: 'Examination : Temprature',
              //       icon: Icon(Icons.timer),
              //       isDense: true,
              //     ),
              //   ),
              // ),
              // // Oxygen
              // Padding(
              //   padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              //   child: TextFormField(
              //     initialValue: '',
              //     onSaved: (val) => widget.user.Oxygen = double.parse(val),
              //     validator: (val) =>
              //         val.length > 1 ? null : 'Oxygen is invalid',
              //     decoration: InputDecoration(
              //       labelText: 'Examination : Oxygen',
              //       hintText: 'Examination : Oxygen',
              //       icon: Icon(Icons.timer),
              //       isDense: true,
              //     ),
              //   ),
              // ),
              // // PulseRate
              // Padding(
              //   padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              //   child: TextFormField(
              //     initialValue: '',
              //     onSaved: (val) => widget.user.PulseRate = double.parse(val),
              //     validator: (val) =>
              //         val.length > 1 ? null : 'PulseRate is invalid',
              //     decoration: InputDecoration(
              //       labelText: 'Examination : PulseRate',
              //       hintText: 'Examination : PulseRate',
              //       icon: Icon(Icons.timer),
              //       isDense: true,
              //     ),
              //   ),
              // ),
              // //Advice
              // Visibility(
              //    visible: true,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 26, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Advice given',
              //     hintText: 'Please choose one',
              //     value: widget.user.AdviceGivenCode,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.user.AdviceGivenCode = value;
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.user.AdviceGivenCode = value;
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display": "Adviced Home Quarantine",
              //         "value": "00001",
              //       },
              //       {
              //         "display": "Refer To Nearest CCC",
              //         "value": "00002",
              //       },
              //       {
              //         "display": "efer To Nearest DCHC",
              //         "value": "00003",
              //       },
              //       {
              //         "display": "Refer To Nearest DCH",
              //         "value": "00004",
              //       },
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  bool validate() {
    var valid = form.currentState.validate();
    if (valid) form.currentState.save();
    return valid;
  }
}