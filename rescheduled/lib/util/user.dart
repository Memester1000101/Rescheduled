
class User{
  int id;
  String username;
  String password;
  
  User(this.id, this.username, this.password);
  
  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'id': id,
      'username':username,
      'password':password,
    };
    return map;

  }
  User.fromMap(Map<String,dynamic>map){
    id = map['id'];
    username = map['username'];
    password = map['password'];
  }
}