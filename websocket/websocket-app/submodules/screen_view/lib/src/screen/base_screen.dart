import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:screen_view/src/screen/controllers/base_controller.dart';

class BaseScreen<T extends BaseController> extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BaseScreenState<T>();
}

class BaseScreenState<T extends BaseController> extends State<BaseScreen> {
  final T controller = GetIt.instance.get<T>();

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    controller.init();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadArg(ModalRoute.of(context)!.settings.arguments);
    });
  }

  @override
  Widget build(BuildContext context) {
    controller.screenNavigator.withContext(context);
    return WillPopScope(
      onWillPop: controller.canPopPage,
      child: Scaffold(
        appBar: appBuild(),
        body: Navigator(
          initialRoute: controller.screenNavigator.initialPage,
          key: controller.screenNavigator.pageNavigatorKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => controller.screenNavigator.navigate(
              settings,
              controller,
            ),
            settings: settings,
          ),
        ),
      ),
    );
  }

  AppBar? appBuild() => AppBar(
        title: Text(controller.i18n.app_name),
        backgroundColor: Theme.of(context).primaryColor,
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
