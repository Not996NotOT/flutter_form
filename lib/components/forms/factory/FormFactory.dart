import 'package:flutter/material.dart';
import 'package:flutter_form/components/forms/base/FormBase.dart';
import 'package:flutter_form/components/forms/enum/FormTypeEnum.dart';
import 'package:flutter_form/components/forms/form/FormCheckBox.dart';
import 'package:flutter_form/components/forms/form/FormCheckBoxList.dart';
import 'package:flutter_form/components/forms/form/FormDatePicker.dart';
import 'package:flutter_form/components/forms/form/FormDropdown.dart';
import 'package:flutter_form/components/forms/form/FormRadioButtonList.dart';
import 'package:flutter_form/components/forms/form/FormTextField.dart';
import '../base/FormBase.dart';

class FormFactory {
  List<FormBase> components = [];
  FormFactory generatoryForms(List<FormItem> forms) {
    forms.forEach((element) {
      _generatoryForm(element);
    });
    return this;
  }

  FormBase getComponentsByKey(String key) {
    return components.where((item) => item.key == key).first;
  }

  Map<String, dynamic> getValues() {
    Map<String, dynamic> map = Map();
    components.forEach((item) {
      map[item.key] = item.getValue();
    });
    return map;
  }

  void setValues(Map<String, dynamic> map) {
    components.forEach((item) {
      if (map[item.key] != null) {
        item.setValue(map[item.key]);
      }
    });
  }

  Widget build({Widget Function(List<FormBase>)? layout}) {
    return layout == null
        ? Container(
            child: Column(children: components.map((e) => e.build()).toList()),
          )
        : layout(components);
  }

  _generatoryForm(FormItem form) {
    switch (form.type) {
      case FormTypeEnum.Text:
        var item = form as TextFieldFormItem;
        components.add(FormTextField(
            key: item.key,
            label: item.label,
            value: item.value ?? "",
            placeholder: item.placeholder ?? ""));
        break;
      case FormTypeEnum.CheckBox:
        var item = form as CheckBoxFormItem;
        components.add(FormCheckBox(
            key: item.key, label: item.label, value: item.value ?? false));
        break;
      case FormTypeEnum.CheckBoxList:
        var item = form as CheckBoxListFormItem;
        components.add(FormCheckBoxList(
            key: item.key, label: item.label, data: item.data ?? []));
        break;
      case FormTypeEnum.RadioButtonList:
        var item = form as RadioButtonListFormItem;
        components.add(FormRadioButtonList(
            key: item.key, label: item.label, data: item.data ?? []));
        break;
      case FormTypeEnum.DatePicker:
        var item = form as DatePickerFormItem;
        components.add(FormDatePicker(key: item.key, label: item.label));
        break;
      case FormTypeEnum.DropDown:
        var item = form as DropDownFormItem;
        components.add(FormDropDown(
            key: item.key,
            label: item.label,
            data: item.data ?? [],
            value: item.value ?? ""));
        break;
      default:
    }
  }
}
