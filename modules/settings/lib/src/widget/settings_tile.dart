import 'package:common/common.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatefulWidget {
  const SettingsTile(
      {super.key,
      this.height = 55,
      this.padding,
      this.margin,
      this.leading,
      this.trailing,
      this.title,
      this.value,
      this.description,
      this.divider,
      this.bgColor,
      this.onPressed,
      this.tileHighlightColor});

  factory SettingsTile.navigation(
          {double height = 55,
          EdgeInsets? padding,
          EdgeInsets? margin,
          Widget? leading,
          Widget? title,
          Widget? value,
          Widget? description,
          Divider? divider,
          Color color = Colors.black54,
          Color? bgColor,
          Color? tileHighlightColor,
          Function()? onPressed}) =>
      SettingsTile(
        height: height,
        padding: padding,
        margin: margin,
        leading: leading,
        title: title,
        value: value,
        divider: divider,
        onPressed: onPressed,
        bgColor: bgColor,
        tileHighlightColor: tileHighlightColor,
        trailing: Icon(
          Icons.chevron_right,
          size: 24,
          color: color,
        ),
      );

  final double height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? leading;
  final Widget? trailing;
  final Widget? title;
  final Widget? value;
  final Widget? description;
  final void Function()? onPressed;
  final Divider? divider;
  final Color? bgColor;
  final Color? tileHighlightColor;

  @override
  State<SettingsTile> createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  bool isPressed = false;
  void changePressState({bool isPressed = false}) {
    if (mounted) {
      setState(() {
        this.isPressed = isPressed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var item = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.onPressed == null
          ? null
          : () async {
              changePressState(isPressed: true);

              widget.onPressed!.call();
              Future.delayed(
                const Duration(milliseconds: 100),
                () => changePressState(isPressed: false),
              );
            },
      onTapDown: (_) =>
          widget.onPressed == null ? null : changePressState(isPressed: true),
      onTapUp: (_) =>
          widget.onPressed == null ? null : changePressState(isPressed: false),
      onTapCancel: () =>
          widget.onPressed == null ? null : changePressState(isPressed: false),
      child: Container(
        height: widget.height,
        padding: widget.padding,
        margin: widget.margin,
        color: isPressed ? widget.tileHighlightColor : widget.bgColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (widget.leading != null) widget.leading!,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.title != null) widget.title!,
                  if (widget.title != null && widget.description != null)
                    4.vGap,
                  if (widget.description != null) widget.description!
                ],
              ),
            ),
            if (widget.value != null) widget.value!,
            if (widget.trailing != null) widget.trailing!
          ],
        ),
      ),
    );
    return widget.divider != null
        ? Column(children: [item, widget.divider!])
        : item;
  }
}
