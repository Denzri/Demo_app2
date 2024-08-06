import 'package:flutter/material.dart';
import '../models/user.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  UserDetailScreen({required this.user});

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(user.name),
            ),
            ListTile(
              title: GestureDetector(
                onTap: () => _launchURL('mailto:${user.email}'),
                child: Text(user.email, style: TextStyle(color: Colors.blue)),
              ),
            ),
            ListTile(
              title: GestureDetector(
                onTap: () => _launchURL('tel:${user.phone}'),
                child: Text(user.phone, style: TextStyle(color: Colors.blue)),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    child: WebView(
                      initialUrl: 'http://${user.website}',
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(user.lat, user.lng),
                        zoom: 14,
                      ),
                      markers: {
                        Marker(
                          markerId: MarkerId(user.id.toString()),
                          position: LatLng(user.lat, user.lng),
                          infoWindow: InfoWindow(
                            title: user.street,
                          ),
                        ),
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
