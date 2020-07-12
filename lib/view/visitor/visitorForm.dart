import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:umc_survey/models/visitor.dart';

typedef OnDelete();

class VisitorForm extends StatefulWidget {
  final Visitor visitor;
  // final state = _UserFormState();
  final OnDelete onDelete;
  final String title;
  var state= _VisitorState();  
  VisitorForm({Key key, this.visitor, this.onDelete, this.title}) : super(key: key);
  // @override
  // _UserFormState createState() => state;

    @override
  _VisitorState createState(){
  return this.state= new _VisitorState();
  }
 bool isValid() => this.state.validate();
}

class _VisitorState extends State<VisitorForm> {
  final form = GlobalKey<FormState>();
  var dateAge =TextEditingController();


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
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  initialValue: widget.visitor.FamilyHeadSerialNo,
                  onSaved: (val) => widget.visitor.FamilyHeadSerialNo = val,
                  validator: (val) => 
                      val.length > 3 ? null : 'Serial Number is invalid',
                  decoration: InputDecoration(
                    labelText: 'Serial Number',
                    hintText: 'Serial Number',
                    icon: Icon(Icons.person),
                    isDense: true,
                  ),
                ),
              ),
              //Name
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  initialValue: widget.visitor.Name,
                  onSaved: (val) => widget.visitor.Name = val,
                  validator: (val) => 
                      val.length > 3 ? null : 'Name is invalid',
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    icon: Icon(Icons.person),
                    isDense: true,
                  ),
                ),
              ),
              //Age
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  initialValue: "",
                  onSaved: (val) => widget.visitor.Age = double.parse(val),
                  validator: (val) =>
                      val.length > 1 ? null : 'Age is invalid',
                  decoration: InputDecoration(
                    labelText: 'Age',
                    hintText: 'Enter your Age',
                    icon: Icon(Icons.person),
                    isDense: true,
                  ),
                ),
              ),
              //Age Detials
              Visibility(
                 visible: true,
                  child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: TextFormField(
                      controller: dateAge,
                      decoration: InputDecoration(
                      labelText: "Age Detials",
                      hintText: "Ex. Insert your dob",
                      icon: Icon(Icons.calendar_today),), 
                      onTap: () async{
                DateTime date = DateTime(1900); 
                FocusScope.of(context).requestFocus(new FocusNode());

                date = await showDatePicker(
                              context: context, 
                              firstDate:DateTime(1900),
                              initialDate:DateTime.now(),
                              lastDate: DateTime(2100));

                dateAge.text = DateFormat.yMMMMd('en_US').format(date);
                setState(() {
                      widget.visitor.AgeDetails = dateAge.text;
                    });
                    
                },
                )
              ),
               ),
               //Sex
               Visibility(
                 visible: true,
                 child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                  child: DropDownFormField(
                  titleText: 'Sex',
                  hintText: 'Please choose one',
                  value: widget.visitor.Sex,
                  onSaved: (value) {
                    setState(() {
                      widget.visitor.Sex = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      widget.visitor.Sex = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Male",
                      "value": "Male",
                    },
                    {
                      "display": "Female",
                      "value": "Female",
                    },
                    {
                      "display": "Other",
                      "value": "Other",
                    }
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
                ),
              ),
              // Is residance of UMC
              Visibility(
                 visible: true,
                 child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 26, top: 16),
                  child: DropDownFormField(
                  titleText: 'If Resident Of Ulhasnagar ??',
                  hintText: 'Please choose one',
                  value: widget.visitor.IfUNRResident,
                  onSaved: (value) {
                    setState(() {
                      widget.visitor.IfUNRResident = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      widget.visitor.IfUNRResident = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Yes",
                      "value": "Yes",
                    },
                    {
                      "display": "No",
                      "value": "No",
                    }
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }

  ///form validator
  bool validate() {
    var valid = form.currentState.validate();
    if (valid) form.currentState.save();
    return valid;
  }
}
