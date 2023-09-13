import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

import 'provider/home_provider.dart';
import 'tab/dashboard_component.dart';
import 'tab/index_component.dart';
import 'tab/person_component.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: LazyLoadIndexedStack(
        index: ref.watch(tabPositionProvider.select((value) => value)),
        children: [
          const IndexComponent(),
          DashboardComponent(),
          const PersonComponent()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person'),
        ],
        onTap: (index) {
          ref.read(tabPositionProvider.notifier).change(index);
        },
        currentIndex: ref.watch(tabPositionProvider.select((value) => value)),
      ),
    );
  }
}
