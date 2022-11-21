import 'package:flutter/material.dart';
import 'package:flutter_form/build/base_new_build.dart';
import 'package:flutter_form/components/forms/base/FormBase.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../enum/FormTypeEnum.dart';

class DropDownFormItem extends FormItem<String> {
  DropDownFormItem(
      {required super.key,
      super.label = "",
      required super.data,
      super.type = FormTypeEnum.DropDown}) {
    super.value = "";
  }
}

class FormDropDown extends FormBase<String> {
  FormDropDown({
    required String key,
    String label = "",
    String value = "",
    List<FormSelectAble> data = const [],
  }) {
    this.key = key;
    this.label = Rx(label);

    this.data = RxList(data);
    this.value = data.length > 0 ? Rx(data[0].value) : Rx(value);
  }
  @override
  Widget build() {
    return Obx(() => MyFlex([
          Container(
            height: 50,
            width: Get.width,
            child: DropdownButtonHideUnderline(
              child: GFDropdown<dynamic>(
                padding: const EdgeInsets.all(8),
                borderRadius: BorderRadius.circular(8),
                border: const BorderSide(color: Colors.black12, width: 1),
                dropdownButtonColor: Colors.white,
                value: this.value.value,
                items: this
                    .data
                    .value
                    .map((item) => DropdownMenuItem(
                          value: item.value,
                          child: Text(item.label),
                        ))
                    .toList(),
                onChanged: (value) => {
                  this.value.value = value
                },
              ),
            ),
          )
        ]).column().leftTop().spacing().build());
  }

  @override
  String getValue() {
    return this.value.value;
  }

  @override
  void setValue(String value) {
    this.value.value = value;
  }

  @override
  void setData(List<FormSelectAble> data) {
    this.data.value = data;
    
  }
}
