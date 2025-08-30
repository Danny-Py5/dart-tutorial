import 'console.dart';

final console = Console();

void main() {
	final biscute = MenuItem('Soda', 200.05);
	final drink = MenuItem('Fanta', 400);

	console.log(biscute.title);
	console.log(biscute.price, false, true);

	console.log(drink.title);
	console.log(drink.price);

	// Jollof
	final jollof = Jollof(['Maggi', 'Pepper', 'oil'], 'Jollof', 740);
	console.log(jollof.price, true);
	console.log(jollof.title);

	console.spaceOne();
	console.log(jollof.format(), true);

	console.space();
	console.log(biscute, true);
	console.log(drink);
	console.log(jollof);
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

