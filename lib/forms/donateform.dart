import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../routes.dart';
import '../styles.dart';
import 'package:intl/intl.dart';

class donateform extends StatefulWidget {
  const donateform({Key? key}) : super(key: key);

  @override
  State<donateform> createState() => _donateformState();
}

class _donateformState extends State<donateform> {
  var namecontr=TextEditingController();
  var itemnamecontr=TextEditingController();
  var quantcontr=TextEditingController();
  var addresscontr=TextEditingController();
  var phnocontr=TextEditingController();
  var emerphnocontr=TextEditingController();
  var validitycont=TextEditingController();
  var datecontroller=TextEditingController();
  var citycontr=TextEditingController();
  String selectedDate="";
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
                controller: itemnamecontr,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2)
                  ),
                  labelText: 'ItemName',
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
                controller: quantcontr,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2)
                  ),
                  labelText: 'Quantity',
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
                keyboardType: TextInputType.number,

                cursorColor:const Color(0xfff50f0f),
                controller: phnocontr,
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
              TextField(
                onChanged: (s){
                  setState(() {

                  });
                },
                keyboardType: TextInputType.number,

                cursorColor:const Color(0xfff50f0f),
                controller: datecontroller,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2)
                  ),
                  labelText: 'Valid till',
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff334f7f)
                  ),
                  suffixIcon: IconButton(icon: Icon(Icons.today),onPressed: (){
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050),
                          ).then((date) {
                      final DateFormat formatter =
                      DateFormat('dd-MM-yyyy');
                      final String formatted =
                      formatter.format(date!);
                      setState(() {
                        datecontroller.text = formatted;
                        selectedDate = formatted;
                      });
                    });;
                  },)
                ),
              ),
              // onTap: (){
              //
              // },
              ElevatedButton(onPressed: () async {
                var donation={
                  "name":namecontr.text,
                  "itemname":itemnamecontr.text,
                  "quantity":int.parse(quantcontr.text),
                  "address":addresscontr.text,
                  "phno":phnocontr.text,
                  "validity":selectedDate,
                  "city":current,
                };
                await senddonaterequest(donation);
              }, child: Text("Donate"))
            ],
          ),
        ),
      ),
    );
  }
}
