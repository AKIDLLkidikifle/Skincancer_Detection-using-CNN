
import 'package:flutter/material.dart';
import 'languages.dart';
import './listdisease.dart';
import './resource.dart';
import './uploadImage.dart';
import '../contacts/contact.dart';
import 'management.dart';
import 'package:wiredash/wiredash.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import '../thems/them-model.dart';
import 'package:provider/provider.dart';
import '../contacts/about.dart';
import 'skininfo.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    UploadImage(),
    // Managemnt(),
    ListDisease(),
    Resource(),
    Skin(),
  ];
  @override
  Widget build(BuildContext context) {
     final themeChange = Provider.of<DarkThemeProvider>(context);
     ThemeData currentTheme = Theme.of(context);
      Color bg = currentTheme.brightness==Brightness.dark ? Color.fromRGBO(16, 20, 28, 1):Colors.indigo;
      Color icon = currentTheme.brightness==Brightness.dark ? Colors.white:Colors.black;
      
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: const Color.fromRGBO(16, 20, 28, 1),
      appBar: AppBar(
       // backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color:icon),
      ),
      drawer: Drawer(
        backgroundColor:Colors.white,
        
        elevation: 10,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Container(
              decoration:  BoxDecoration(
                color:bg,
              ),
              width: double.infinity,
              height: 206,
              child:  Center(
                  child: Text(
                "Idetect".tr(),
                style: TextStyle(
                    color: Colors.white, letterSpacing: 1.5, fontSize: 20),
              )),
            ),
             ListTileSwitch(
              value: themeChange.darkTheme,
              
              leading: const Icon(Icons.dark_mode),
              onChanged: (value) {
                setState(() {
                  themeChange.darkTheme = value;
                });
              },
              visualDensity: VisualDensity.comfortable,
              switchType: SwitchType.cupertino,
              switchActiveColor: Colors.indigo,
              title: Text('darktheme'.tr()),
              subtitle: Text(
                "enebledark".tr(),
              ),
              
            ),
            ListTile(
              textColor: Colors.black,
              iconColor: Colors.indigo,
              title:  Text('about'.tr()),
              subtitle:  Text(
                "aboutapp".tr(),
              ),
              leading: const Icon(Icons.privacy_tip),
              onTap: () {
                   Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MyWidget())
                );
              },
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              textColor: Colors.black,
              iconColor: Colors.indigo,
              title: Text('contact'.tr()),
              subtitle: Text(
                "contactus".tr(),
              ),
              leading: const Icon(Icons.contact_page),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Contact()),
                );
              },
            ),
           
            const Divider(
              thickness: 3,
              indent: 5,
              endIndent: 5,
              color: Colors.indigo,
            ),
            Row(
              children:  [
                // Icon(Icons.help),
                SizedBox(
                  width: 15,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'others'.tr(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
             ListTile(
              iconColor: Colors.indigo,
              textColor: Colors.black,
              title: Text('feedback'.tr()),
              subtitle: Text(
                "givecomment".tr(),
              ),
             
              leading: Icon(Icons.feedback),
              onTap: () {
          Wiredash.of(context).show(inheritMaterialTheme: true);
                   }

            ),
                ListTile(
              textColor: Colors.black,
              iconColor: Colors.indigo,
              title: Text('language'.tr()),
              subtitle: Text(
                "choosetitle".tr(),
              ),
              leading: const Icon(Icons.language_rounded),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Languages()),
                );
              },
            ),
          
         
          ],
        ),
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        selectedItemColor: Colors.indigo,
        elevation: 10,
        iconSize: 30,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black54,
        unselectedLabelStyle: const TextStyle(letterSpacing: 1.5),
        selectedLabelStyle:
            const TextStyle(letterSpacing: 1, fontStyle: FontStyle.italic),
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          // ignore: prefer_const_constructors
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home'.tr(),
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'info'.tr(),
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'reserve'.tr(),
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'resource'.tr(),
          ),
        ],
      ),
    );
  }
}
