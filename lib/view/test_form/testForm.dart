import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:umc_survey/models/testModel.dart';
import 'package:umc_survey/models/visitor.dart';
typedef OnDelete();

class TestForm extends StatefulWidget {
  
  final TestModel testModel;
  final OnDelete onDelete;
  final String title;
  var state= _TestFormState();  
  TestForm({Key key, this.testModel, this.onDelete, this.title}) : super(key: key);

  @override
  _TestFormState createState(){
  return this.state= new _TestFormState();
  }
 bool isValid() => this.state.validate();
}

class _TestFormState extends State<TestForm> {

  final key = GlobalKey<FormState>();
  var dateAge =TextEditingController();
  bool diabaticUnderMedication = false;
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Form(
          key: key,
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
              //House Number
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  initialValue: widget.testModel.HouseNo.toString(),
                  onSaved: (val) => widget.testModel.HouseNo = val,
                  validator: (val) => 
                      val.length > 1 ? null : 'House Number is invalid',
                  decoration: InputDecoration(
                    labelText: 'House Number',
                    hintText: 'House Number',
                    icon: Icon(Icons.person),
                    isDense: true,
                  ),
                ),
              ),
              //Building Name
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  initialValue: widget.testModel.BuildingName,
                  onSaved: (val) => widget.testModel.BuildingName = val,
                  validator: (val) => 
                      val.length > 1 ? null : 'Building Name is invalid',
                  decoration: InputDecoration(
                    labelText: 'Building Name',
                    hintText: 'Enter your Building name',
                    icon: Icon(Icons.person),
                    isDense: true,
                  ),
                ),
              ),
              // //Area
              // Padding(
              //   padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              //   child: TextFormField(
              //     initialValue:  widget.testModel.Area,
              //     onSaved: (val) => widget.testModel.Area = val,
              //     validator: (val) =>
              //         val.length > 1 ? null : 'Area is invalid',
              //     decoration: InputDecoration(
              //       labelText: 'Area',
              //       hintText: 'Enter your Area',
              //       icon: Icon(Icons.person),
              //       isDense: true,
              //     ),
              //   ),
              // ),
              //Age Detials   // Visibility(
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
              //         widget.visitor.AgeDetails = dateAge.text;
              //       });
                    
              //   },
              //   )
              // ),
              //  ),
              //  
          //  // camp code
          //     Visibility(
          //        visible: true,
          //        child: Padding(
          //         padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
          //         child: DropDownFormField(
          //         titleText: 'Camp Code',
          //         hintText: 'Please choose one',
          //         value: widget.testModel.CampCode.toString(),
          //         onSaved: (value) {
          //           setState(() {
          //             widget.testModel.CampCode = value;
          //           });
          //         },
          //         onChanged: (value) {
          //           setState(() {
          //             widget.testModel.CampCode = value;
          //           });
          //         },
          //         dataSource: [
          //           {
          //             "display": "Camp No. 1",
          //             "value": "00001",
          //           },
          //           {
          //             "display": "Camp No. 2",
          //             "value": "00002",
          //           },
          //           {
          //             "display": "Camp No. 3",
          //             "value": "00003",
          //           },
          //           {
          //             "display": "Camp No. 4",
          //             "value": "00004",
          //           },
          //           {
          //             "display": "Camp No. 5",
          //             "value": "00005",
          //           }
          //         ],
          //         textField: 'display',
          //         valueField: 'value',
          //       ),
          //       ),
          //     ),
          //   //  Ward Code 
          //    Visibility(
          //        visible: true,
          //        child: Padding(
          //         padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
          //         child: DropDownFormField(
          //         titleText: 'Ward Code',
          //         hintText: 'Please choose one',
          //         value: widget.testModel.WardCode.toString(),
          //         onSaved: (value) {
          //           setState(() {
          //             widget.testModel.WardCode = value;
          //           });
          //         },
          //         onChanged: (value) {
          //           setState(() {
          //             widget.testModel.WardCode = value;
          //           });
          //         },
          //         dataSource: [
          //           {
          //             "display": "Ward Committee No. 1",
          //             "value": "00001",
          //           },
          //           {
          //             "display": "Ward Committee No. 2",
          //             "value": "00002",
          //           },
          //           {
          //             "display": "Ward Committee No. 3",
          //             "value": "00003",
          //           },
          //           {
          //             "display": "Ward Committee No. 4",
          //             "value": "00004",
          //           },
          //         ],
          //         textField: 'display',
          //         valueField: 'value',
          //       ),
          //       ),
          //     ),
          //    // Is head of the family
          //    Visibility(
          //        visible: true,
          //        child: Padding(
          //         padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
          //         child: DropDownFormField(
          //         titleText: 'Is head of the familiy',
          //         hintText: 'Please choose one',
          //         value: widget.testModel.IsHeadOfFamily.toString(),
          //         onSaved: (value) {
          //           setState(() {
          //             widget.testModel.IsHeadOfFamily = int.parse(value);
          //           });
          //         },
          //         onChanged: (value) {
          //           setState(() {
          //             widget.testModel.IsHeadOfFamily = int.parse(value);
          //           });
          //         },
          //         dataSource: [
          //           {
          //             "display": "Yes",
          //             "value": '1',
          //           },
          //           {
          //             "display": "No",
          //             "value": '0',
          //           }
          //         ],
          //         textField: 'display',
          //         valueField: 'value',
          //       ),
          //       ),
          //     ),
          //    //Name of the member
          //     Padding(
          //       padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          //       child: TextFormField(
          //         initialValue: widget.testModel.NameOfMember.toString(),
          //         onSaved: (val) => widget.testModel.NameOfMember = val,
          //         validator: (val) => 
          //             val.length > 3 ? null : 'Name is invalid',
          //         decoration: InputDecoration(
          //           labelText: 'Name',
          //           hintText: 'Enter your name',
          //           icon: Icon(Icons.person),
          //           isDense: true,
          //         ),
          //       ),
          //     ),
          //   // // Age
          //     Padding(
          //       padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          //       child: TextFormField(
          //         initialValue: widget.testModel.Age.toString(),
          //         onSaved: (val) => widget.testModel.Age = double.parse(val),
          //         validator: (val) =>
          //             val.length > 1 ? null : 'Age is invalid',
          //         decoration: InputDecoration(
          //           labelText: 'Age',
          //           hintText: 'Enter your Age',
          //           icon: Icon(Icons.person),
          //           isDense: true,
          //         ),
          //       ),
          //     ),
          //  //Age Details
          //      Visibility(
          //        visible: true,
          //         child: Padding(
          //         padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          //         child: TextFormField(
          //             controller: dateAge,
          //             decoration: InputDecoration(
          //             labelText: "Age Detials",
          //             hintText: "Ex. Insert your dob",
          //             icon: Icon(Icons.calendar_today),), 
          //             onTap: () async{
          //       DateTime date = DateTime(1900); 
          //       FocusScope.of(context).requestFocus(new FocusNode());

          //       date = await showDatePicker(
          //                     context: context, 
          //                     firstDate:DateTime(1900),
          //                     initialDate:DateTime.now(),
          //                     lastDate: DateTime(2100));

          //       dateAge.text = DateFormat.yMMMMd('en_US').format(date);
          //       setState(() {
          //             widget.testModel.AgeDetails = dateAge.text;
          //           });
                    
          //       },
          //       )
          //     ),
          //      ),
          //   // Sex
          //    Visibility(
          //        visible: true,
          //        child: Padding(
          //         padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
          //         child: DropDownFormField(
          //         titleText: 'Sex',
          //         hintText: 'Please choose one',
          //         value: widget.testModel.Sex,
          //         onSaved: (value) {
          //           setState(() {
          //             widget.testModel.Sex = value;
          //           });
          //         },
          //         onChanged: (value) {
          //           setState(() {
          //             widget.testModel.Sex = value;
          //           });
          //         },
          //         dataSource: [
          //          {
          //             "display": "Male",
          //             "value": "Male",
          //           },
          //           {
          //             "display": "Female",
          //             "value": "Female",
          //           },
          //           {
          //             "display": "Other",
          //             "value": "Other",
          //           }
          //         ],
          //         textField: 'display',
          //         valueField: 'value',
          //       ),
          //       ),
          //     ),
          //     // Number of Members
          //    Padding(
          //       padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          //       child: TextFormField(
          //         initialValue: widget.testModel.NoOfMembers.toString(),
          //         onSaved: (val) => widget.testModel.NoOfMembers = int.parse(val),
          //         validator: (val) => 
          //             val.length > 0 ? null : 'No. of member is invalid',
          //         decoration: InputDecoration(
          //           labelText: 'No. of member',
          //           hintText: 'Enter No. of member',
          //           icon: Icon(Icons.person),
          //           isDense: true,
          //         ),
          //       ),
          //     ),
          //   // mobile number
          //    Padding(
          //       padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          //       child: TextFormField(
          //         initialValue: widget.testModel.MobileNo,
          //         onSaved: (val) => widget.testModel.MobileNo = val,
          //         validator: (val) => 
          //             val.length > 1 ? null : 'MobileNo is invalid',
          //         decoration: InputDecoration(
          //           labelText: 'MobileNo',
          //           hintText: 'Enter MobileNo',
          //           icon: Icon(Icons.person),
          //           isDense: true,
          //         ),
          //       ),
          //     ),
          //   // // Diabatic
              // Visibility(
              //    visible: true,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Are you Diabatic ??',
              //     hintText: 'Please choose one',
              //     value: widget.testModel.IsDiabatic.toString(),
              //     onSaved: (value) {
              //       setState(() {
              //         widget.testModel.IsDiabatic = value;
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
              //         widget.testModel.IsDiabatic = value;
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
             // If Diabatic == yes 
              // Visibility(
              //    visible: diabaticUnderMedication,
              //    child: Padding(
              //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              //     child: DropDownFormField(
              //     titleText: 'Diabatic: Under Regular Medication  ??',
              //     hintText: 'Please choose one',
              //     value: widget.testModel.DiabaticUnderMedication,
              //     onSaved: (value) {
              //       setState(() {
              //         widget.testModel.DiabaticUnderMedication = value;
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         widget.testModel.DiabaticUnderMedication = value;
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
             
             ],
          ),
        ),
      ),
    );
  }


    ///form validator
  bool validate() {
    var valid = key.currentState.validate();
    if (valid)
     key.currentState.save();
    return valid;
  }
}