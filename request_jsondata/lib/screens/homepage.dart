import 'package:flutter/material.dart';
import '../network/http_resquest.dart';
import 'package:http/http.dart ' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Users>>(
        future: fetchUser(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 200,
                    color: Colors.yellow,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.pink,
                            backgroundImage: NetworkImage(
                              snapshot.data[index].image,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("${snapshot.data[index].id}"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("${snapshot.data[index].title}"),
                        ],
                      ),
                    ),
                  );
                });
          }
          return CircularProgressIndicator();
        });
  }
}
