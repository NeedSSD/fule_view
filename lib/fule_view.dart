library fule_view;

import 'package:flutter/material.dart';

class FuleView extends StatelessWidget {
  final double width;
  final double height;
  final List<double> margin;
  final List<double> padding;
  final Widget child;
  final Color backgroundColor;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;
  final VoidCallback onLongPress;
  final Border border;
  final double borderWidth;
  final Color borderColor;
  final BorderStyle borderStyle;
  final BorderRadius borderRadius;
  final double borderRadiusWidth;
  final Color boxShadowColor;
  final double boxShadowBlurRadius;
  final double boxShadowSpreadRadius;
  const FuleView({
    Key key,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.child,
    this.backgroundColor = Colors.transparent,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.border,
    this.borderWidth = 0,
    this.borderColor = Colors.black,
    this.borderStyle = BorderStyle.solid,
    this.borderRadius,
    this.borderRadiusWidth = 0,
    this.boxShadowColor = Colors.transparent,
    this.boxShadowBlurRadius = 0,
    this.boxShadowSpreadRadius = 0,
  }) : super(key: key);

  static EdgeInsetsGeometry getEdgeInsetsGeometry(List<double> arg) {
    switch (arg.length) {
      case 0:
        return EdgeInsets.all(0);
      case 1:
        return EdgeInsets.all(arg[0]);
      case 2:
        return EdgeInsets.fromLTRB(arg[1], arg[0], arg[1], arg[0]);
      case 3:
        return EdgeInsets.fromLTRB(arg[1], arg[0], arg[1], arg[2]);
      case 4:
      default:
        return EdgeInsets.fromLTRB(arg[3], arg[0], arg[1], arg[2]);
    }
  }

  static Border getBorder(
    Border border,
    double borderWidth,
    Color borderColor,
    BorderStyle borderStyle,
  ) {
    return border ??
        Border(
          top: borderWidth == null || borderWidth == 0
              ? BorderSide.none
              : BorderSide(
                  width: borderWidth, color: borderColor, style: borderStyle),
          right: borderWidth == null || borderWidth == 0
              ? BorderSide.none
              : BorderSide(
                  width: borderWidth, color: borderColor, style: borderStyle),
          bottom: borderWidth == null || borderWidth == 0
              ? BorderSide.none
              : BorderSide(
                  width: borderWidth, color: borderColor, style: borderStyle),
          left: borderWidth == null || borderWidth == 0
              ? BorderSide.none
              : BorderSide(
                  width: borderWidth, color: borderColor, style: borderStyle),
        );
  }

  @override
  Widget build(BuildContext context) {
    //不含有borderRadius
    BoxDecoration _fuleViewBoxDecoration = BoxDecoration(
      color: backgroundColor,
      border: getBorder(border, borderWidth, borderColor, borderStyle),
      boxShadow: [
        BoxShadow(
          color: boxShadowColor,
          blurRadius: boxShadowBlurRadius,
          spreadRadius: boxShadowSpreadRadius,
        ),
      ],
    );

    //含有borderRadius
    BoxDecoration _fuleViewBoxDecorationWithBorderRadius = BoxDecoration(
      color: backgroundColor,
      border: getBorder(border, borderWidth, borderColor, borderStyle),
      borderRadius: borderRadius ?? BorderRadius.circular(borderRadiusWidth),
      boxShadow: [
        BoxShadow(
          color: boxShadowColor,
          blurRadius: boxShadowBlurRadius,
          spreadRadius: boxShadowSpreadRadius,
        ),
      ],
    );

    BoxDecoration _getBoxDecoration() {
      if (borderRadius != null ||
          (borderRadiusWidth != null && borderRadiusWidth != 0)) {
        // print('_fuleViewBoxDecorationWithBorderRadius');
        return _fuleViewBoxDecorationWithBorderRadius;
      } else {
        // print('_fuleViewBoxDecoration');
        return _fuleViewBoxDecoration;
      }
    }

    Widget _fuleView = Container(
        width: width,
        height: height,
        margin: getEdgeInsetsGeometry(margin ?? [0]),
        padding: getEdgeInsetsGeometry(padding ?? [0]),
        decoration: _getBoxDecoration(),
        child: child);

    //监听点击事件
    Widget _fuleViewWithTap = GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: _fuleView,
    );
    
    return onTap == null ? _fuleView : _fuleViewWithTap;
  }
}
