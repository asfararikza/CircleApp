import 'package:flutter/material.dart';
import 'package:http_request/api_data_source.dart';
import 'package:http_request/detail_user_model.dart';

class DetailUser extends StatelessWidget {
  DetailUser({super.key, required this.dataUser});
  int dataUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Detail User",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 37,
        shadowColor: Colors.black54,
      ),
      backgroundColor: Color.fromARGB(255, 240, 237, 237),
      body: FutureBuilder(
        future: ApiDataSource.instance.loadDetailUser(dataUser),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text("ADA ERROR");
          }
          if (snapshot.hasData) {
            DetailUserModel user = DetailUserModel.fromJson(snapshot.data!);
            return Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    CircleAvatar(
                      foregroundImage:
                          NetworkImage(user.data!.avatar.toString()),
                      radius: 80,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${user.data!.firstName} ${user.data!.lastName}",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text("${user.data!.email}"),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.mail_rounded,
                                color: Colors.blueAccent,
                                size: 35,
                              ),
                              Text(
                                "Message",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person_off_rounded,
                                color: Colors.blueAccent,
                                size: 35,
                              ),
                              Text(
                                "Person Off",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.more_horiz_rounded,
                                color: Colors.blueAccent,
                                size: 35,
                              ),
                              Text(
                                "Other",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
