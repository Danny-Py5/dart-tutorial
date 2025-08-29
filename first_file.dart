class Console {
  void log(Object? value) {
    print(value);
  }
}

final console = Console();


void main() {
   /* var name = 'Daniel';

   final currentTime = DateTime.now();
   print('Current Time now is: $currentTime');

   final age = DateTime.now().year - 2004;  
   print(age);

   const number = 40;
   print('$number + 10 = ${number + 10}');
   print('$number - 10 = ${number - 10}');
   print('$number x 10 = ${number * 10}');
   print('$number / 10 = ${number / 10}'); */

   // variable type
   String name = 'Kemisola';
   bool isGirlFriend = true;
   const ID = 440001;
   int number = 2323;

   double decimal = 44.5;
   double intDecimal = 4;
   intDecimal = 4.3;

   // const and final type
   final DateTime currentTime = DateTime.now();
   const int age2 = 33;
   // age2 = 33 // can't be changed 


   // null variable
   bool? num1;
   // print(num1); // null

   dynamic name2 = 'Grace';
   name2 = 4; 


   String n;

   var busName = 'Toyota';
   console.log(busName);

   var sss ;
   print(sss);


}

// seudebglobalprint@gmail.com 
// 