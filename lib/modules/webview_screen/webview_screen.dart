
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webviewScreen extends StatelessWidget {

  final String url;
  webviewScreen(this.url);

  @override
  Widget build(BuildContext context) {
    final WebViewController controller;
    controller = WebViewController()..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: AppBar(
        title:Text('News App', style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: WebViewWidget(controller: controller,)
    );
  }
}
