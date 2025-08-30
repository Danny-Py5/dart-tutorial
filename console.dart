import 'repeat.dart';

class Console {
  void log(Object? value, [bool padStart = false, bool padEnd = false]) {
  final start = padStart ? '\n' : '';
  final end = padEnd ? '\n' : '';
  print('${start}LOG: $value$end');
}
  void info(Object? value) {
    print("INFO: $value");
  }

  void warn(Object? value) {
    print("?? WARNING: $value");
  }

  void error(Object? value) {
    print("? ERROR: $value");
  }
  void space() {
    print(repeat(times: 10, value: '\n'));
  }
  void spaceOne() {
    print(repeat(times: 1, value:'\n'));
  }
}

