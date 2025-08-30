void main() {

	List<int> scores = [12, 3, 5, 22, 44];
	print(scores);
	scores[0] = 44;
	print('Scores index of 0 changed to ${scores[0]}');
	print(scores);

	//access first, second and last element
	print('First element ${scores[0]}\nSecond element${scores[1]}\nThird Element ${scores[scores.length - 1]}');

	// add to list element
	scores.add(555);
	print(scores);

	scores.removeLast(); // removes 555, the last element
	scores.remove(44); // 44 is removed
	print(scores); // [3, 5, 22, 44]

	// scores.shuffle();
	// print(scores);

	// get index of an item in the list 
	print(scores[2]);

}