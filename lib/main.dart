import 'package:flutter/material.dart';
import 'package:umc_survey/view/family/multiFamilyMemberForm.dart';
import 'package:umc_survey/view/test_form/multiTestForm.dart';
import 'package:umc_survey/view/test_form/testForm.dart';
import 'package:umc_survey/view/visitor/multiVisitorForm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UMC - Health Survey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Color(0xFF1DCC8C),
        platform: TargetPlatform.iOS,
      ),
      debugShowCheckedModeBanner: false,
      home: MultiTestForm(),
      // home: MultiVisitorForm(),
      // home: MultiFamilyMemberForm(),
      // home: FormScreen(),
    );
  }
}
