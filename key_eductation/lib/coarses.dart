import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'constants.dart';
class Coarses extends StatefulWidget {
  @override
  final String url;

  const Coarses({Key key, this.url}) : super(key: key);
  _CoarsesState createState() => _CoarsesState();
}

class _CoarsesState extends State<Coarses> {

  String url='https://sites.google.com/keyeducationfoundation.org/self-training-modules/courses/introduction-to-ece?authuser=0';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
