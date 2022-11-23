import 'package:flutter/material.dart';
import 'package:flutter_form/components/forms/base/FormBase.dart';
import 'package:flutter_form/components/forms/factory/FormFactory.dart';
import 'package:flutter_form/components/forms/form/FormAssetPicker.dart';
import 'package:flutter_form/components/forms/form/FormCheckBox.dart';
import 'package:flutter_form/components/forms/form/FormDatePicker.dart';
import 'package:flutter_form/components/forms/form/FormDropdown.dart';
import 'package:flutter_form/components/forms/form/FormTextField.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'components/forms/form/FormCheckBoxList.dart';
import 'components/forms/form/FormRadioButtonList.dart';

void main() {
  runApp(const MyApp());
}

enum MyFormsEnum { username, dropDown }

extension AuthorityEnumExtension on MyFormsEnum {
  int get value {
    switch (this) {
      case MyFormsEnum.username:
        return 0;
      case MyFormsEnum.dropDown:
        return 6;
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var forms = FormFactory().generatoryForms([
      TextFieldFormItem(
          key: "name",
          label: "name",
          placeholder: "enter your name",
          minLines: 2,
          maxLines: 5,value: "这他妈的是一个默认值"),
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
        key: "jobs",
        label: "职业",
        value: "jiaoshou",
        data: [
          FormSelectAble(label: "医生", value: "nan"),
          FormSelectAble(label: "护士", value: "nv"),
          FormSelectAble(label: "教授", value: "jiaoshou")
        ],
      ),
      AssetPickerFormItem(key: "image", label: "上传小图片")
    ]);

    var assetPicker = FormAssetPicker(key: "image", label: "选择图片");
    var componet = forms.components[3] as FormCheckBoxList;
    componet.setValue(["nv"]);
    componet.setData([
      FormSelectAble(label: "男人", value: "nan"),
      FormSelectAble(label: "女人", value: "nv")
    ]);

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
          body: Column(
            children: [
              forms.build(
                  layout: (widgets) => Column(
                        children: [
                          widgets[MyFormsEnum.username.value].build(),
                          widgets[1].build(),
                          widgets[3].build(),
                          widgets[5].build(),
                          widgets[6].build(),
                          widgets[7].build(),
                          //assetPicker.build()
                        ],
                      )),
              ElevatedButton(
                  onPressed: () async {
                    // var componet = forms.getComponentsByKey("name") as FormTextField;
                    // print(componet.getValue());
                    // print(forms.getValues());

                    // Map<String, dynamic> map = new Map();
                    // map["name"] = "123";
                    // map["job"] = ["nan", "nv"];
                    // map["jobs"] = "nv";
                    // forms.setValues(map);

                    // forms.getComponentsByKey("name").setValue("zhangxing");

                    // var files = assetPicker.getValue();
                    // print(files);
                    forms.getComponentsByKey("datetime").setValue("2024-01-01");
                    print(forms.getValues());
                  },
                  child: Text("点击"))
            ],
          )),
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
