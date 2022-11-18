
import 'package:flutter/material.dart';

import '../global/global.dart';

class MyFont {
  late String _text;
  Color _color = Colors.black;
  Color? _decorationColor = null;
  double _size = 24;
  double _top = 0;
  double _left = 0;
  FontWeight? _fontWeight = null;
  TextDecoration? _textDecoration = null;
  TextDecorationStyle? _textDecorationStyle = null;
  double? _decorationThickness = null;
  int? _maxLines;
  MyFont(String text) {
    _text = text;
  }
  MyFont color(Color? color) {
    _color = color ?? _color;
    return this;
  }

  MyFont bigTitle() {
    this
        .size(26)
        .bold(fontWeight: FontWeight.w500)
        .color(Color.fromRGBO(28, 32, 35, 1));
    return this;
  }

  MyFont colorGray() {
    this.color(Color.fromRGBO(100, 105, 110, 1));
    return this;
  }

  MyFont colorSubBlack() {
    this.color(Color.fromRGBO(28, 32, 35, 1));
    return this;
  }

  MyFont colorSubGray() {
    this.color(Color.fromRGBO(201, 202, 205, 1));
    return this;
  }

  MyFont size(double size) {
    _size = size;
    return this;
  }

  MyFont title() {
    _size = 14;
    _color = Color.fromRGBO(38, 43, 46, 1);
    _fontWeight = FontWeight.w600;
    return this;
  }

  MyFont titleOther() {
    _size = 20;
    _color = Colors.black87;
    _fontWeight = FontWeight.w500;
    return this;
  }

  MyFont subTitle() {
    _size = 18;
    _fontWeight = FontWeight.w500;
    _color = Colors.black87;
    return this;
  }

  MyFont more() {
    _size = 16;
    _color = Colors.black87;
    return this;
  }

  MyFont content() {
    _size = 12;
    _fontWeight = FontWeight.w400;
    _color = Color.fromRGBO(100, 105, 110, 1);
    return this;
  }

  MyFont description() {
    _size = 12;
    _fontWeight = FontWeight.w400;
    _color = Color.fromRGBO(85, 85, 85, 1);
    return this;
  }

  MyFont colorWhite() {
    _color = Colors.white;
    return this;
  }

  MyFont colorBlack() {
    _color = Colors.black87;
    return this;
  }

  MyFont colorPrimary() {
    _color = Global.primaryColor;
    return this;
  }

  MyFont marginTop(double top) {
    _top = top;
    return this;
  }

  MyFont marginLeft(double left) {
    _left = left;
    return this;
  }

  MyFont bold({FontWeight? fontWeight}) {
    _fontWeight = fontWeight ?? FontWeight.w500;
    return this;
  }

  MyFont boldMax() {
    _fontWeight = FontWeight.w700;
    return this;
  }

  MyFont maxLines(int? maxLines) {
    _maxLines = maxLines ?? 1;
    return this;
  }

  MyFont underline({Color color = const Color.fromRGBO(249, 132, 40, 1)}) {
    _textDecoration = TextDecoration.underline;
    _textDecorationStyle = TextDecorationStyle.solid;
    _decorationColor = color;
    _decorationThickness = 4;
    return this;
  }

  Widget build() {
    return Container(
      margin: EdgeInsets.fromLTRB(_left, _top, 0, 0),
      child: Text(_text,
          maxLines: _maxLines,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: _color,
              fontSize: _size,
              fontWeight: _fontWeight,
              decoration: _textDecoration,
              decorationStyle: _textDecorationStyle,
              decorationThickness: _decorationThickness,
              decorationColor: _decorationColor)),
    );
  }
}

class MyDivider {
  EdgeInsets _margin = EdgeInsets.all(0);
  Color _color = const Color.fromRGBO(226, 232, 237, 1);
  double? _width = null;
  double? _height = null;
  MyDivider color(Color? color) {
    _color = color ?? _color;
    return this;
  }

  MyDivider margin(
      {double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    _margin = EdgeInsets.fromLTRB(left, top, right, bottom);
    return this;
  }

  MyDivider width(double? width) {
    _width = width ?? _width;
    return this;
  }

  MyDivider height(double? height) {
    _height = height ?? 0.5;
    return this;
  }

  Widget build() {
    return Container(
      margin: _margin,
      height: _height ?? 0.5,
      width: _width,
      color: _color,
    );
  }
}

class MyBox {
  late Widget _widget;
  EdgeInsets _padding = EdgeInsets.all(0);
  EdgeInsets _margin = EdgeInsets.fromLTRB(0, 0, 0, 0);
  Color _background = Colors.transparent;
  Border? _border = null;
  double _height = 0;
  double _width = 0;
  double _bordeRadius = 0;
  BoxShadow? _boxShadow = BoxShadow();
  AlignmentGeometry? _alignment;
  MyBox(Widget widget) {
    _widget = widget;
  }

  MyBox height(double height) {
    _height = height;
    return this;
  }

  MyBox width(double width) {
    _width = width;
    return this;
  }

  MyBox bordeRadius(double? bordeRadius) {
    _bordeRadius = bordeRadius ?? _bordeRadius;
    return this;
  }

  MyBox background(Color? background) {
    _background = background ?? _background;
    return this;
  }

  MyBox marginTop(double? margin) {
    _margin = EdgeInsets.fromLTRB(0, margin ?? 20, 0, 0);
    return this;
  }

  MyBox margin(
      {double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    _margin = EdgeInsets.fromLTRB(left, top, right, bottom);
    return this;
  }

  MyBox padding(
      {double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    _padding = EdgeInsets.fromLTRB(left, top, right, bottom);
    return this;
  }

  MyBox border({double width = 1.0, Color color = Colors.black12}) {
    _border = Border.all(width: width, color: color);
    return this;
  }

  MyBox paddingAll(double? padding) {
    _padding = padding != null ? EdgeInsets.all(padding) : _padding;
    return this;
  }

  MyBox shadow(
      {Color color = Colors.black87,
      double x = 0,
      double y = 0,
      double blur = 50.0,
      double spread = 20.0}) {
    _boxShadow = BoxShadow(
        color: color,
        offset: Offset(x, y),
        blurRadius: blur,
        spreadRadius: spread);

    return this;
  }

  MyBox center() {
    _alignment = Alignment.center;
    return this;
  }

  MyBox verticalCenter() {
    _alignment = Alignment.centerLeft;
    return this;
  }

  MyBox horizontalCenter() {
    _alignment = Alignment.topCenter;
    return this;
  }

  Widget build() {
    return Container(
      alignment: _alignment,
      child: _widget,
      padding: _padding,
      margin: _margin,
      constraints: BoxConstraints(minHeight: _height, minWidth: _width),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(_bordeRadius)),
          border: _border,
          color: _background,
          boxShadow: null),
    );
  }
}

class MyImage {
  late String _url;
  double? _height;
  double? _width;
  double _radius = 0;
  BoxFit? _boxFit;
  MyImage(String url) {
    _url = url;
  }
  MyImage radius(double? radius) {
    _radius = radius ?? 0;
    return this;
  }

  MyImage size({double height = 0, double width = 0}) {
    _height = height;
    _width = width;
    return this;
  }

  MyImage fit(BoxFit? boxFit) {
    _boxFit = boxFit ?? BoxFit.cover;
    return this;
  }

  Widget build() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_radius),
      child: Image.network(
        _url,
        fit: _boxFit,
        width: _width,
        height: _height,
      ),
    );
  }
}

class MyFlex {
  Axis _direction = Axis.horizontal;
  double _spacing = 10;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;
  Color _background = Colors.transparent;
  late List<Widget> _widgets;
  MyFlex(List<Widget> widgets) {
    _widgets = widgets;
  }

  MyFlex row() {
    _direction = Axis.horizontal;
    _mainAxisAlignment = MainAxisAlignment.start;
    _crossAxisAlignment = CrossAxisAlignment.center;
    return this;
  }

  MyFlex column() {
    _direction = Axis.vertical;
    _mainAxisAlignment = MainAxisAlignment.start;
    _crossAxisAlignment = CrossAxisAlignment.center;
    return this;
  }

  MyFlex leftTop() {
    _mainAxisAlignment = MainAxisAlignment.start;
    _crossAxisAlignment = CrossAxisAlignment.start;
    return this;
  }

  MyFlex leftCenter() {
    _mainAxisAlignment = MainAxisAlignment.start;
    _crossAxisAlignment = CrossAxisAlignment.center;
    return this;
  }

  MyFlex center() {
    _mainAxisAlignment = MainAxisAlignment.center;
    _crossAxisAlignment = CrossAxisAlignment.center;
    return this;
  }

  MyFlex background(Color? background) {
    _background = background ?? _background;
    return this;
  }

  MyFlex spacing({double? spacing = 8}) {
    var length = _widgets.length;
    List.generate(length, (index) {
      if (index.isOdd) {
        _widgets.insert(
            index,
            SizedBox(
                height: _direction == Axis.horizontal ? 0 : spacing,
                width: _direction == Axis.vertical ? 0 : spacing));
      }
    });
    return this;
  }

  Widget build() {
    return Container(
      color: _background,
      child: Flex(
        direction: _direction,
        children: _widgets,
        mainAxisAlignment: _mainAxisAlignment,
        crossAxisAlignment: _crossAxisAlignment,
      ),
    );
  }
}
