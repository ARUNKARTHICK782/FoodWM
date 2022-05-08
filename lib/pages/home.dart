import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../forms/donateform.dart';
import '../forms/requestform.dart';
import '../routes.dart';
import '../styles.dart';
import 'detailed_Request.dart';
import 'details_Donate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> widgets=[
    const RequestPage(),
    const DonatePage(),
  ];
  int page=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: widgets[page]
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) {
          setState(() {
            if (page != i) {
              page = i;
            }
          });
        },
        selectedItemColor: primary(),
        currentIndex: page,
        items: const [
          BottomNavigationBarItem(
              label: "Request", icon: Icon(Icons.note_add_sharp)),
          BottomNavigationBarItem(
              label: "Donate", icon: Icon(CupertinoIcons.heart_fill)),

        ],

      ),
    );
  }
}

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  List<String> cities = ["Sort by City",'Ariyalur', 'Chennai', 'Coimbatore', 'Cuddalore', 'Dharmapuri', 'Dindigul', 'Erode', 'Kallakurichi', 'Kancheepuram', 'Kanyakumari', 'Karur', 'Krishnagiri', 'Madurai', 'Mayiladuthurai', 'Nagapattinam', 'Namakkal', 'Nilgiris', 'Perambalur', 'Pudukottai', 'Ramanathapuram', 'Salem', 'Sivaganga', 'Sivagangai', 'Thanjavur', 'Theni', 'Thiruvannamalai', 'Thiruvarur', 'Thoothukudi', 'Tiruchirappalli', 'Tirunelveli', 'Tiruppur', 'Tiruvallur', 'Tuticorin', 'Vellore', 'Villupuram', 'Virudhunagar'];

  var current = "Sort by City";

  @override
  void initState() {
    print("in initstate");
    getRequest().then((v) {
      mounted?setState(() {

      }):null;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primary(),
        title: const Text("FWM"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Image(image: AssetImage("images/donate_Banner.png")),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                  Center(
                    child: DropdownButton<String>(
                      icon: const Icon(Icons.sort),
                      iconSize: 30,
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
                  )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(

                  itemCount: requests.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(

                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DOR(requests.elementAt(index))));
                          },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(35, 25, 35, 0),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 100),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    flex:3,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children:  [

                                        Text("Person Name : "+requests.elementAt(index).name.toString()),
                                        Text("Email : "+requests.elementAt(index).email.toString()),
                                        Text("Asking For : "+requests.elementAt(index).por.toString()),
                                        Text("Address : "+requests.elementAt(index).address.toString()),
                                        Text("City : "+requests.elementAt(index).city.toString()),
                                        Text("Phno 1 : "+requests.elementAt(index).mobile.toString()),
                                        Text("Phno 2 : "+requests.elementAt(index).mobile2.toString()),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                      child: (requests
                                                  .elementAt(index)
                                                  .por
                                                  .toString() ==
                                              'orphanage')
                                          ? Image(
                                              image: AssetImage(
                                                  "images/type1.png"))
                                          : (requests
                                                      .elementAt(index)
                                                      .por
                                                      .toString() ==
                                                  'home')
                                              ? Image(
                                                  image: AssetImage(
                                                      'images/type2.png'),
                                                )
                                              : Image(
                                                  image: AssetImage(
                                                      'images/type3.png')))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: primary(),
          child: const Icon(Icons.add),
          onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => requestform())).then((value) {
                initState();
              });
          }
          ),
    );
  }


}

class DonatePage extends StatefulWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  List<String> cities = ["Sort by City",'Ariyalur', 'Chennai', 'Coimbatore', 'Cuddalore', 'Dharmapuri', 'Dindigul', 'Erode', 'Kallakurichi', 'Kancheepuram', 'Kanyakumari', 'Karur', 'Krishnagiri', 'Madurai', 'Mayiladuthurai', 'Nagapattinam', 'Namakkal', 'Nilgiris', 'Perambalur', 'Pudukottai', 'Ramanathapuram', 'Salem', 'Sivaganga', 'Sivagangai', 'Thanjavur', 'Theni', 'Thiruvannamalai', 'Thiruvarur', 'Thoothukudi', 'Tiruchirappalli', 'Tirunelveli', 'Tiruppur', 'Tiruvallur', 'Tuticorin', 'Vellore', 'Villupuram', 'Virudhunagar'];
  var current = "Sort by City";
  @override
  void initState() {
    super.initState();
    getDonation().then((v) {
      mounted?setState(() {

      }):null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primary(),
        title: const Text("FWM"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Image(image: AssetImage("images/donate_Banner.png")),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: DropdownButton<String>(
                      icon: const Icon(Icons.sort),
                      iconSize: 30,
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
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: donations.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DOD(donations.elementAt(index))));
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(35, 25, 35, 0),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Container(
                          height: 200,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:  [
                                    Text("Donor name : "+donations.elementAt(index).name.toString()),
                                    Text("Item name : "+donations.elementAt(index).itemname.toString()),
                                    Text("Quantity : "+donations.elementAt(index).quantity.toString()),
                                    Text("Address : "+donations.elementAt(index).address.toString()),
                                    Text("City : "+donations.elementAt(index).city.toString()),
                                    Text("Phno : "+donations.elementAt(index).mobile.toString()),
                                    Text("Valid till : "+donations.elementAt(index).date.toString().substring(0,10)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: primary(),
          child: const Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => donateform())).then((value) {
              initState();
            });
          }
      ),
    );
  }
}


