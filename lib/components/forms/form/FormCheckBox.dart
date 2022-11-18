import 'package:flutter/material.dart';
import 'package:flutter_form/build/base_new_build.dart';
import 'package:flutter_form/components/forms/base/FormBase.dart';
import 'package:flutter_form/components/forms/enum/FormTypeEnum.dart';
import 'package:flutter_form/global/global.dart';
import 'package:get/state_manager.dart';
import 'package:getwidget/getwidget.dart';

class CheckBoxFormItem extends FormItem<bool> {
  CheckBoxFormItem(
      {required super.key,
      super.label = "",
      bool? value,
      super.type = FormTypeEnum.CheckBox}) {
    super.value = value;
  }
}

class FormCheckBox extends FormBase<bool> {
  FormCheckBox({required String key, String label = "", bool value = false}) {
    this.key = key;
    this.label = Rx(label);
    this.value = Rx(value);
  }
  @override
  Widget build() {
    return Row(
      children: [
        Obx(() => GFCheckbox(
              size: 20,
              activeBgColor: Global.primaryColor,
              onChanged: (value) {
                super.value.value = value;
              },
              value: super.value.value,
            )),
        MyFont(label.value).size(16).colorGray().build(),
      ],
    );
  }

  @override
  bool getValue() {
    return this.value.value;
  }

  @override
  void setValue(bool value) {
    this.value.value = value;
  }
}
