import 'package:flutter/material.dart';
import 'package:http_request/users.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 200),
              Icon(
                Icons.diversity_2_rounded,
                size: 60,
              ),
              Text(
                "Circle",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Get closer with your colleague",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 300,
              ),
              Container(
                width: 140,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return HalamanUsers();
                      },
                    ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Next",
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(
                        Icons.navigate_next_rounded,
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
