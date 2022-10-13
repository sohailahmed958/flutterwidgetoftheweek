import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceWidget extends StatefulWidget {
  const SharedPreferenceWidget({Key? key}) : super(key: key);

  @override
  State<SharedPreferenceWidget> createState() => _SharedPreferenceWidgetState();
}

class _SharedPreferenceWidgetState extends State<SharedPreferenceWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shared Preference'),),
      body: Column(children: [
       FutureBuilder(
           future: SharedPreferences.getInstance(),
           builder: (context,AsyncSnapshot<SharedPreferences> snapshot){
         return Column(children: [
           Text(snapshot.data!.getString('This is String:').toString()),
           Text(snapshot.data!.getInt('age').toString()),
           Text(snapshot.data!.getDouble('DoubleValue:').toString()),
           Text(snapshot.data!.getBool('isLogin').toString()),
         ],);
       })
      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{

          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setInt('age', 22);
          sp.setDouble('DoubleValue:', 22.22);
          sp.setString('This is String:', 'Yes this is String Value.');
          sp.setBool('isLogin', false);

          setState(() {
            
          });
          // print(sp.get('Age'));
          // print(sp.get('DoubleValue:'));
          // print(sp.get('This is String:'));
          // print(sp.get('isLogin'));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
