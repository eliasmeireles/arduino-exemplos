import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:screen_view/src/constants/dimension.dart';
import 'package:screen_view/src/style/parent_styles.dart';

class DefaultRiseButton extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final bool enable;
  final ParentStyle? style;
  final Color? disabledColor;
  final Color? backgroundColor;
  final double borderRadius;
  final double height;

  const DefaultRiseButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.enable = true,
    this.style,
    this.disabledColor,
    this.backgroundColor,
    this.borderRadius = DEFAULT_CIRCLE_BORDER,
    this.height = DEFAULT_RISE_BUTTON_HEIGHT,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: style ?? defaultParentStyle(MediaQuery.of(context).size).clone(),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: buildButtonBackgroundColor(context),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
          onPressed: enable ? () => onTap.call() : null,
          child: SizedBox(
            width: double.infinity,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }

  MaterialStateProperty<Color> buildButtonBackgroundColor(
      BuildContext context) {
    var color = enable
        ? (backgroundColor ?? Theme.of(context).highlightColor)
        : (disabledColor ?? Theme.of(context).disabledColor);
    return MaterialStateProperty.all<Color>(color);
  }
}
