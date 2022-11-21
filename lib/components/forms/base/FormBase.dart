import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../enum/FormTypeEnum.dart';

class FormSelectAble {
  late String label;
  late String value;
  FormSelectAble({
    this.label = "",
    this.value = "",
  });
}

abstract class FormItem<T> {
  late String key;
  late String label;
  late T? value;
  late List<FormSelectAble>? data;
  late FormTypeEnum type;
  FormItem(
      {required this.key,
      this.label = "",
      this.value,
      this.data,
      this.type = FormTypeEnum.Text});
}

abstract class FormBase<T> {
  late String key;
  late Rx<String> label;
  late Rx<T> value;
  late RxList<FormSelectAble> data;
  T getValue();
  void setValue(T t);
  Widget build();
}
