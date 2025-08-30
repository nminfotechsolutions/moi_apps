import 'package:flutter/material.dart';
import 'package:moi_apps/Screens/Moi_Details.dart';
import 'package:moi_apps/Screens/Total_Moicollection.dart';

import 'collection_entry_screens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Image.asset('assets/images/logo.png', height: 100.0),
          ),
        ],
        backgroundColor: Colors.indigo.shade900,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(),
      backgroundColor: Colors.indigo.shade900,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0.8),
          child: Column(
            children: [
              Container(
                height: 350,
                width: 350,
                color: Colors.indigo.shade900,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Image.asset('assets/images/pic1.png')],
                ),
              ),
              Center(
                child: Text(
                  'NMINFOTECH SOLUTION',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCustomButton(
                      imagePath: "assets/images/img1.png", // your image
                      text: "வாங்கிய மொய்",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CollectionMoiEntry(),
                          ),
                        );
                      },
                    ),
                    _buildCustomButton(
                      imagePath: "assets/images/img2.png",
                      text: "புதியதாக மொய் செய்ய",
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => MoiDetails()));
                      },
                    ),
                    _buildCustomButton(
                      imagePath: "assets/images/img3.png",
                      text: "மொய் கணக்கீடு",
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => TotalMoicollection()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCustomButton({
  required String imagePath,
  required String text,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(16),
    child: SingleChildScrollView(
      child: Container(
        width: 110,
        height: 170, // fixed width like in screenshot
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, height: 70, fit: BoxFit.contain),
            const SizedBox(height: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
