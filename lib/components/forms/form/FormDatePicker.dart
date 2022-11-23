import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form/components/forms/base/FormBase.dart';
import 'package:get/get.dart';

import '../../../global/global.dart';
import '../enum/FormTypeEnum.dart';

class DatePickerFormItem extends FormItem<String> {
  late String? placeholder;
  DatePickerFormItem(
      {this.placeholder,
      required super.key,
      super.label = "",
      super.value,
      super.type = FormTypeEnum.DatePicker});
}

class FormDatePicker extends FormBase<String> {
  late TextEditingController _controller;
  late String placeholder;
  late FocusNode focusNode;
  bool _isOpen = false;
  late Rx<DateTime> initialDateTime;
  FormDatePicker(
      {required String key,
      String label = "",
      String value = "",
      String placeholder = ""}) {
    this.key = key;
    this.label = "".obs..value = label;
    this.value = "".obs..value = value;
    this.initialDateTime =
        Rx(value != "" ? DateTime.parse(value) : DateTime.now());
    _controller = TextEditingController(text: "");
    _controller.addListener(() {
      this.value.value = _controller.text;
    });

    this.placeholder = placeholder;
    this.focusNode = FocusNode();
    this.focusNode.addListener(() {
      if (!_isOpen) {
        Get.bottomSheet(
                Container(
                    height: 300,
                    child: Obx(
                      () => CupertinoDatePicker(
                          initialDateTime: initialDateTime.value,
                          dateOrder: DatePickerDateOrder.ymd,
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: ((date) {
                            var d = date.toString().split(" ")[0];
                            this.value.value = d;
                            _controller.value =
                                _controller.value.copyWith(text: d);
                          })),
                    )),
                backgroundColor: Colors.white)
            .then((value) {
          _isOpen = false;
        });
        _isOpen = true;
        this.focusNode.unfocus();
      }
    });
  }
  @override
  Widget build() {
    return TextField(
      focusNode: focusNode,
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

  //YYYY-MM-DD
  @override
  setValue(String value) {
    this.value.value = value;
    initialDateTime.value = DateTime.parse(value);
  }

  @override
  void setData(List<FormSelectAble> data) {
    this.data.value = data;
  }
}
