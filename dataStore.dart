import 'console.dart';

final console = Console();


void main() {

	final dataStore = DataStore<String>();

	// with string
	dataStore.addItem('Daniel');
	dataStore.addItem('Kemisola');
	console.log(dataStore.getAllItems(), true, true);

	// with int 
	final dataStore2 = DataStore<int>();
	for (int i = 0; i < 8; ++i){
		dataStore2.addItem(i * 2);
	}
	console.log(dataStore2.getAllItems(), true);
	dataStore2.removeItem(8);
	console.log(dataStore2.getAllItems());



}

class DataStore<T> {
	List<T> store = [];

	void addItem(T item){
		store.add(item);
	}
	void removeItem(T item){
		store.remove(item);
	}
	List<T> getAllItems() {
		return store;
	}
}