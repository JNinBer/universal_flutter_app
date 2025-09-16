import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings/settings.dart';

class PersonComponent extends ConsumerWidget {
  const PersonComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          children: [
            SettingsTile.navigation(
              bgColor: Colors.black12,
              tileHighlightColor: Colors.black38,
              title: const Text('个人信息'),
              padding: const EdgeInsets.only(left: 16, right: 16),
              onPressed: () => ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('个人信息'))),
            )
          ],
        ),
      ),
    );
  }
}
