import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form/components/forms/base/FormBase.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../global/global.dart';
import '../enum/FormTypeEnum.dart';

class TextFieldFormItem extends FormItem<String> {
  late String? placeholder;
  TextFieldFormItem(
      {this.placeholder,
      required super.key,
      super.label = "",
      super.value,
      super.type = FormTypeEnum.Text});
}

class FormTextField extends FormBase<String> {
  late TextEditingController _controller;
  late String placeholder;
  FormTextField(
      {required String key,
      String label = "",
      String value = "",
      String placeholder = ""}) {
    this.key = key;
    this.label = "".obs..value = label;
    this.value = "".obs..value = value;
    _controller = TextEditingController(text: "");
    _controller.addListener(() {
      value = _controller.text;
    });
    this.placeholder = placeholder;
  }
  @override
  Widget build() {
    return TextField(
      cursorColor: Global.primaryColor,
      controller: _controller,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
          focusColor: Global.primaryColor,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Global.primaryColor),
          ),
          hintText: placeholder,
          labelText: label.value),
    );
  }

  @override
  String getValue() {
    return value.value;
  }

  @override
  setValue(String value) {
    this.value.value = value;
  }
}
