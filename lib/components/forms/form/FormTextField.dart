import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form/components/forms/base/FormBase.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../global/global.dart';
import '../enum/FormTypeEnum.dart';

class TextFieldFormItem extends FormItem<String> {
  late String? placeholder;
  late int? minLines;
  late int? maxLines;
  TextFieldFormItem(
      {this.placeholder,
      required super.key,
      super.label = "",
      super.value,
      super.type = FormTypeEnum.Text,
      this.minLines,
      this.maxLines});
}

class FormTextField extends FormBase<String> {
  late TextEditingController _controller;
  late String placeholder;
  late int? minLines;
  late int? maxLines;
  FormTextField(
      {required String key,
      String label = "",
      String value = "",
      String placeholder = "",
      this.minLines,
      this.maxLines}) {
    this.key = key;
    this.label = "".obs..value = label;
    this.value = "".obs..value = value;
    _controller = TextEditingController(text: value);
    _controller.addListener(() {
      value = _controller.text;
      this.value.value = value;
    });
    this.placeholder = placeholder;
  }
  @override
  Widget build() {
    return TextField(
      minLines: minLines,
      maxLines: maxLines,
      cursorColor: Global.primaryColor,
      controller: _controller,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
    this._controller.value = _controller.value.copyWith(text: value);
  }

  @override
  void setData(List<FormSelectAble> data) {
    this.data.value = data;
  }
}
