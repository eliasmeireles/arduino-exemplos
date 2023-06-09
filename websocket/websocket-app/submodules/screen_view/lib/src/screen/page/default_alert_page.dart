import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screen_view/src/style/txt_style.dart';
import 'package:screen_view/src/util/assets_util.dart';
import 'package:screen_view/src/widget/button/default_rise_button.dart';
import 'package:screen_view/src/widget/button/rise_button_child_widget.dart';
import 'package:screen_view/src/widget/default_alert_dialog.dart';

class DefaultAlertPage extends StatelessWidget {
  final String message;
  final String? asset;
  final String? textButton;
  final IconData iconButton;
  final Function onTap;

  const DefaultAlertPage({
    Key? key,
    required this.message,
    required this.onTap,
    this.asset,
    this.textButton,
    this.iconButton = Icons.exit_to_app,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultAlertDialog(
      background: Theme.of(context).appBarTheme.backgroundColor,
      message: message,
      textMessageStyle: textStyleDefaultPadding
        ..clone()
        ..textColor(Colors.white),
      action: DefaultRiseButton(
        enable: true,
        onTap: () => onTap.call(),
        child: RiseButtonChildWidget(
          enable: true,
          text: textButton ?? "",
          iconData: iconButton,
        ),
      ),
      child: SvgPicture.asset(
        asset ??
            AssetsUtil.loadScreenViewSvgAlert("undraw_server_down_s4lk_error"),
        width: 155,
        height: 155,
      ),
    );
  }
}
