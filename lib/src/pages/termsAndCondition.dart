import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndCondition extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  TermsAndCondition({Key key, this.parentScaffoldKey}) : super(key: key);

  @override
  _TermsAndConditionWidgetState createState() => _TermsAndConditionWidgetState();
}

class _TermsAndConditionWidgetState extends State<TermsAndCondition> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms And Condition'),
      ),
      body: const WebView(
        initialUrl: 'http://chowchow.websquareit.in/index.php/welcome/termsandcondition',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

}