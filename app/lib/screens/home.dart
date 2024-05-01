import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _buildAnimatedBox(
                      child: Column(
                    children: [
                      const Text(
                        "Water Flow: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      buildAverageFlowFutureBuilder(),
                    ],
                  )),
                ),
                Expanded(
                  child: _buildAnimatedBox(
                      child: Column(
                    children: [
                      const Text(
                        "Energy Generated: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      buildAveragePowerFutureBuilder(),
                    ],
                  )),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: _buildWebViewContainer(
                      'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=31',
                      200,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: _buildWebViewContainer(
                      'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=30',
                      200,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildWebViewContainer(
              'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=16',
              460,
            ),
            const SizedBox(height: 10),
            _buildWebViewContainer(
              'https://smartcitylivinglab.iiit.ac.in/grafana/d/kyLuJXQ7z/summary-view?kiosk&autofitpanels&orgId=1&from=now-21d&to=now&viewPanel=44',
              550,
            ),
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

  Widget _buildAnimatedBox({required Widget child}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.lightBlue, width: 2),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }

  Widget buildAverageFlowFutureBuilder() {
    return FutureBuilder<double>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text(
            'Error: ${snapshot.error}',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal),
          );
        } else if (snapshot.data == null) {
          return Text(
            'No data available',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal),
          );
        } else {
          return Text(
            '${snapshot.data!.toStringAsFixed(2)} m³',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal),
          );
        }
      },
    );
  }

  Widget buildAveragePowerFutureBuilder() {
    return FutureBuilder<double>(
      future: fetchActivePowerAverage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text(
            'Error: ${snapshot.error}',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal),
          );
        } else if (snapshot.data == null) {
          return Text(
            'No data available',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal),
          );
        } else {
          return Text(
            '${snapshot.data!.toStringAsFixed(2)} KW',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal),
          );
        }
      },
    );
  }

  Future<double> fetchActivePowerAverage() async {
    try {
      final response = await http.get(Uri.parse(
          'https://smartcitylivinglab.iiit.ac.in/verticals/all/latest/'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body)['sl'];
        return calculateAverageActivePower(jsonData);
      } else {
        throw 'Failed to load data: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Error: $e';
    }
  }

  double calculateAverageActivePower(List<dynamic> jsonData) {
    double activePowerSum = 0;
    int totalCount = 0;

    for (var data in jsonData) {
      if (data['active_power'] != null && data['active_power'] != "null KW") {
        activePowerSum +=
            double.parse(data['active_power'].replaceAll(' KW', ''));
        totalCount++;
      }
    }

    if (totalCount > 0) {
      return activePowerSum / totalCount;
    } else {
      return 0;
    }
  }

  Future<double> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://smartcitylivinglab.iiit.ac.in/verticals/all/latest/'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body)['wf'];
        return calculateAverageTotalFlow(jsonData);
      } else {
        throw 'Failed to load data: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Error: $e';
    }
  }

  double calculateAverageTotalFlow(List<dynamic> jsonData) {
    double totalFlowSum = 0;
    int totalCount = 0;

    for (var data in jsonData) {
      if (data['total_flow'] != null && data['total_flow'] != "null m³") {
        totalFlowSum += double.parse(data['total_flow'].replaceAll(' m³', ''));
        totalCount++;
      }
    }

    if (totalCount > 0) {
      return totalFlowSum / totalCount;
    } else {
      return 0;
    }
  }
}
