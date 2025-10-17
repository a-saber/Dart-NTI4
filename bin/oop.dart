
class Person
{
  String? name;
  int? age;

  Person( {this.age, this.name,});
  Person.fromMap(Map<String, dynamic> data)
  {
    this.name = data['name'];
    this.age = data['age'];
  }
  Person.from(Person source)
  {
    this.name = source.name;
    this.age = source.age;
  }
  void displayInfo(){
    print('Name: $name, Age: $age');
  }
}

void main(){
Map<String, dynamic>  x= {
  "name": "Ahmed",
  "age": 25
};
  Person p1 = Person(age: 30, name: "Mohamed");
  Person p2 = Person.fromMap(x);

  Person p3 = Person.from(p2);
  p3.name = "Ali";

  p1.displayInfo();
  p2.displayInfo();
  p3.displayInfo();
  print(p1 is Person);
}