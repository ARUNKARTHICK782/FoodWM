
class DonationModel{
  String? _name;
  String? _itemname;
  int? _quantity;
  String? _mobile;
  String? _address;
  String? _city;
  String? _date;

  DonationModel(this._name,this._itemname, this._quantity, this._mobile, this._address,
      this._city, this._date);

  String? get date => _date;

  set date(String? value) {
    _date = value;
  }

  String? get city => _city;

  set city(String? value) {
    _city = value;
  }

  String? get address => _address;

  set address(String? value) {
    _address = value;
  }

  String? get mobile => _mobile;

  set mobile(String? value) {
    _mobile = value;
  }

  int? get quantity => _quantity;

  set quantity(int? value) {
    _quantity = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }


  String? get itemname => _itemname;

  set itemname(String? value) {
    _itemname = value;
  }

  factory DonationModel.fromJson(Map<String, dynamic> json){
    return DonationModel(json['name'],json['itemname'] ,json['quantity'], json['phno'], json['address'], json['city'], json['validity']);
  }
}