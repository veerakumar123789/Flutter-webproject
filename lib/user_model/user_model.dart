class UserModel {
    int? id;
    String? email;
    String? firstname;
    String? lastname;
    String? avatar;
    String? color;
    int? year;

    UserModel({
        this.id,
        this.email,
        this.firstname,
        this.lastname,
        this.avatar,
         this.color,
       this.year});

   factory UserModel.fromJson(Map<String ,dynamic> json){
        return UserModel(
         id: json['id'],

            firstname: json['name'] ?? 'First name',
             color: json['color'].toString().replaceAll("#", "") ?? "",
            year: json['year'] ?? ""
        );
    }
}