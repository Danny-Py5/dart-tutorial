import 'console.dart';
import "dart:convert" as convert;
import 'package:http/http.dart' as http;

final console = Console();

void main() async {
  var post = await fetchPost();
  console.log(post);
  console.log(post.title);
  console.log(post.userId);
  
}

Future<Post> fetchPost() async {
  var url = Uri.https('jsonplaceholder.typicode.com', 'posts/1');

    final response = await http.get(
    url,
    headers: {
      'User-Agent': 'Dart/3.0 (example)',
      'Accept': 'application/json',
    },
  );
  if (response.statusCode == 200){
    final Map<String, dynamic> post = convert.jsonDecode(response.body);
    return Post(post['title'], post['userId']);
  } else {
    throw Exception('Request Failed: Status code: ${response.statusCode}');
  }
  
}

class Post {
  String title;
  int userId;

  Post(this.title, this.userId);

  String toString() {
    return 'Post(${title}, ${userId})';
  }
}
