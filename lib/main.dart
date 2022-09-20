import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownvalue = 'Item 1';

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  String? payment; //no radio button will be selected
  //String gender = "male"; //if you want to set default value
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Payment"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Payment Method",
              style: TextStyle(fontSize: 18),
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text("Bank"),
                    value: "bank",
                    groupValue: payment,
                    onChanged: (value) {
                      setState(() {
                        payment = value.toString();
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text("Check"),
                    value: "check",
                    groupValue: payment,
                    onChanged: (value) {
                      setState(() {
                        payment = value.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
            Visibility(
              child: DropdownButton(
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
              visible: (payment == "bank"),
            ),
          ],
        ),
      ),
    );
  }
}
