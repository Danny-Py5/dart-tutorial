 void main() {
  final ap = Airplane();
  print(ap.fly());
}

mixin Flyable {
  String fly() {
    return 'I am flying';
  }
}

class Airplane with Flyable {}

