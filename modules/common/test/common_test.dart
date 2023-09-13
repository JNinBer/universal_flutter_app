import 'package:flutter_test/flutter_test.dart';

import 'package:common/common.dart';

void main() {
  test('adds one to input values', () {
    expect(Validator.isNotNull(2), true);
    expect(Validator.isNullOrEmpty(''), true);
    expect(Validator.isNullOrEmptyMap({}), true);
  });
}
