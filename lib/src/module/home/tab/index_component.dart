import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'circle_component.dart';

class IndexComponent extends ConsumerStatefulWidget {
  const IndexComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IndexComponentState();
}

class _IndexComponentState extends ConsumerState<IndexComponent> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView();
  }
}
