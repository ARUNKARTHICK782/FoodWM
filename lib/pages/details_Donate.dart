import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components.dart';
import '../models/donation.dart';
import '../routes.dart';
import '../styles.dart';

class DOD extends StatefulWidget {
  final DonationModel donation;
  const DOD(this.donation, {Key? key}) : super(key: key);

  @override
  State<DOD> createState() => _DODState();
}

class _DODState extends State<DOD> {
  bool checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary(),
        title: const Text("FWM"),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                      Text("Donate Person Name: ", style: default_teststyle(),),
                      Text(widget.donation.name.toString()[0].toUpperCase()+widget.donation.name.toString().substring(1,),style: dynamic_teststyle(),)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Available Quantity: ", style: default_teststyle(),),
                      Text(widget.donation.quantity.toString(),style: dynamic_teststyle(),)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Address Line 1: ", style: default_teststyle(),),
                      Expanded(
                        child: Text(
                          widget.donation.address.toString(),
                          style: dynamic_teststyle(),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("City: ", style: default_teststyle(),),
                      Text(widget.donation.city.toString()[0].toUpperCase()+widget.donation.city.toString().substring(1),style: dynamic_teststyle(),)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Contact Number 1: ", style: default_teststyle(),),
                      Text(widget.donation.mobile.toString(),style: dynamic_teststyle(),)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Availability: ", style: default_teststyle(),),
                      Text(widget.donation.date.toString().substring(0,10),style: dynamic_teststyle(),)
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

                  ElevatedButton(onPressed: (){

                  }, child: const Text("Request and Sent Notifications"),
                    style: ElevatedButton.styleFrom(primary: primary()),

                  ),
                  Text("OR", style: TextStyle(fontSize: 15),),
                  ElevatedButton(onPressed: (){
                    
                    checkbox?makecall(int.parse(widget.donation.mobile.toString())):toast("Accept the Terms and Conditions");
                  }, child: const Text("Call and Verify"),
                    style: ElevatedButton.styleFrom(primary: primary()),

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}