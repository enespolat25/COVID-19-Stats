class Country {

  static final Country _country = Country.singleton();

  factory Country() {
    return _country;
  }

  Country.singleton();

  String countryName;
  String countryCode;
  String slug;
  var newConfirmed;
  var totalConfirmed;
  var newDeaths;
  var totalDeaths;
  var newRecovered;
  var totalRecovered;
  var date;

  Country userCountry;

  List<Country> cLst;

  Country.fromJson(Map json) {
    this.countryName = json['Country'];
    this.countryCode = json['CountryCode'];
    this.slug = json['Slug'];
    this.newConfirmed = json['NewConfirmed'];
    this.totalConfirmed = json['TotalConfirmed'];
    this.newDeaths = json['NewDeaths'];
    this.totalDeaths = json['TotalDeaths'];
    this.newRecovered = json['NewRecovered'];
    this.totalRecovered = json['TotalRecovered'];
    this.date = json['Date'];
  }

  void setList(List<Country> cLst){
    Country._country.cLst = cLst;
  }

  List<Country> getList(){
    return cLst;
  }

  void setUserCountry(Country userCountry){
    _country.userCountry = userCountry;
  }

  Country getUserCountry(){
    return _country.userCountry;
  }

}