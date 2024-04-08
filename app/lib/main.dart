import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namer App',
      theme: ThemeData(
        primaryColor: Colors.orange, // Set the primary color to orange
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Summary View'), // Navbar title
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Add your 8 iframes here
              _buildWebViewContainer('https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=38'),
              _buildWebViewContainer('https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=56'),
              _buildWebViewContainer('https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=42'),
              _buildWebViewContainer('https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=53'),
              _buildWebViewContainer('https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=31'),
              _buildWebViewContainer('https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=30'),
              _buildWebViewContainer('https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=55'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWebViewContainer(String url) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white,width: 15), // Add white border
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
