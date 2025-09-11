import 'dart:io';
import 'dart:convert' as convert;
import '../console.dart';

final console = Console();

Future<void> main() async {

	final itemsDB = ItemsDB();
	// await itemsDB.saveItem({
	// 	'name': 'Guitar',
	// 	'price': 800,
	// 	'range': '4-day',
	// 	'id': '2',
	// 	"isAvailable": true,
	// });

	final user = User('Daniel', 21, 'Geto ago-alaye odigbo local government ondo state Nigeria');
	
	final rental = Rental(user);
	final details = await rental.rent('Speaker', 7);
	console.log(details);
	console.log(await rental.getRentersAmount());

}


class Rental {

	final itemsDB = ItemsDB();
	late final items = itemsDB.getItems();
	User user; 


	Rental(this.user);

	Future<Map<String, dynamic>>? rent(String itemName, [int quantity = 1]) async {
		for (Map<String, dynamic> item in await items){
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
						itemsDB.saveRent(rentDetails);
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
		return {
	 		'info': "We don't have $itemName in stock currently, check-in next time.",
	 	};
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

	Future<void> printRenters() async {
		final renters = await itemsDB.getRents();
		for (final renter in renters) {
			console.log(renter);
			console.log('\n');
		}
	}
	Future<int> getRentersAmount() async {
		final renters = await itemsDB.getRents();
		return renters.length;
	}
}

class ItemsDB {

	final rentersFIle = File('renters.txt');
	final itemsDbFile = File('itemsDbFile.txt');

	Future<List<Map<String, dynamic>>> parseItems() async {
		try {
			if (await itemsDbFile.exists()){
				final data = await itemsDbFile.readAsString();
				final List<Map<String, dynamic>> dataJson = (convert.jsonDecode(data) as List).cast<Map<String, dynamic>>();
				return dataJson;
			} else {
				return [];
			}
		} catch (e) {
			console.log('Error decoding JSON file: $e');;
			return [];
		}
	}

	Future<void> saveItem(Map<String, dynamic> item) async {
		final existingItems = await getItems();
		existingItems.add(item);
		final encodedItems = convert.jsonEncode(existingItems);
		try{
			await itemsDbFile.writeAsString(encodedItems);
		} catch (e) {
			console.error(e);
		}
	}

	Future<List<Map<String, dynamic>>> getItems() async {
		final items = parseItems();
		return items;
	}	

	Future<void> saveRent(data) async {
		final availableRents = await getRents();
		availableRents.add(data);
		final jsonData = convert.jsonEncode(availableRents);

		try{
			await rentersFIle.writeAsString(jsonData); 
		} catch (e) {
			console.error(e);
		}
	}
	Future<dynamic> getRents() async {
		try {
			if (await rentersFIle.exists()) {
				final data = await rentersFIle.readAsString();
				final jsonDecode = convert.jsonDecode(data);
				return jsonDecode;
			} else {
				return [];
			}
		} catch (e) {
			console.error(e);
			return [];
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