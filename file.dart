import 'dart:io';

void main() async {
	final f = write();

	final fileContent = await read();
	print(fileContent);
} 

Future<void> write() async {
	final file = File('exampleFile.txt');

	try {
		await file.writeAsString('Hello world\nTHis is an example txt file');
		print('Written successfully');
	} catch (e) {
		print('Error: $e');
	} finally {
		print('Execution completed');
	}
}

Future<String> read() async {
	final file = File('exampleFile.txt');

	try {
		final content = await file.readAsString();
		return content;
	} catch (e){
		return 'Error: $e';
	} 
}
