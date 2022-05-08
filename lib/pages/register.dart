import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../routes.dart';
import '../styles.dart';
import 'home.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var username = TextEditingController();
  var password = TextEditingController();
  var city  = TextEditingController();
  var email = TextEditingController();
  var number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.fromLTRB(65, 100, 65, 0),
                child: Text("Registration", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(65, 50, 65, 0),
                child: TextField(
                  inputFormatters:[FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9 . @]'))],
                  onChanged: (s){
                    setState(() {

                    });
                  },
                  cursorColor:const Color(0xfff50f0f),
                  controller: username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:primary(), width: 2)
                    ),
                    labelText: 'Name',
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff334f7f)
                    ),
                  ),
                )
            ),
            Padding(padding: const EdgeInsets.fromLTRB(65, 50, 65, 0),
                child: TextField(

                  onChanged: (s){
                    setState(() {

                    });
                  },
                  cursorColor:const Color(0xfff50f0f),
                  controller: city,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    focusedBorder: OutlineInputBorder(

                        borderSide: BorderSide(color:primary(), width: 2)
                    ),
                    labelText: 'City',
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff334f7f)
                    ),
                  ),
                )),
            Padding(padding: const EdgeInsets.fromLTRB(65, 50, 65, 0),
                child: TextField(
                  onChanged: (s){
                    setState(() {

                    });
                  },
                  cursorColor:const Color(0xfff50f0f),
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    focusedBorder: OutlineInputBorder(

                        borderSide: BorderSide(color:primary(), width: 2)
                    ),
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff334f7f)
                    ),
                  ),
                )),
            Padding(padding: const EdgeInsets.fromLTRB(65, 50, 65, 0),
                child: TextField(
                  onChanged: (s){
                    setState(() {

                    });
                  },
                  keyboardType: TextInputType.number,
                  cursorColor:const Color(0xfff50f0f),
                  controller: number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    focusedBorder: OutlineInputBorder(

                        borderSide: BorderSide(color:primary(), width: 2)
                    ),
                    labelText: 'Mobile',
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff334f7f)
                    ),
                  ),
                )),
            Padding(padding: const EdgeInsets.fromLTRB(65, 50, 65, 0),
                child: TextField(
                  onChanged: (s){
                    setState(() {

                    });
                  },
                  obscureText: true,
                  cursorColor:const Color(0xfff50f0f),
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    focusedBorder: OutlineInputBorder(

                        borderSide: BorderSide(color:primary(), width: 2)
                    ),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff334f7f)
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(65, 50, 65, 0),
              child: ElevatedButton(
                  style: const ButtonStyle(

                  ),
                  onPressed: () async{
                    var req={
                      "name":username.text,
                      "city":city.text,
                      "email":email.text,
                      "phno":number.text,
                      "password":password.text
                    };
                    await register(req).then((v){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage() ));
                    });
                  },
                  child: const Text("Register")),
            )
          ],
        ),
      ),
    );
  }
}
