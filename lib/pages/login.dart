import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodwm/pages/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Routes.dart';
import '../components.dart';
import '../styles.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var username = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: const EdgeInsets.fromLTRB(65, 100, 65, 0),
              child: TextField(
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
                    labelText: 'Username',
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
                onPressed: () async {
                  print(username.text);
                  var result = await login(username.text, password.text);
                  print(result);
                  if(result == 'success'){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                  }
                  else{
                    toast("Invalid Username or Password");
                  }

                },
                child: const Text("Login")),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(65, 50, 65, 0),
            child: Row(
              children: [
                const Text("Don't Have an Account?"),
                TextButton(
                    onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                    },
                    child: const Text("Register Here")),
              ],
            )
          ),

        ],
      ),
    );
  }
}
