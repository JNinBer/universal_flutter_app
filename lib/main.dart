import 'package:catcher/catcher.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/app/routers/router.dart';

final providerContainer = ProviderContainer();
void main() {
  CatcherOptions debugOptions = CatcherOptions(DialogReportMode(), [ConsoleHandler()]);

  CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
    EmailManualHandler(["xiongxinjiang@aliyun.com"])
  ]);

  Catcher(
    rootWidget: DevicePreview(
      enabled: false,
      builder: (BuildContext context) {
        return ProviderScope(
          parent: providerContainer,
          child: const UniversalApp(),
        );
      },
    ),
    debugConfig: debugOptions,
    releaseConfig: releaseOptions,
  );
}

class UniversalApp extends ConsumerWidget {
  const UniversalApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'UniversalApp',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      darkTheme: ThemeData.dark(),
      routerConfig: router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
