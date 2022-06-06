import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/appBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key, required this.blogUrl}) : super(key: key);

  final String blogUrl;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {

  /* when you're converting a callback-based API into a Future-based one */

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  bool isLoading = true;

  // @override
  // void initState() {
  //   super.initState();
  //   // Enable virtual display.
  //   if (Platform.isAndroid) WebView.platform = AndroidWebView();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
        context,
      ),
      body: Stack(
        children: [
          WebView(
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
            initialUrl: widget.blogUrl,
            onWebViewCreated: (WebViewController webviewcontroller) {
              _controller.complete(webviewcontroller);
            },
          ),
          isLoading ? const Center(child: CircularProgressIndicator()) : Stack()
        ],
      ),
    );
  }
}