import 'package:flutter/material.dart';
import 'package:app/screens/sidebar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
          title: Text(
            'Summary View',
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
              // Add your 8 iframes here
              _buildWebViewContainer(
                  'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=38'),
              _buildWebViewContainer(
                  'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=56'),
              _buildWebViewContainer(
                  'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=42'),
              _buildWebViewContainer(
                  'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=53'),
              _buildWebViewContainer(
                  'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=31'),
              _buildWebViewContainer(
                  'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=30'),
              _buildWebViewContainer(
                  'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=55'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWebViewContainer(String url) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 15), // Add white border
        borderRadius: BorderRadius.circular(10), // Make it rounded
      ),
      child: SizedBox(
        height: 200, // Set the height as needed
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
