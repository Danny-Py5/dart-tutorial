import 'console.dart';

final console = Console();

void main() {
	final biscute = MenuItem('Soda', 200.05);
	final drink = MenuItem('Fanta', 400);

	// Jollof
	final jollof = Jollof(['Maggi', 'Pepper', 'oil'], 'Jollof', 740);

	// generic  testing
	final food = Collection<MenuItem>(
			'Food Collection 1',
			[biscute, drink, jollof]
		);
	console.log(food.runtimeType);
}

class MenuItem {
	String title;
	double price;

	MenuItem(this.title, this.price);

	String format() {
		return "$title ---> $price";
	}

	@override
	String toString(){
		return 'This object is an instance of $runtimeType';
	}
}

// inheritance 
class Jollof extends MenuItem {
	List<String> ingredents;

	// do this 
	Jollof(this.ingredents, super.title, super.price);

	// or this  --> long method
	// Jollof(this.ingredents, String title, double price): super(title, price);
	

	// methodOverriding
	@override
	String format() {
		return "Jollof is $price and can be cooked with ${ingredents[0]}";
	}

	// @override
	// String toString() {
	// 	return "This object is an instance of $runtimeType";
	// }

}

class Collection<T> {
	String name;
	List<T> items;

	Collection(this.name, this.items);

	T randomItem() {
		items.shuffle();

		return items[0];
	}
}

