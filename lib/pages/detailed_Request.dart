import 'package:flutter/material.dart';

import '../components.dart';
import '../models/request.dart';
import '../routes.dart';
import '../styles.dart';

class DOR extends StatefulWidget {
  final RequestModel request;
  const DOR(this.request, {Key? key}) : super(key: key);

  @override
  State<DOR> createState() => _DORState();
}

class _DORState extends State<DOR> {
  bool checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary(),
        title: const Text("FWM"),
      ),
      body: Column(
        children: [
          const Image(image: AssetImage('images/dor_Banner.png')),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child:
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Place of Requirement: ", style: default_teststyle(),),
                      Text(widget.request.por.toString().toUpperCase(), style: dynamic_teststyle(),)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Request Person Name: ", style: default_teststyle(),),
                      Text(widget.request.name.toString(),style: dynamic_teststyle(),)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Email: ", style: default_teststyle(),),
                      Text(widget.request.email.toString(),style: dynamic_teststyle(),)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Address Line 1: ", style: default_teststyle(),),
                      Expanded(child: Text(widget.request.address.toString(),style: dynamic_teststyle(),))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("City: ", style: default_teststyle(),),
                      Text(widget.request.city.toString()[0].toUpperCase()+widget.request.city.toString().substring(1),style: dynamic_teststyle(),)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Contact Number 1: ", style: default_teststyle(),),
                      Text(widget.request.mobile.toString(),style: dynamic_teststyle(),)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Contact Number 2: ", style: default_teststyle(),),
                      Text(widget.request.mobile2.toString(),style: dynamic_teststyle(),)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(value: checkbox, onChanged: (i){
                        setState(() {
                          checkbox = !checkbox;
                        });
                      }),
                      Flexible(
                        child: Text("By Clicking you are confirming, I am fully responsible for the details which are to sent to this person",style: TextStyle(
                          fontSize: 12,
                          color: primary(),
                          overflow:TextOverflow.visible
                        ),),
                      )
                    ],
                  ),

                  ElevatedButton(onPressed: () async{
                    print("clicked");
                    await sendMailtorequester(widget.request.email.toString());
                  }, child: Text("Donate and Sent Notification"),
                    style: ElevatedButton.styleFrom(primary: primary()),

                  ),
                  Text("OR", style: TextStyle(fontSize: 15),),
                  ElevatedButton(onPressed: () async{

                    checkbox?makecall(int.parse(widget.request.mobile.toString())):toast("Accept the Terms and Conditions");
                  }, child: const Text("Call and Verify"),
                    style: ElevatedButton.styleFrom(primary: primary()),

                  ),
                ],
              ),
           ),
        ],
      ),
    );
  }
}
