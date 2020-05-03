class Global {

  static final Global _global = Global.singleton();

  factory Global() {
    return _global;
  }

  Global.singleton();

  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

  void fromJson(Map json) {
    _global.newConfirmed = json['NewConfirmed'];
    _global.totalConfirmed = json['TotalConfirmed'];
    _global.newDeaths = json['NewDeaths'];
    _global.totalDeaths = json['TotalDeaths'];
    _global.newRecovered = json['NewRecovered'];
    _global.totalRecovered = json['TotalRecovered'];
  }

}