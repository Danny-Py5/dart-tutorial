import "console.dart" as c;
import "dart:convert" as convert;
import "package:http/http.dart" as http;

final console = c.Console();

void main() async {
	final users = await fetchData();
	console.log(users);
}


Future<dynamic> fetchData() async {
	try {
		var url = Uri.https('jsonplaceholder.typicode.com', 'users/');
		final response = await http.get(url, 
			headers: {
				'User-Agent': 'Dart/3.0 (example)',
      			'Accept': 'application/json',
			});
		if (response.statusCode == 200) {
			return convert.jsonDecode(response.body);
		} else {
			throw Exception('Failed fetching data. Status code: ${response.statusCode}');
		}
	} on http.ClientException catch (e) {
  		// This will catch HTTP client-specific errors
  		console.log('HTTP error: $e');
  	} catch (e) {
		console.log(e);
	} finally {
		console.log('Request completed ✅ (closing resources or cleaning up)');
	}
}