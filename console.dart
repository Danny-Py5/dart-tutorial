import 'repeat.dart';

class Console {
  void log(Object? value) {
    print("LOG: $value");
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
}

