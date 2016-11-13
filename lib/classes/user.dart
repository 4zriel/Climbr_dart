class User {
  String UID = "";
  String Email = "";
  String Name = "";
  String PrividerId = "";
  String PhotoUrl = "";
  String RefreshToken = "";
  String Password = "";

  User(
      [this.UID,
      this.Email,
      this.Name,
      this.PrividerId,
      this.PhotoUrl,
      this.RefreshToken,
      this.Password]);

  User.fromMap(Map map)
      : this(map['UID'], map['Email'], map['Name'], map['PrividerId'],
            map['PhotoUrl'], map['RefreshToken'], map['Password']);

  Map toMap() => {
        "UID": UID,
        "Email": Email,
        "Name": Name,
        "PrividerId": PrividerId,
        "PhotoUrl": PhotoUrl,
        "RefreshToken": RefreshToken,
        "Password": Password
      };
  String toString() => '$UID: $Name';
}
