import 'package:flutter/material.dart';
import 'package:flutter_form/build/base_new_build.dart';
import 'package:flutter_form/components/forms/base/FormBase.dart';
import 'package:flutter_form/components/forms/enum/FormTypeEnum.dart';
import 'package:flutter_form/global/global.dart';
import 'package:get/state_manager.dart';
import 'package:getwidget/getwidget.dart';

class RadioButtonListFormItem extends FormItem<List<String>> {
  RadioButtonListFormItem(
      {required super.key,
      super.label = "",
      required super.data,
      super.type = FormTypeEnum.RadioButtonList}) {
    super.value = [""];
  }
}

class FormRadioButtonList extends FormBase<List<String>> {
  FormRadioButtonList(
      {required String key,
      String label = "",
      List<String>? value,
      required List<FormSelectAble> data}) {
    this.key = key;
    this.label = label.obs;
    this.data = RxList(data);
    this.value = Rx(value ?? []);
  }

  @override
  Widget build() {
    return Obx(() => Container(
            child: Row(children: [
          MyFont(label.value).size(16).colorBlack().build(),
          ...data.value
              .map((item) => Container(
                    padding: EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        GFCheckbox(
                          type: GFCheckboxType.circle,
                          size: 20,
                          activeBgColor: Global.primaryColor,
                          onChanged: (isFlag) {
                            value.value.clear();
                            if (isFlag) {
                              value.value.add(item.value);
                            }
                            value.refresh();
                          },
                          value: value.value.contains(item.value),
                        ),
                        SizedBox(width: 8),
                        MyFont(item.label).size(16).colorGray().build()
                      ],
                    ),
                  ))
              .toList()
        ])));
  }

  @override
  List<String> getValue() {
    return value.value;
  }

  @override
  void setValue(List<String> value) {
    this.value.value = value;
  }

  @override
  void setData(List<FormSelectAble> data) {
    this.data.value = data;
    
  }
}
