import 'dart:math';

// Main function
void main() {
  final s1 = Student('Daniel', 59);
  final s2 = Student('Dave', 44);
  final ns1 = Student.newStudent('Kemi');

  print(s1.passed);
  print(s2.passed);

  print('s2 score b3 changed: ${s2.score}');
  s2.updateScore(s2.getRandomScore());
  print('s2 score changed');
  print(s2.score);
  print(s2.passed);
}

// Student Class
class Student {
  String name;
  int _score;

  final List<int> randomScores = [20, 49, 70, 89, 51];

  Student(this.name, this._score);

  Student.newStudent(name) : this(name, 0);

  bool get passed => _score >= 50;

  // Add this Getter
  int get score => _score; 

  set score(int newScore) {
    if (newScore >= 0 && newScore <= 100) {
      _score = newScore;
    } else {
      print('Invalid score: Score must be between 0 and 100.');
    }
  }

  void updateScore(int newScore) {
    _score = newScore;
  }

  int getRandomScore() {
    randomScores.shuffle();
    return randomScores[0];
  }
}