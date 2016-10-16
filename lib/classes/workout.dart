class Workout {
  int Id = 0;
  String Country = "";
  String Type = "";
  String Localization = "";
  DateTime Date = new DateTime.now();
  String Style = "";
  String Description = "";
  String Rate = "";
  bool IsSelected = false;
  bool isDirty = false;
  String Name = "";
  int Rating = 0;

  static Workout deserialize(input) {
    var result = new Workout("NewName");
    result.Id = input.Id;
    result.Country = input.Country;
    result.Date = input.Date;
    result.Type = input.Type;
    result.Localization = input.Localization;
    result.Style = input.Style;
    result.Rate = input.Rate;
    result.Description = input.Description;
    result.Date = input.Date;
    result.Name = input.Name;
    result.isDirty = input.isDirty;
    return result;
  }

  int CalculateRating() {
    int result = 0;
    if (this.Rate == '6a') this.Rating = 100;
    if (this.Rate == '6a+') this.Rating = 150;
    if (this.Rate == '6b') this.Rating = 200;
    if (this.Rate == '6b+') this.Rating = 250;
    if (this.Rate == '6c') this.Rating = 300;
    if (this.Rate == '6c+') this.Rating = 350;
    if (this.Rate == '7a') this.Rating = 400;
    if (this.Rate == '7a+') this.Rating = 450;
    if (this.Rate == '7b') this.Rating = 500;
    if (this.Rate == '7b+') this.Rating = 550;
    if (this.Rate == '7c') this.Rating = 600;
    if (this.Rate == '7c+') this.Rating = 650;
    if (this.Rate == '8a') this.Rating = 700;
    if (this.Rate == '8a+') this.Rating = 750;
    if (this.Rate == '8b') this.Rating = 800;
    if (this.Rate == '8b+') this.Rating = 850;
    if (this.Rate == '8c') this.Rating = 900;
    if (this.Rate == '8c+') this.Rating = 950;
    if (this.Rate == '9a') this.Rating = 1000;
    if (this.Rate == '9a+') this.Rating = 1050;
    if (this.Rate == '9b') this.Rating = 1100;
    if (this.Rate == '9b+') this.Rating = 1150;
    switch (this.Style) {
      case 'RP':
        break;
      case 'Flash':
        this.Rating += 50;
        break;
      case 'OS':
        this.Rating += 125;
        break;
      default:
        break;
    }

    return result;
  }

  Workout(
      [this.Name,
      this.Id,
      this.Country,
      this.Description,
      this.Localization,
      this.Type,
      this.Style,
      this.Rate,
      this.Date,
      this.Rating]);

  Workout.fromMap(Map map)
      : this(
            map['Name'],
            map['Id'],
            map['Country'],
            map['Description'],
            map['Localization'],
            map['Type'],
            map['Style'],
            map['Rate'],
            map['Date'],
            map['Rating']);

  Map toMap() => {
        "Name": Name,
        "Id": Id,
        "Country": Country,
        "Type": Type,
        "Date": Date,
        "Localization": Localization,
        "Style": Style,
        "Description": Description,
        "Rate": Rate,
        "Rating": Rating
      };
  String toString() => '$Id: $Name TEST';
}
