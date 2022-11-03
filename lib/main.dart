import 'package:flutter/material.dart';
import 'data/FakeDogDatabase.dart';
import 'data/Dog.dart';
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
  @override
  Widget build(BuildContext context) {
    return(Center(
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: dogList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child:DogList(dogList[index]),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondWidget(p1 : dogList[index].id)
                        )
                    );
                  },
                );
              },
          ),
        ],
      ),
    ));
  }
}
Widget DogList(Dog dog) {
  return Card (
              margin: EdgeInsets.all(10),
              color: Color.fromARGB(238, 220, 220, 220),
              shadowColor: Colors.blueGrey,
              elevation: 20,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child : Image.asset("drawable/${dog.image}", width: 100, height: 100, fit: BoxFit.cover),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children:<Widget>[
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(dog.name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                          Container(
                            decoration: BoxDecoration(
                              color : dog.gender=='Male' ? Color.fromARGB(152, 33, 149, 243) : Color.fromARGB(255, 255, 192, 243),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(5),
                            child: Text(dog.gender , style: TextStyle(color : dog.gender=='Male' ? Colors.blue : Colors.pink)),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("${dog.age} yrs | Playfull", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.location_on, size: 15 , color: Colors.red),
                              Text(" ${dog.distance}", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Text("12 min ago", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      ],
                      ),
                    ),
                  ),
            ],
            ),
            );
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