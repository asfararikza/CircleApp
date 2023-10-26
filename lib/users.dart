import 'package:flutter/material.dart';
import 'package:http_request/api_data_source.dart';
import 'package:http_request/detail_user.dart';
import 'package:http_request/users_model.dart';

class HalamanUsers extends StatelessWidget {
  const HalamanUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Users",
          style: TextStyle(
              color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(
            Icons.search_sharp,
            color: Colors.black,
            size: 30,
          ),
        ],
        elevation: 0,
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.loadUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("ADA ERROR");
          }
          if (snapshot.hasData) {
            UsersModel users = UsersModel.fromJson(snapshot.data!);
            return ListView.builder(
              itemCount: users.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var user = users.data![index];
                int indexUser = index + 1;
                return ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailUser(dataUser: indexUser);
                    }));
                  },
                  leading: CircleAvatar(
                    foregroundImage: NetworkImage(user.avatar!),
                  ),
                  title: Text(user.firstName! + " " + user.lastName!),
                  subtitle: Text(user.email!),
                );
              },
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
