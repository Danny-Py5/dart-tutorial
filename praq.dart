import 'console.dart';
final console = Console();

void main() {
	List<int> num1 = [1, 2, 3, 4];
	List<int> intString = [...num1, 4, 6];
	console.log(intString);
}