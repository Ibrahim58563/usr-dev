class UserModel{
  String? pid;
  String? email;
UserModel({this.pid, this.email});
factory UserModel.fromMap(map)
{
  return UserModel(
    pid: map ['pid'],
    email:map ['email'],

  );
}

Map <String , dynamic> toMap(){

  return{
    'pid': pid ,
    'email': email ,


  };
}
}

