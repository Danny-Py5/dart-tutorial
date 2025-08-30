import 'console.dart';

final console = Console();

void main() async {
	
	final post = await fetchPost();
	console.log('${post.title}, ${post.userId}', true, true);

	// mimicking time.sleep() in python
	for (int x = 0; x < 10; ++x){
		await () {
			return Future.delayed(Duration(seconds: 1));
		}();
		console.log(x);
	}
}

Future<Post> fetchPost() {
	const delay = Duration(seconds: 4);

	return Future.delayed(delay, () {
			return Post('Post title', 123);
		});
}

class Post {
	String title;
	int userId;

	Post(this.title, this.userId);
}

