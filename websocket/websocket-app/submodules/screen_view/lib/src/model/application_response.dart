import 'package:screen_view/screen_view.dart';

import 'alert_resource.dart';

abstract class ApplicationResponse {
  bool unexpectedError;
  bool isInternetConnected;
  int? code;
  bool success;
  String message;
  int timestamp;
  Map<String, Object>? info;

  ApplicationResponse({
    this.success = false,
    this.unexpectedError = false,
    this.isInternetConnected = false,
    this.code,
    required this.message,
    required this.timestamp,
    this.info,
  });

  AlertResource errorResource(I18n i18n);
}
