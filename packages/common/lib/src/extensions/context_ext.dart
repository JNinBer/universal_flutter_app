import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get canvasColor => Theme.of(this).canvasColor;
  Color get cardColor => Theme.of(this).cardColor;
  Color get focusColor => Theme.of(this).focusColor;
  // Use DialogThemeData.backgroundColor; fallback to surface for Material 3
  Color get dialogBackgroundColor =>
      Theme.of(this).dialogTheme.backgroundColor ?? Theme.of(this).colorScheme.surface;
  Color get disabledColor => Theme.of(this).disabledColor;
  Color get dividerColor => Theme.of(this).dividerColor;
  Color get highlightColor => Theme.of(this).highlightColor;
  Color get hintColor => Theme.of(this).hintColor;
  Color get hoverColor => Theme.of(this).hoverColor;
  // Use TabBarThemeData.indicatorColor; fallback to primary color
  Color get indicatorColor =>
      Theme.of(this).tabBarTheme.indicatorColor ?? Theme.of(this).colorScheme.primary;
  Color get primaryDark => Theme.of(this).primaryColorDark;
  Color get primaryLight => Theme.of(this).primaryColorLight;
  Color get shadowColor => Theme.of(this).shadowColor;

  Size get size => MediaQuery.sizeOf(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);

  double get width => size.width;
  double get height => size.height;
  double get aspectRatio => size.aspectRatio;
  double get longestSide => size.longestSide;
  double get shortestSide => size.shortestSide;
  Orientation get orientation => MediaQuery.orientationOf(this);
  EdgeInsets get padding => MediaQuery.paddingOf(this);
}
