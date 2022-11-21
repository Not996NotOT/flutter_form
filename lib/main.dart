import 'package:flutter/material.dart';
import 'package:flutter_form/components/forms/base/FormBase.dart';
import 'package:flutter_form/components/forms/factory/FormFactory.dart';
import 'package:flutter_form/components/forms/form/FormCheckBox.dart';
import 'package:flutter_form/components/forms/form/FormDatePicker.dart';
import 'package:flutter_form/components/forms/form/FormDropdown.dart';
import 'package:flutter_form/components/forms/form/FormTextField.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import 'components/forms/form/FormCheckBoxList.dart';
import 'components/forms/form/FormRadioButtonList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'CH'),
      ],
      home: Scaffold(
          appBar: AppBar(),
          body: FormFactory().generatoryForms([
            TextFieldFormItem(
                key: "name", label: "name", placeholder: "enter your name"),
            TextFieldFormItem(
                key: "password",
                label: "password",
                placeholder: "enter your password"),
            CheckBoxFormItem(key: "isjiehun", label: "是否结婚"),
            CheckBoxListFormItem(
              key: "job",
              label: "职业",
              data: [
                FormSelectAble(label: "医生", value: "nan"),
                FormSelectAble(label: "护士", value: "nv")
              ],
            ),
            RadioButtonListFormItem(
              key: "gender",
              label: "性别",
              data: [
                FormSelectAble(label: "男", value: "nan"),
                FormSelectAble(label: "女", value: "nv")
              ],
            ),
            DatePickerFormItem(
                key: "datetime", label: "日期选择", placeholder: "请选择你的日期"),
            DropDownFormItem(
              key: "job",
              label: "职业",
              data: [
                FormSelectAble(label: "请选择你的职业", value: ""),
                FormSelectAble(label: "医生", value: "nan"),
                FormSelectAble(label: "护士", value: "nv")
              ],
            ),
          ]).build()),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
    );
  }
}
