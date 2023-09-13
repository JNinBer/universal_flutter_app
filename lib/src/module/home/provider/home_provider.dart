import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
class TabPosition extends _$TabPosition {
  @override
  int build() {
    return 0;
  }

  void change(int index) {
    state = index;
  }
}
