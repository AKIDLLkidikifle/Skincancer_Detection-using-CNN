import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetail extends StatelessWidget {
  final String url;
  const NewsDetail({super.key , required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WebView(
        initialUrl:url,
      )

    );
  }
}