import 'package:flutter/material.dart';
import 'package:flutter_form/components/forms/base/FormBase.dart';
import 'package:flutter_form/components/forms/enum/FormTypeEnum.dart';
import 'package:flutter_form/components/forms/form/FormCheckBox.dart';
import 'package:flutter_form/components/forms/form/FormCheckBoxList.dart';
import 'package:flutter_form/components/forms/form/FormRadioButtonList.dart';
import 'package:flutter_form/components/forms/form/FormTextField.dart';
import '../base/FormBase.dart';

class FormFactory {
  List<FormBase> list = [];
  FormFactory generatoryForms(List<FormItem> forms) {
    forms.forEach((element) {
      _generatoryForm(element);
    });
    return this;
  }

  Widget build({Widget Function(List<FormBase>)? layout}) {
    return layout == null
        ? Container(
            child: Column(children: list.map((e) => e.build()).toList()),
          )
        : layout(list);
  }

  _generatoryForm(FormItem form) {
    switch (form.type) {
      case FormTypeEnum.Text:
        var item = form as TextFieldFormItem;
        list.add(FormTextField(
            key: item.key,
            label: item.label,
            value: item.value ?? "",
            placeholder: item.placeholder ?? ""));
        break;
      case FormTypeEnum.CheckBox:
        var item = form as CheckBoxFormItem;
        list.add(FormCheckBox(
            key: item.key, label: item.label, value: item.value ?? false));
        break;
      case FormTypeEnum.CheckBoxList:
        var item = form as CheckBoxListFormItem;
        list.add(FormCheckBoxList(
            key: item.key, label: item.label, data: item.data ?? []));
        break;
      case FormTypeEnum.RadioButtonList:
        var item = form as RadioButtonListFormItem;
        list.add(FormRadioButtonList(
            key: item.key, label: item.label, data: item.data ?? []));
        break;
      default:
    }
  }
}
