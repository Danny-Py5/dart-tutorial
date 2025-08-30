import 'console.dart';
import 'repeat.dart';

final console = Console();



void main() {
	// normal for loop in Dart

	for (int i = 0; i < 5; ++i){
		print('The current value of i: $i');
		if (i == 4){
			print(repeat(value: '\n'));
		}
	};

	// looping throw list
	List<String> names = ["Daniel", "Kemi", 'Alice', 'Bright'];

	for (String name in names){
		console.log(name);
	}

	// looping through set
	Set<int> ids = {3, 4, 5, 7};

	for (int id in ids){
		console.log(id);
	} 
	// give empty lines in console for new logs
	console.space();



	// condition when looping through list 
	const List<int> currency = [5, 10, 20, 50, 100, 200, 500, 1000];

	for (int c in currency){
		if (c >= 500){
			console.log(c);
		};
	};
	console.space();

	// shorter method 
	for (int c in currency.where((cu) => cu >= 500)){
		console.log(c);
	};
	print(repeat(value:'\n'));

	for (int c in currency.where((cu) => cu <= 500)){
		console.log(c);
	};
	print(repeat(value:'\n'));

	for (int c in currency.where((cu) => cu > 500)){
		console.log(c);
	};





}





