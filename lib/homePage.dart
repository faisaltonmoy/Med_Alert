import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample/addMed.dart';

class homePage extends StatefulWidget {
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String curDate = DateFormat.yMMMMd('en_US').format(DateTime.now());
  String curDay = DateFormat.EEEE().format(DateTime.now());

  String morn = '12:00';
  String noon = '17:00';
  String night = '23:59';

  String exList() {
    if (morn.compareTo(DateFormat.Hm().format(DateTime.now())) > 0)
      return 'Morning Meds';
    else if (noon.compareTo(DateFormat.Hm().format(DateTime.now())) > 0)
      return 'Afternoon Meds';
    else if (night.compareTo(DateFormat.Hm().format(DateTime.now())) > 0)
      return 'Night Meds';
  }

  Widget build(BuildContext) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(35, 50, 35, 10),
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                curDate,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                curDay,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                exList(),
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ExpansionTile(
                title: Text('Morning'),
                children: <Widget>[
                  //if(exList() == '1')
                  ListTile(
                    leading: Icon(Icons.access_alarm),
                    title: Text('Med Name'),
                    subtitle: Text('Small desc'),
                    trailing: new Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      //PopAlert(context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              ExpansionTile(
                title: Text('AfterNoon'),
                children: <Widget>[
                  //if(exList() == '2')
                  ListTile(
                    leading: Icon(Icons.access_alarm),
                    title: Text('Med Name'),
                    subtitle: Text('Small desc'),
                    trailing: new Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      //PopAlert(context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              ExpansionTile(
                title: Text('Night'),
                children: <Widget>[
                  //f(exList() == '3')
                  ListTile(
                    leading: Icon(Icons.access_alarm),
                    title: Text('Med Name'),
                    subtitle: Text('Small desc'),
                    trailing: new Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // PopAlert(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: 'Add',
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => addMed()),
            );
          }),
    );
  }
}
