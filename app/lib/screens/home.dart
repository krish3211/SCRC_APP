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
        title: Text('SCRC APP'),
        backgroundColor: Colors.lime[600],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              "Nodes Map",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            _buildWebViewContainer(
                'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=16',
                460),
            const SizedBox(height: 10),
            const Text(
              "Deployed Nodes",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            _buildWebViewContainer(
                'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=44',
                550),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildWebViewContainer(String url, int height) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 15),
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
