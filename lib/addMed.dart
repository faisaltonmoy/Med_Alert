import 'package:flutter/material.dart';
import 'checkboxModel.dart';

class addMed extends StatefulWidget {
  _addMedState createState() => _addMedState();
}

String msg = " ";
String time = " ";

class _addMedState extends State<addMed> {
  Future<void> _showTimePicker() async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      time = (picked.format(context));
    }
    if (picked == null) {
      val = false;
      print(
          "Hi bro, i came from cancel button or via click outside of datepicker");
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop(true);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  List dayTime = ["Tablet", "Syrup", "Insulin"];
  String _currentValue;

  List<checkboxModel> _dropAvil = new List<checkboxModel>();

  void initState() {
    _dropAvil.addAll({
      checkboxModel(id: 1, name: "Morning", selected: false),
      checkboxModel(id: 2, name: "Afternoon", selected: false),
      checkboxModel(id: 3, name: "Night", selected: false),
    });
  }

  bool val = false;

  TextEditingController dt = new TextEditingController();
  TextEditingController pt = new TextEditingController();

  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Reminder'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter your Medicine name",
                  hintStyle: (TextStyle(
                      fontSize: 15,
                      color: Colors.black26,
                      fontWeight: FontWeight.w400)),
                  labelText: "Medicine",
                  labelStyle: (TextStyle(
                      fontSize: 25,
                      color: Colors.black45,
                      fontWeight: FontWeight.w800)),
                  //icon: new Icon(Icons.public),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 1),
                      borderRadius: BorderRadius.circular(4)),
                  width: 200,
                  alignment: Alignment.topCenter,
                  child: DropdownButton(
                    hint: Text("Select Med Type"),
                    value: _currentValue,
                    onChanged: (new_value) {
                      setState(() {
                        _currentValue = new_value;
                      });
                    },
                    items: dayTime.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  width: 23.5,
                ),
                Container(
                  color: Colors.transparent,
                  width: 160,
                  child: Form(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter your Medicine name",
                          hintStyle: (TextStyle(
                              fontSize: 15,
                              color: Colors.black26,
                              fontWeight: FontWeight.w400)),
                          labelText: "Medicine",
                          labelStyle: (TextStyle(
                              fontSize: 25,
                              color: Colors.black45,
                              fontWeight: FontWeight.w800)),
                          //icon: new Icon(Icons.public),
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _dropAvil.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(_dropAvil[index].name),
                              //subtitle: Text(time),
                              value: _dropAvil[index].selected,
                              onChanged: (bool value) {
                                setState(() {
                                  _dropAvil[index].selected = value;
                                  if (_dropAvil[index].selected == true) {
                                    _showTimePicker();
                                    msg = "Alarm set to " + time;
                                  }
                                });
                              }),
                          if (_dropAvil[index].selected == true)
                            Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                msg,
                              ),
                            ),
                        ],
                      );
                    })), //showAlertDialog(context),
          ],
        ),
      ),
    );
  }
}
