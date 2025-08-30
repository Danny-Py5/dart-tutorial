class Console {
  void log(Object? value) {
    print(value);
  }
}

final console = Console();



void main() {
	// normal for loop in Dart

	for (int i = 0; i < 5; ++i){
		print('The current value of i: $i');
	};

	// looping throw list
	List<String> names = ["Daniel", "Kemi"];
	console.log(names);
}





