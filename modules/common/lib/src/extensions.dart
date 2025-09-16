import 'package:flutter/material.dart';

/// numExt
extension NumExtensions on num {
  SizedBox get vGap => SizedBox(height: toDouble());

  SizedBox get hGap => SizedBox(width: toDouble());
}

/// StringExt
extension StringExtensions on String {
  int? get tryParseInt => int.tryParse(this);

  double? get tryParseDouble => double.tryParse(this);

  DateTime? get time => DateTime.tryParse(this);
}

extension DateTimeExt on DateTime {
  bool isSameDay(DateTime? other) {
    if (other == null) {
      return false;
    }
    return year == other.year && month == other.month && day == other.day;
  }
}

extension WidgetExtensions on Widget {
  Widget get sliver => SliverToBoxAdapter(child: this);

  Widget symmetricPadding({double vertical = 0.0, double horizontal = 0.0}) => Padding(
        padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );

  Widget onlyPadding({left = 0.0, top = 0.0, right = 0.0, bottom = 0.0}) => Padding(
        padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: this,
      );

  Widget onlyMargin({left = 0.0, top = 0.0, right = 0.0, bottom = 0.0}) => Container(
        margin: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: this,
      );

  Widget symmetricMargin({double vertical = 0.0, double horizontal = 0.0}) => Container(
        margin: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );
}

/// ContextExt
extension BuildContextExtensions on BuildContext {
  MediaQueryData get mediaQueryData => MediaQuery.of(this);

  Size get screenSize => mediaQueryData.size;

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  EdgeInsets get screenPadding => mediaQueryData.padding;

  double get bottomPadding => screenPadding.bottom;

  double get topPadding => screenPadding.top;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  TextStyle? get titleLargeStyle => textTheme.titleLarge;

  TextStyle? get titleMediumStyle => textTheme.titleMedium;

  TextStyle? get titleSmallStyle => textTheme.titleSmall;

  TextStyle? get bodyLargeStyle => textTheme.bodyLarge;

  TextStyle? get bodyMediumStyle => textTheme.titleMedium;

  TextStyle? get bodySmallStyle => textTheme.titleSmall;

  TextStyle? get labelLargeStyle => textTheme.labelLarge;

  TextStyle? get labelMediumStyle => textTheme.titleMedium;

  TextStyle? get labelSmallStyle => textTheme.titleSmall;

  /// 显示一个Overlay
  OverlayEntry addOverlay(WidgetBuilder builder) {
    final overlayState = Overlay.of(this);
    final overlayEntry = OverlayEntry(builder: builder);
    overlayState.insert(overlayEntry);
    return overlayEntry;
  }

  /// 显示一个snackBar
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
