import 'package:app/screens/sidebar.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        title: Text(
          'About',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightBlue[800],
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildCoverAbout(),
            buildCoverImage(),
            const SizedBox(height: 10),
            const Text(
              "Smart City Research Team",
              textAlign: TextAlign.center,
              textScaleFactor: 1.1,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset(
          'assets/images/group_photo.jpg',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      );

  Widget buildCoverAbout() => Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "The Smart City Research Center is setup with support from MEITY (Government of India), Smart City Mission and Government of Telangana at IIITH. The research center includes a Living Lab, that is a setup with support from EBTC and Amsterdam Innovation Arena.\n\n"
                "There is a huge push for smart cities in India under the Smart Cities Mission, a new initiative by the Government of India to drive economic growth and improve the quality of life of people by enabling local development and harnessing technology to create smart outcomes for citizens. In this ambitious project, 100 cities are being covered for the duration of 5 years with a budget of Rs.100 crore per city per year. The goal of the Living Lab plan is to create an urban area enhancing three value domains: social, economic and environmental.",
                textScaleFactor: 1.2,
                //style: TextStyle(decoration: ),
              ),
            ],
          ),
        ),
      );
}
