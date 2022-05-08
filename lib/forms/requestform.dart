import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../routes.dart';
import '../styles.dart';

class requestform extends StatefulWidget {
  const requestform({Key? key}) : super(key: key);

  @override
  State<requestform> createState() => _requestformState();
}

class _requestformState extends State<requestform> {
  var namecontr=TextEditingController();
  var emailcontr=TextEditingController();
  var noOfpeoplecontr=TextEditingController();
  var addresscontr=TextEditingController();
  var phnocontr=TextEditingController();
  var emerphnocontr=TextEditingController();
  var citycontr=TextEditingController();
  String dropdownValue="Home";
  List<String> cities = ['Ariyalur', 'Chennai', 'Coimbatore', 'Cuddalore', 'Dharmapuri', 'Dindigul', 'Erode', 'Kallakurichi', 'Kancheepuram', 'Kanyakumari', 'Karur', 'Krishnagiri', 'Madurai', 'Mayiladuthurai', 'Nagapattinam', 'Namakkal', 'Nilgiris', 'Perambalur', 'Pudukottai', 'Ramanathapuram', 'Salem', 'Sivaganga', 'Sivagangai', 'Thanjavur', 'Theni', 'Thiruvannamalai', 'Thiruvarur', 'Thoothukudi', 'Tiruchirappalli', 'Tirunelveli', 'Tiruppur', 'Tiruvallur', 'Tuticorin', 'Vellore', 'Villupuram', 'Virudhunagar'];
  var current = "Ariyalur";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              TextField(
                onChanged: (s){
                  setState(() {

                  });
                },
                cursorColor:const Color(0xfff50f0f),
                controller: namecontr,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2)
                  ),
                  labelText: 'Name',
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff334f7f)
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (s){
                  setState(() {

                  });
                },
                cursorColor:const Color(0xfff50f0f),
                controller: emailcontr,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2)
                  ),
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff334f7f)
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,

            children: [
                  Text("Place Of Requirement: ", style: TextStyle(color: primary(), fontSize: 15, fontWeight: FontWeight.bold),),

                  DropdownButton<String>(
                    value: dropdownValue,
                    iconSize: 0,
                    elevation: 16,
                    underline: Container(
                      height: 2,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Home', 'Orphanage', 'School']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
            ],
          ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (s){
                  setState(() {

                  });
                },
                cursorColor:const Color(0xfff50f0f),
                controller: noOfpeoplecontr,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2)
                  ),
                  labelText: 'No Of People',
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff334f7f)
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (s){
                  setState(() {

                  });
                },
                cursorColor:const Color(0xfff50f0f),
                controller: addresscontr,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2)
                  ),
                  labelText: 'Address',
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff334f7f)
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (s){
                  setState(() {

                  });
                },
                cursorColor:const Color(0xfff50f0f),
                controller: phnocontr,
                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2)
                  ),
                  labelText: 'Phno',
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff334f7f)
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (s){
                  setState(() {

                  });
                },
                cursorColor:const Color(0xfff50f0f),
                controller: emerphnocontr,
                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2)
                  ),
                  labelText: 'Emergency Phno',
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff334f7f)
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Text("Choose City: ", style: TextStyle(color: primary(), fontSize: 15, fontWeight: FontWeight.bold),),

                      DropdownButton<String>(

                          menuMaxHeight: 250,
                          value: current,
                          onChanged: (i){
                            setState(() {
                              current = i!;
                            });
                          },
                          items: cities.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),);
                          }).toList()),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){
                sendfoodrequest(namecontr.text,emailcontr.text,dropdownValue,noOfpeoplecontr.text,addresscontr.text,phnocontr.text,emerphnocontr.text,current);
              }, child: Text("Request"))
            ],
          ),
        ),
      ),
    );
  }
}
