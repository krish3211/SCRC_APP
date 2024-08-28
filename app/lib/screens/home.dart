import 'package:flutter/material.dart';
import 'package:app/screens/sidebar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        title: Text(
          'Home',
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
      body: Container(
        color: Colors.black, // Background color for the body
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45, width: 15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/map.png',
                  height: 400,
                  width: double.infinity, // Fill the width of the screen
                  fit: BoxFit.cover, // Adjusts the image size
                ),
              ),

              // const SizedBox(height: 10),
              // // Add your web view containers
              // _buildWebViewContainer(
              //   'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&theme=dark&viewPanel=16',
              //   460,
              // ),
              const SizedBox(height: 10),
              _buildWebViewContainer(
                'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=44',
                550,
              ),
              const SizedBox(height: 10),
              _buildWebViewContainer(
                'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=63',
                100,
              ),
              const SizedBox(height: 10),
              _buildWebViewContainer(
                'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=57',
                200,
              ),
              // const SizedBox(height: 10),
              // _buildWebViewContainer(
              //   'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=58',
              //   550,
              // ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWebViewContainer(String url, int height) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45, width: 15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: height.toDouble(), // Convert height to double
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
