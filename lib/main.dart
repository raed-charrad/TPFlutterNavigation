import 'package:flutter/material.dart';
import 'data/FakeDogDatabase.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(title: const Text("First Widget")), body: FirstWidget()));
  }
}

class FirstWidget extends StatelessWidget {
  // List imgList = [
  //   Image.asset("drawable/blue_dog.png"),
  //   Image.asset("drawable/orange_dog.png"),
  //   Image.asset("drawable/red_dog.png"),
  //   Image.asset("drawable/yellow_dog.png"),
  //   Image.asset("drawable/white_dog.png"),
  //   Image.asset("drawable/wiggle_logo.png"),
  // ];
  // recuperate the list of dogs from the fake database
  
  @override
  Widget build(BuildContext context) {
    return(Center(
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: dogList.length,
              itemBuilder: (context, index) {
                return Card (
                  margin: EdgeInsets.all(10),
                  color: Color.fromARGB(238, 220, 220, 220),
                  shadowColor: Colors.blueGrey,
                  elevation: 20,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text(dogList[index].name),
                        subtitle: Text(dogList[index].age.toString()+"yrs | Playful"),
                        leading: Image.asset("drawable/${dogList[index].image}"),
                        trailing: Container(
                          child: Column(
                            children: [
                              Text(dogList[index].gender, style: TextStyle(color: Colors.white,),),
                              Text("12 min ago")
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecondWidget(p1 : dogList[index].id)),
                          );
                        }
                    ),
                ],
                ),
                );
              }
          ),
        ],
      ),
    ));
  }
}

class FakeDogDatabase {

}
class SecondWidget extends StatelessWidget {
  int p1;
  SecondWidget({this.p1 = 0});
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Second Widget")
              ),
            body: Center(
              child: 
              Column(
                children: [
                  Image.asset("drawable/${dogList[p1].image}"),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dogList[p1].name,
                            style: const TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF151B1E),
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: dogList[p1].gender == "Male"
                                  ? Color.fromARGB(255, 207, 231, 238)
                                  : Color.fromARGB(255, 255, 192, 203),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(dogList[p1].gender,
                                style: TextStyle(
                                    color: dogList[p1].gender == "Male"
                                        ? Colors.blue
                                        : Colors.pink)),
                          ),
                        ],
                      )),

                ],
              ),
            ))));
  }
}