enum CarBrands { Toyota, Ford, BMW }
 
 abstract class Animal{
  String? name;
  Animal(this.name);
  void makeSound();
  void sleep(){}
}
class Cat implements Animal {
  @override
  String? name;

  Cat({this.name});
  @override
  void makeSound() {
    
  }
  @override
  void sleep() {
    
  }

  

}
class Dog extends Animal {
  Dog(super.name);

  @override
  void makeSound() {
    print("Bark");
  }
}
test(CarBrands car){

  switch(car)
  {
    case CarBrands.BMW:
      print("BMW selected");
      break;
    case CarBrands.Ford:
      print("Ford selected");
      break;
    case CarBrands.Toyota:
      print("Toyota selected");
      break;
  }
}
void main(){
  // test(Animal());
  // test(Cat());
  // test(Dog());
  
}

class Shape
{
  Shape._internal();
  static Shape _instance = Shape._internal();
  factory Shape(){
    return _instance;
  }
  void displayInfo()
  {
    print("This is a shape");
  }
}