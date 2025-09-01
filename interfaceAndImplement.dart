abstract class Shape {
	double area();
	double peremeter();

}

class Rectangle implements Shape {
	double length;
	double breadth;

	Rectangle(this.length, this.breadth);



	@override
	double area() {
		return length * breadth;
	}

	@override
	double peremeter(){
		return (length * 2) + (breadth * 2);
	}
}
void main () {
	final rec = Rectangle(5, 5);
	print(rec.area());
	print(rec.peremeter());
}