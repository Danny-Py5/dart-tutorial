import 'console.dart';

final console = Console();

void main() {

	final car = Car();
	car.setModel('Tesla');

	console.log(car.showModel(), true, true);
}


class Car {
	late String  model;

	void setModel(String m){
		model = m;
	}
	String showModel() => model;

}
