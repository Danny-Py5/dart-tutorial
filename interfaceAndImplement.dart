abstract class Shape {
  double area();
  double peremeter();
}

class Rectangle implements Shape {
  double _length;
  double _breadth;

  Rectangle(double length, double breadth)
    : _length = _validateParameter(length),
      _breadth = _validateParameter(breadth);

  double get length => _length;

  double get breadth => _breadth;

  void set breadth(double value) {
    if (value >= 0) {
      _breadth = value;
    }
  }

  void set length(double value) {
    if (value >= 0) {
      _length = value;
    }
  }

  static double _validateParameter(double param) {
    if (param < 0) {
      throw ArgumentError('$param can be less than 0');
    } else {
      return param;
    }
  }

  @override
  double area() {
    return length * breadth;
  }

  @override
  double peremeter() {
    return (length * 2) + (breadth * 2);
  }
}

void main() {
  final rec = Rectangle(5, 95);
  print(rec.area());
  print(rec.peremeter());

  rec._length = 4;
  print(rec.peremeter());
}
