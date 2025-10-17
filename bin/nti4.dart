import 'dart:io';

void main() 
{
  List<Map<String, Map<String, dynamic>>> invoices = [];
  List<Map<String, dynamic>> products = [];
  while(true){
    displayOptions();
    int option = handleInput(
      prompt: "Enter Option Number (1-6):",
      casting: (String input)
      {
        int value= int.tryParse(input)??0;
        return (value >=1 && value <=6)? value : null;    
      }
    );

    switch (option) {
      case 1:
        // Add New Product
        addProduct(products);

      case 2:
      // show products with quantity > 0
      for(var product in products)
      {
        if(product['quantity'] > 0)
        {
          print("${product['name']} \$${product['price']} , Qty: ${product['quantity']}");
        }
      }

      case 3:
      // update product
      updateProduct(products);



      case 6:
        // Exit
        print('Exiting Inventory Management System. Goodbye!');
        return;
    } 
  }


  // String name = handleInput();
  // double price = handleInput((String input){
  //   double value = double.tryParse(input)??0;
  //   return (value>0) ? value : null;
  // });
  // print(input);

}
void updateProduct(List<Map<String, dynamic>> products)
{
      // input produt index
    int productIndex =handleInput(
      prompt: "Enter Product Number",
      casting: (String input)
      {
        int value = int.tryParse(input)??-1;
        return (value >=0 && value < products.length)? value-1 : null;
      }
    );
      
          int productQuantity = handleInput(
        prompt: "Enter Product Quantity:",
        casting: (String input)
        {
          int value = int.tryParse(input)??0;
          return (value>0) ? value : null;
        }
      );
      products[productIndex]['quantity'] = productQuantity;
}
void addProduct(List<Map<String, dynamic>> products)
{
      String productName = handleInput(prompt: "Enter Product Name:");
    double productPrice = handleInput(
      prompt: "Enter Product Price:",
      casting: (String input)
      {
        double value = double.tryParse(input)??0;
        return (value>0) ? value : null;
      }
    );
    int productQuantity = handleInput(
      prompt: "Enter Product Quantity:",
      casting: (String input)
      {
        int value = int.tryParse(input)??0;
        return (value>0) ? value : null;
      }
    );
    // add to products list
    products.add({
      'name': productName,
      'price': productPrice,
      'quantity': productQuantity
    });
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

''');
}


dynamic handleInput({String prompt = "Enter Value:", dynamic Function(String)? casting}) {
  print(prompt);
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