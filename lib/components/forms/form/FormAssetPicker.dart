import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form/build/base_new_build.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../base/FormBase.dart';
import '../enum/FormTypeEnum.dart';

class AssetPickerFormItem extends FormItem {
  late RequestType assetType;
  AssetPickerFormItem(
      {required super.key,
      super.label = "",
      super.type = FormTypeEnum.AssetPicker,
      this.assetType = RequestType.image});
}

class FormAssetPicker extends FormBase<List<File>> {
  late RequestType requestType;
  FormAssetPicker(
      {required String key,
      String label = "",
      RequestType assetType = RequestType.image}) {
    super.list = RxList<File>([]);
    super.key = key;
    super.label = label.obs;
    requestType = assetType;
  }

  removeAsset(File file) {
    super.list.remove(file);
  }

  selectAssets() async {
    if (Get.context != null) {
      final List<AssetEntity>? selectedAssets = await AssetPicker.pickAssets(
          Get.context!,
          pickerConfig: AssetPickerConfig(requestType: requestType));
      if (selectedAssets != null) {
        selectedAssets.forEach((asset) async {
          var file = await asset.file;
          if (file != null) {
            super.list.add(file);
          }
        });
      }
    }
  }

  @override
  Widget build() {
    return Obx(() => Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyFont(label.value).size(16).bold().colorGray().build(),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  child: Wrap(children: [
                    ...super.list.value
                        .map((item) => GestureDetector(
                              onTap: () {
                                removeAsset(item);
                              },
                              child: Container(
                                height: Get.width * 0.25,
                                width: Get.width * 0.25,
                                child: Image.file(
                                  item,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ))
                        .toList(),
                    GestureDetector(
                      onTap: selectAssets,
                      child: Container(
                          constraints: BoxConstraints(
                              maxHeight: Get.width * 0.25,
                              maxWidth: Get.width * 0.25),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26)),
                          child: const Center(child: Icon(Icons.add))),
                    )
                  ]),
                )
              ]),
        ));
  }

  @override
  List<File> getValue() {
    print(super.list.length);
    // TODO: implement getValue
    return super.list.value as List<File>;
  }

  @override
  void setData(List<FormSelectAble> data) {
    // TODO: implement setData
  }

  @override
  void setValue(List<File> list) {
    list.addAll(list);
  }
}
