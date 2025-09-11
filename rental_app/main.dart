import 'dart:io';
import 'dart:convert' as convert;
import '../console.dart';

final console = Console();

Future<void> main() async {

	final user = User('Daniel', 21, 'Geto ago-alaye odigbo local government ondo state Nigeria');
	
	final rental = Rental(user);
	final details = await rental.rent('Keyboard');
	console.log(details);

}


class Rental {

	final itemsDB = ItemsDB();
	User user; 

	Rental(this.user);
	// final items = itemsDB.getItems();


	 
	Future<Map<String, dynamic>>? rent(String itemName, [int quantity = 1]) async {
		for (Map<String, dynamic> item in await itemsDB.getItems()){
			for (dynamic value in item.values){
				String val = value.toString().toLowerCase();
				if (val == itemName.toLowerCase()){
					 if (item['isAvailable'] == true) {
						 Map<String, dynamic> rentDetails = {
							'rent-status': 'success',
							'rent-date': getDate(),
							'quantity': quantity,
							...item,
							'id': getRandomId(),
							'renter-info': user.getInfo(),
							'returning-date': getReturningDate(item['range']),
						};
						itemsDB.saveToFIle(rentDetails);
						return rentDetails;
					 } else {
					 	return {
							'rent-status': 'failed',
							'item': val,
							'item-is-available': false,
							'info': 'Item is not available for rent',
						};
					 };
				} 
			};
		};
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

	String getReturningDate(String range) {
		final DateTime now = DateTime.now();
	  	int day = now.day;
	  	int month = now.month;
	  	int year = now.year;

	  	List<dynamic> splitedRange = range.split('-');

	  	switch (splitedRange[1].toLowerCase()){
	  		case 'day': 
	  		case 'days': 
	  			day += int.parse(splitedRange[0]);
	  			break;
	  		case 'month':
			case 'months': 
	  			month += int.parse(splitedRange[0]);
	  			break;
	  	}

	  	// Combine them into the desired format.
	  	final String formattedDate = '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year';

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

	Future<List<Map<String, dynamic>>> parseItems() async {
		final file = File('itemsDB.txt');
		late List<Map<String, dynamic>> parsedData;
		try {
			if (await file.exists()){
				final data = await file.readAsString();
				List<Map<String, dynamic>> dataJson = convert.jsonDecode(data);
				parsedData = dataJson;
			} else {
				return [{'none': 'none'}];
			}
		} catch (e) {
			console.error(e);
		}
		console.log(parsedData);
		return parsedData;
	}

	Future<List<Map<String, dynamic>>> getItems() async {
		final items = parseItems();
		return items;
	 	// return [
	 	// 	{
	 	// 		'name': 'Guitar',
	 	// 		'price': 500,
	 	// 		'range': '1-day',
	 	// 		'id': '1',
	 	// 		"isAvailable": true,
	 	// 	}, 
	 	// 	{
	 	// 		'name': 'Keyboard',
	 	// 		'price': 200,
	 	// 		'range': '1-month',
	 	// 		'id': '2',
	 	// 		"isAvailable": true,
	 	// 	}
	 	// ];
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
			console.error(e);
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