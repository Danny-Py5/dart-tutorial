// return none 


void main() {

	sayHey('Daniel');
	sayHey(5); // any type could be passed

	print(greet('Kemisola', 18));

	print(sayHi(name: 'Daniel', age: 5));
	print(sayHi(age: 44));


	// dynamic explore
	dynamicTesting1(); // no error coz can dynamic can hold null (nullable)

	// dynamicTesting2(); // error coz dynamic will result to null since null is not a value, error raises
}


// infer as dynamic 
void sayHey(name){
	print('Hey $name');
}
// return string 
String greet(String name, int age){
	return 'Hello $name you are $age';
}

// named parameter
String sayHi({String? name,  required int age}){
	
	return "Hi $name you are $age. good to see you here";
}

void dynamicTesting1({ dynamic name}) {
  print("Hello $name");
}


void dynamicTesting2({required dynamic name}) {
  print("Hello $name");
}

