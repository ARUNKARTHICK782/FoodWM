import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/donation.dart';
import 'models/request.dart';

List<RequestModel> requests = [];
List<DonationModel> donations = [];

getRequest() async{
  requests.clear();
  var res=await http.get(
    Uri.parse("https://foodwm.herokuapp.com/api/request/showrequests"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2Mjc2Njc2OTBjNTAwMzdmNDE1MWE5MTIiLCJuYW1lIjoiYXJ1biIsImlhdCI6MTY1MTkyNjg4OX0.BaOaa9S0Tse3-iGmI8fG_lx4WXMerR5ceAlsPA3q5C4'
    },
  );

  var resp = json.decode(res.body);

  for(var i in resp){
    RequestModel request = RequestModel.fromJson(i);
    requests.add(request);
  }
}

getDonation() async{
  donations.clear();
  var res=await http.get(
    Uri.parse("https://foodwm.herokuapp.com/api/donate/showdonation"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2Mjc2Njc2OTBjNTAwMzdmNDE1MWE5MTIiLCJuYW1lIjoiYXJ1biIsImlhdCI6MTY1MTkyNjg4OX0.BaOaa9S0Tse3-iGmI8fG_lx4WXMerR5ceAlsPA3q5C4'
    },
  );

  var resp = json.decode(res.body);

  for(var i in resp){
    if(i['por'] == 'orphanage'){
      DonationModel donation = DonationModel.fromJson(i);
      donations.add(donation);
    }
    else if(i['por'] == 'home'){
      DonationModel donation = DonationModel.fromJson(i);
      donations.add(donation);
    }
    else{
      DonationModel donation = DonationModel.fromJson(i);
      donations.add(donation);
    }
  }
}

login(String? email, String? password) async{
  var temp = {
    "email": email.toString(),
    "password": password.toString()
  };

  print(temp);

  var res=await http.post(
    Uri.parse("https://foodwm.herokuapp.com/api/user/check"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      //'auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2Mjc2Njc2OTBjNTAwMzdmNDE1MWE5MTIiLCJuYW1lIjoiYXJ1biIsImlhdCI6MTY1MTkyNjg4OX0.BaOaa9S0Tse3-iGmI8fG_lx4WXMerR5ceAlsPA3q5C4',

    },
    body: json.encode(temp),
  );
  //print(res.headers['auth-token']);
  String token=res.headers['auth-token'].toString();
  var prefs=await SharedPreferences.getInstance();
  prefs.setString("token",token);
  print(res.body);
  return res.body;
}

register(var temp) async{
  var res=await http.post(
    Uri.parse("https://foodwm.herokuapp.com/api/user/register"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      //'auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2Mjc2Njc2OTBjNTAwMzdmNDE1MWE5MTIiLCJuYW1lIjoiYXJ1biIsImlhdCI6MTY1MTkyNjg4OX0.BaOaa9S0Tse3-iGmI8fG_lx4WXMerR5ceAlsPA3q5C4',
    },
    body: json.encode(temp),
  );
  String token=res.headers['auth-token'].toString();
  var prefs=await SharedPreferences.getInstance();
  prefs.setString("token",token);
  print(res.body);
}

void makecall(int number) async {
  await launch("tel: $number");
}

senddonaterequest(var donation) async {
  var prefs=await SharedPreferences.getInstance();
  String token=await prefs.getString("token").toString();
  var res=await http.post(
    Uri.parse("https://foodwm.herokuapp.com/api/donate/donatefood"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'auth-token': token,
    },
    body: json.encode(donation),
  );
  print(res.body);
}



Future<void> sendfoodrequest(String name,String email,String por,String nop,String address,String phno, String emerphno,String city) async {
  var temp={
    "name":name,
    "email":email,
    "por":por,
    "noOfpeople":nop,
    "address":address,
    "phno":phno,
    "emerphno":emerphno,
    "city":city,
  };
  var prefs=await SharedPreferences.getInstance();
  String token=await prefs.getString("token").toString();
  print(token);
  var res=await http.post(
    Uri.parse("https://foodwm.herokuapp.com/api/request/requestfood"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'auth-token': token,
    },
    body: json.encode(temp),
  );
  print(res.body);
}

sendMailtorequester(String email) async {
  var prefs=await SharedPreferences.getInstance();
  String token=await prefs.getString("token").toString();
  print("token"+token);
  print("in sentmailtorequeste");
  var toemail={
    "toemail":email,
  };
  print(toemail);
  var res=await http.post(
    Uri.parse("https://foodwm.herokuapp.com/api/mail/sentdonar"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'auth-token':token
    },
    body: json.encode(toemail),
  );
  print(res.body);
}