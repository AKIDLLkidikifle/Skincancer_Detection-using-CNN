// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color.fromRGBO(16, 20, 24, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(12, 16, 20, 1.0),
        title: Text(
          "contactus".tr(),
          style: TextStyle(letterSpacing: 1.2, fontSize: 24),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children:  [
                  Card(
                      //name: "Asrat Adane",
                      color: Colors.white,
                      child: cardItam(
                        name: "Asrat".tr(),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Card(
                    color: Colors.white,
                    child: cardItem2(
                      name: 'betelhem'.tr(),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Card(
                      //name: "Asrat Adane",
                      color: Colors.white,
                      child: cardItam(
                        name: "mastewal".tr(),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Card(
                    color: Colors.white,
                    child: cardItem2(
                      name: 'kidist'.tr(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class cardItem2 extends StatelessWidget {
  final String name;
  const cardItem2({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          // padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: const [Icon(Icons.phone)],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          height: 200,
          // width: MediaQuery.of(context).size.width * 0.5,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(10, 25, 35, 1.0),
              borderRadius:
                  BorderRadiusDirectional.horizontal(end: Radius.circular(20))),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(
                    letterSpacing: 1.5, fontSize: 18, color: Colors.white),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class cardItam extends StatelessWidget {
  final String name;

  const cardItam({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          height: 200,
          //  width: MediaQuery.of(context).size.width * 0.5,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(10, 30, 30, 1.0),
              borderRadius: BorderRadiusDirectional.horizontal(
                  start: Radius.circular(20))),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$name',
                style: TextStyle(
                    letterSpacing: 1.5, fontSize: 18, color: Colors.white),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Column(
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "0915242526",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Card extends StatelessWidget {
  //final String name;
  final Widget child;
  // final Border border;
  final Color color;

  const Card(
      {super.key,
      // required this.name,
      required this.child,
      /*required this. border*/
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 200,
        decoration: BoxDecoration(
          color: Color.fromRGBO(12, 16, 20, 1.0),
          // border: Border.all(color: color, width: 0.0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: child);
  }
}
