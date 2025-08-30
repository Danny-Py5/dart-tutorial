import 'console.dart';
import 'repeat.dart';

final console = Console();

void main() {
	Map<String, Map<String, double>> clothes = {
		'shirt': {
			'amount': 400,
			'rating': 5.3,
		},
		'trouser': {
			'amount': 405,
			'rating': 4.2,
		},
		'singlet': {
			'amount': 500,
			'rating': 2.3,
		},
	};

	// access shirt
	final shirt = clothes['shirt'];
	console.log(shirt);

	// add new item
	clothes['pant'] = {
		'amount': 300,
		'rating': 2.1,
	};
	console.log(clothes, true, true);

	// access all the keys 
	console.log('Clothes keys are: ${clothes.keys}', true, true);

	// access all the values 
	console.log('Clothes values are: ${clothes.values}', true, false);

	// access key that is not available 
	console.log(clothes['cap']); // null


	// remove shirt
	final removedItem = clothes.remove('shirt');
	console.log('removed item: \n${repeat(times: 10, value: '-')}\n$removedItem\nClothes Map:\n${repeat(times: 8, value: '-')}\n${clothes}', true, true);
	

} 