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
  final Color splashColor;
  final Color focusColor;
  final Color highlightColor;
  final Color hoverColor;
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
    this.splashColor = Colors.transparent,
    this.focusColor = Colors.transparent,
    this.highlightColor = Colors.transparent,
    this.hoverColor = Colors.transparent,
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
    Widget _boxView = Container(
        width: width,
        height: height,
        margin: getEdgeInsetsGeometry(margin ?? [0]),
        padding: getEdgeInsetsGeometry(padding ?? [0]),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: getBorder(border, borderWidth, borderColor, borderStyle),
          borderRadius:
              borderRadius ?? BorderRadius.circular(borderRadiusWidth),
          boxShadow: [
            BoxShadow(
              color: boxShadowColor,
              blurRadius: boxShadowBlurRadius,
              spreadRadius: boxShadowSpreadRadius,
            ),
          ],
        ),
        child: child);

    Widget _boxViewWithTap = InkWell(
        splashColor: splashColor,
        focusColor: focusColor,
        highlightColor: highlightColor,
        hoverColor: hoverColor,
        onTap: onTap,
        child: _boxView);

    return onTap == null ? _boxView : _boxViewWithTap;
  }
}
