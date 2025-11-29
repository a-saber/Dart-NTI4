
List<Map<String, dynamic>> usersListMap = 
[
  {
    'name': 'Alice',
    'age': 25,
  },
  {
    'name': 'Bob',
    'age': 28,
  },
];

class UserModel{
  String? name;
  int? age;

  UserModel({required this.name, required this.age});

  UserModel.fromMap(Map<String, dynamic> map){
    name = map['name'];
    age = map['age'];
  }
}
void main(){
  List<UserModel> usersList = [];
  for(var item in usersListMap){
    usersList.add(UserModel.fromMap(item));
  }
}