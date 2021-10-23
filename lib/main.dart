import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:antdesign_icons/antdesign_icons.dart';
//void main run MyApp
void main() => runApp(const MyApp());
//class MyApp => MaterialApp(home: MyHome)
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'ibrahim', home: MyHome(), debugShowCheckedModeBanner: false, debugShowMaterialGrid: false,);
  }
}
//Class My Home => Scaffold(AppBar(RichText(children[TextSpan, TextSpan]))
class MyHome extends StatelessWidget{
  const MyHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title:  RichText(
         text: const TextSpan(
           text: 'Pro', style: TextStyle(color: Colors.blue),
           children: <TextSpan>[
             TextSpan(text: 'f', style: TextStyle(color: Colors.black)),
             TextSpan(text: 'ile' ,style: TextStyle(color: Colors.blueGrey)),
           ],
         ),
       ),
       //AppBar BackgroundColor
       backgroundColor: Colors.white70,
     ),
     //Scaffold BackgroundColor
     backgroundColor: Colors.white,
     //Body  return Column(ContainerTop, ContainerCenter, ContainerDown)
     body: Column(
       children: [
         //ContainerTop => Column(Children[CircleAvatar]
         Container(
           margin:  const EdgeInsets.symmetric(horizontal: 100.0),
           padding: const EdgeInsets.only(top: 20),
           child : Column(
           children: const [
             CircleAvatar(
              backgroundColor: Colors.white,//CircleAvatar backgroundcolor
              backgroundImage: AssetImage('assets/image/hello.jpg'),
               radius: 80,
             ),
           ],
            ),
           height:200 ,
           width: 350,
           color: Colors.white70,//ContainerTop backgroundcolor
         ),
        //ContainerCenter =>Column(Children[2ContackCart])
         Container(
           margin: const EdgeInsets.only(top: 0 , left: 0, right: 0, ),
           padding: const EdgeInsets.only(right: 0,left: 0),
           height:200,
           width: 350,
           color: Colors.white,//ContainerCenter backgroundcolor
           child: Column(
             children: const <Widget>[
               Text("Ibrahim Mohamed", style: TextStyle(fontFamily: 'Italianno', fontSize: 20.0 ,color: Colors.black, ), textAlign: TextAlign.center, ),
               Text("Flutter Developer",style: TextStyle(color: Colors.orange, fontFamily: "RampartOne"),),
               ContactCard(contactText: '       Call Me' , iconData: Icons.phone, url: 'tel:+201001321060'),
               ContactCard(contactText:
               '       Message' , iconData: Icons.message, url: 'sms:+201001321060'),
             ],
           ),
           ),
         //Container Down => Column(Children[2ContackCart])
         Container(
           margin: const EdgeInsets.only(top: 0),
           height: 200,
           width: 350,
           color: Colors.white70,
           child: Column(
             children: const <Widget> [
               ContactCard(contactText:
              '       Github', iconData: AntIcons.githubOutlined, url: 'https://github.com/Ibrahimmohamed2021'),
               ContactCard(contactText: '       Facebook', iconData: Icons.facebook, url: 'https://www.facebook.com/profile.php?id=100070795855375', ),
             ],
           ),
         ),
       ],
     ),
   );
  }
}
class ContactCard extends StatelessWidget {
  void _launchURL(String _url) async {
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }
  final String contactText, url;
  // Problems  = Prefer typing uninitialized variables and fields (iconData)
  final iconData;
   const ContactCard(
      {Key? key, required this.contactText, required this.iconData, required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(300),side: const BorderSide(color: Colors.black, width: 1.0,)),
       elevation: 6,
      color: Colors.white70,
      margin: const EdgeInsets.all(9),
      child: ListTile(
        onTap: () {
          _launchURL(url);
        },
        leading: Icon(
          iconData,
          color: Colors.lightBlueAccent,
          size: 15,
        ),
        title: Text(
          contactText,
          style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "RampartOne"),
        ),
      ),
    );
  }
}
