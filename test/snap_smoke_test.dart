import 'package:flutter_test/flutter_test.dart';

import 'package:snap/theme/app_theme.dart';

void main() {
  test('SNAP theme uses the expected brand color', () {
    expect(SnapColors.purple.toARGB32(), 0xFF7B3FF2);
  });
}
