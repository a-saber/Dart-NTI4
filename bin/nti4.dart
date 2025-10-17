import 'dart:io';

void main() 
{
  List<Map<String, Map<String, dynamic>>> invoices = [];
  List<Map<String, dynamic>> products = [];
  displayOptions();
  int input = handleInput((String input)
  {
    int value= int.tryParse(input)??0;
    return (value >=1 && value <=6)? value : null;    
  });

  String name = handleInput();
  double price = handleInput((String input){
    double value = double.tryParse(input)??0;
    return (value>0) ? value : null;
  });
  print(input);

}

void displayOptions()
{
  print('''
--- Inventory Management System ---
Welcome to the Inventory Management System!
Options:
1. Add New Product
2. Show Products
3. Update Product
4. Purchase Products
5. Show Invoices
6. Exit
Please choose an option:
''');
}


dynamic handleInput([dynamic Function(String)? casting]){
  while(true){
    String input = stdin.readLineSync()??'';
    if(input.isEmpty){
      print('Invalid input. Please try again.');
    }
    else
    {
      var castedValue = casting==null? input : casting(input);
      if(castedValue == null)
      {
        print('Invalid input. Please try again.');
      }
      else{
        return castedValue;
      }
    }
  }
}