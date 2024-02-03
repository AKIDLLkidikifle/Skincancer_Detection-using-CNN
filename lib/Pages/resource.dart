import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home.dart';


class Resource extends StatefulWidget {
  const Resource({super.key});

  @override
  State<Resource> createState() => _ResourceState();
}

class _ResourceState extends State<Resource> {

  void fuck_u() async {
    final response = await http.post(Uri.parse('https://flutterback-p5x6.onrender.com/post'),
  headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },
  body: jsonEncode(<String, String>{
    'name': name.text,
    'hospital': value,
    'phone': phone.text,
    'date': intialdateval.text,
  }),
);

  if (response.statusCode == 200){
    showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text('Reservation'),
      content: Text('you succcusfully reserved a spot'),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('OK'),
          onPressed: () {
            // Do something
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Home()),
                );
          },
        ),
      ],
    );
  },
);

    
  }

  }

  final List<String> list = <String>[

    'pawlose'.tr(),
    'tikur'.tr(),
    'yekatit'.tr(),
    "alert".tr()
  ];
  late String value;
  // TextEditingController _date = TextEditingController();
  TextEditingController intialdateval = TextEditingController();
  final name = TextEditingController();
  final hospital = TextEditingController();
  final phone = TextEditingController();
  

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030));
    if (picked != null)
      setState(() => {intialdateval.text = picked.toString()});
  }

  @override
  Widget build(BuildContext context) {
     ThemeData currentTheme = Theme.of(context);
      Color bg = currentTheme.brightness==Brightness.dark ? Color.fromRGBO(16, 20, 28, 1):Colors.indigo;
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(15),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Row(
              children:  [
                Expanded(
                    child: Text(
                  "reservetext".tr(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.w900,
                  ),
                ))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  "jestsebmit".tr(),
                  style: TextStyle(
                      letterSpacing: 0.8,
                      color: Colors.indigo,
                      fontSize: 14),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_downward,
                  color: Colors.black,
                  size: 16,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(15, 20, 0, 20),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.black45,
                        ),
                        label:  Text(
                          "fullname".tr(),
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 1.2,
                              color: Colors.black54),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Colors.black54, width: 1.7)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Colors.black38, width: 2.0))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField(
                    
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.local_hospital,
                            color: Colors.black54,
                          ),
                          label:  Text(
                            'choose'.tr(),
                            style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1.1,
                                color: Colors.black54),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                                color: Colors.black54, width: 1.7),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  color: Colors.black38, width: 2.0))),
                      items: list.map((e) {
                        return DropdownMenuItem(child: Text(e), value: e);
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          value = val as String;
                        });
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onTap: _selectDate,
                    controller: intialdateval,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                                color: Colors.black38, width: 2.0)),
                        prefixIcon: const Icon(
                          Icons.calendar_month,
                          color: Colors.black45,
                        ),
                        label:  Text(
                          "date".tr(),
                          style: TextStyle(color: Colors.black45, fontSize: 18),
                        ),
                        hintText: 'yyy/mm/dd'.tr(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Colors.black54, width: 2.0))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: phone,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                                color: Colors.black38, width: 2.0)),
                        prefixIcon: const Icon(
                          Icons.phone_android,
                          color: Colors.black45,
                        ),
                        label: Text(
                          "phone".tr(),
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        hintText: '+251912345676',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Colors.black54, width: 1.7))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                           backgroundColor:bg,
                           elevation: 20,
                           shadowColor: Colors.black12,
                           padding: const EdgeInsets.all(15),
                            shape: const StadiumBorder()
                      ),
                      onPressed: fuck_u,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text(
                            "reservesubmite".tr(),
                            style: TextStyle(fontSize: 19),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.app_registration)
                        ],
                      ))
                ],
              )),
            )
          ],
        ));
  }
}
