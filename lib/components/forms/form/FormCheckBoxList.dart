import 'package:flutter/material.dart';
import 'package:flutter_form/build/base_new_build.dart';
import 'package:flutter_form/components/forms/base/FormBase.dart';
import 'package:flutter_form/components/forms/enum/FormTypeEnum.dart';
import 'package:flutter_form/global/global.dart';
import 'package:get/state_manager.dart';
import 'package:getwidget/getwidget.dart';

class CheckBoxListFormItem extends FormItem<List<String>> {
  CheckBoxListFormItem(
      {required super.key,
      super.label = "",
      required super.data,
      super.type = FormTypeEnum.CheckBoxList}) {
    super.value = [""];
  }
}

class FormCheckBoxList extends FormBase<List<String>> {
  FormCheckBoxList(
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
              .map((item) => Row(
                    children: [
                      GFCheckbox(
                        size: 20,
                        activeBgColor: Global.primaryColor,
                        onChanged: (isFlag) {
                          if (isFlag) {
                            value.value.add(item.value);
                          } else {
                            value.value.remove(item.value);
                          }
                          value.refresh();
                        },
                        value: value.value.contains(item.value),
                      ),
                      MyFont(item.label).size(16).colorGray().build()
                    ],
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
}
