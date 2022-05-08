class RequestModel {
  String? _name;
  String? _email;
  String? _por;
  String? _no;
  String? _address;
  String? _city;
  String? _mobile;
  String? _mobile2;


  RequestModel(this._name, this._email, this._por, this._no, this._address, this._city,
      this._mobile, this._mobile2);


  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  String? get no => _no;

  set no(String? value) {
    _no = value;
  }

  String? get por => _por;

  set por(String? value) {
    _por = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }


  String? get address => _address;

  set address(String? value) {
    _address = value;
  }

  String? get city => _city;

  set city(String? value) {
    _city = value;
  }

  String? get mobile => _mobile;

  set mobile(String? value) {
    _mobile = value;
  }

  String? get mobile2 => _mobile2;

  set mobile2(String? value) {
    _mobile2 = value;
  }


  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(json['name'],json['email'],json['por'],json['noOfpeople'], json['address'],json['city'],json['phno'], json['emerphno']);
  }

}