import 'package:flutter/material.dart';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:m3e_collection/m3e_collection.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  initWidget();
  initWindow();
  runApp(const MainApp());
}

/// 初始化组件
void initWidget() => WidgetsFlutterBinding.ensureInitialized();

/// 初始化窗口
void initWindow() async {
  await windowManager.ensureInitialized();
  const windowOptions = WindowOptions(
    title: "Simuthat",
    size: Size(1280, 720),
    minimumSize: Size(720, 468),
    center: true,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}

/// 软件主页面
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return MaterialApp(
          title: "Simuthat",
          theme: withM3ETheme(ThemeData(fontFamily: "微软雅黑", colorScheme: lightDynamic)),
          darkTheme: withM3ETheme(ThemeData(fontFamily: "微软雅黑", colorScheme: darkDynamic)),
          themeMode: ThemeMode.system,
          home: Scaffold(body: Center(child: Text('Hello World!'))),
        );
      },
    );
  }
}
