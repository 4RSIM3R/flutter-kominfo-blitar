import 'package:flutter/material.dart';
import 'package:flutter_training/list_attendance_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 10,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("Skip Me");
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Center(
                child: Image.asset(
                  "assets/images/figure_1.png",
                  height: 300,
                  width: 300,
                ),
              ),
              SizedBox(height: 32),
              Text(
                "Offers",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
              ),
              SizedBox(height: 8),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff4287f5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/list-attendance');
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  )
                ],
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
