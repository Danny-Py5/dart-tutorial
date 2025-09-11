import 'dart:io';
import 'dart:convert' as convert;
import '../console.dart';

final console = Console();

void main() {

	final user = User('Daniel', 21, 'Geto ago-alaye odigbo local government ondo state Nigeria');
	
	final rental = Rental(user);
	final details = rental.rent('Keyboard');
	console.log(details);

}


class Rental {

	final itemsDB = ItemsDB();
	User user; 

	Rental(this.user);
	// final items = itemsDB.getItems();


	 
	Map<String, dynamic>? rent(String itemName, [int quantity = 1]) {
		for (Map<String, dynamic> item in itemsDB.getItems()){
			for (dynamic value in item.values){
				String val = value.toString().toLowerCase();
				if (val == itemName.toLowerCase() && item['isAvailable'] == true){
					 Map<String, dynamic> rentDetails = {
						'rent-status': 'success',
						'rent-date': getDate(),
						'quantity': quantity,
						...item,
						'id': getRandomId(),
						'renter-info': user.getInfo(),
					};
					itemsDB.saveToFIle(rentDetails);
					return rentDetails;
				} 
			};
		}
		return {};
	}

	static String getDate() {
  		final DateTime now = DateTime.now();
	  	final String day = now.day.toString().padLeft(2, '0');
	  	final String month = now.month.toString().padLeft(2, '0');
	  
	  	final String year = now.year.toString();

	  	// Combine them into the desired format.
	  	final String formattedDate = '$day/$month/$year';

	  	return formattedDate;
	}
    static String getRandomId() {
		var strings = 'abcdefghijklmnopqrstuvwxyz1234567890&%#-'.split('');
		String id = '';
		for (String char in strings){
			id += char;
			strings.shuffle();
		}
		return id;
	}
}

class ItemsDB {

	List<Map<String, dynamic>> getItems() {
	 	return [
	 		{
	 			'name': 'Guitar',
	 			'price': 500,
	 			'range': '1day',
	 			'id': '1',
	 			"isAvailable": true,
	 		}, 
	 		{
	 			'name': 'Keyboard',
	 			'price': 200,
	 			'range': '1day',
	 			'id': '2',
	 			"isAvailable": true,
	 		}
	 	];
	}	

	Future<void> saveToFIle(data) async {
		final file = File('renters.txt');
		final jsonData = convert.jsonEncode(data);

		try{
			if (!await file.exists()){
				await file.writeAsString(jsonData);
			} else {
				await file.writeAsString('\n\n', mode: FileMode.append);
				await file.writeAsString(jsonData, mode: FileMode.append);
			}
		} catch (e) {
			console.log(e);
		}
	}

}

class User {

	String name;
	int age;
	String address;


	User(this.name, this.age, this.address);

	Map<String, dynamic> getInfo() {
		return {
			'name': name, 
			'age': age, 
			'address': address,
		};
	}

}