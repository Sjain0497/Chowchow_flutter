import 'package:chowchow/generated/l10n.dart';
import 'package:chowchow/src/elements/AboutListItem.dart';
import 'package:chowchow/src/elements/MySliverAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  AboutUsWidget({Key key, this.parentScaffoldKey}) : super(key: key);

  @override
  _AboutUsWidgetState createState() => _AboutUsWidgetState();
}

class _AboutUsWidgetState extends StateMVC<AboutUsWidget> {
  Future<void> _launched;
  bool _termsChecked = false;

  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'https://www.GOOGLE.COM';
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).about,
          style: Theme.of(context)
              .textTheme
              .headline6
              .merge(TextStyle(letterSpacing: 1.3)),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: MySliverAppBar(expandedHeight: 200),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                SizedBox(
                  height: 30,
                  width: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      new ListTile(
                        leading: new AboutListItem(),
                        title: new Text(
                          'Satisfy your taste buds by ordering your favorite food from your favorite restaurant with this online food ordering app.',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ),
                      new ListTile(
                        leading: new AboutListItem(),
                        title: new Text(
                          'Chow Chow, an initiative by Websquare IT, lets you order food online from the app itself. This mobile food ordering system is developed especially for foodies and restaurant owners. With Chow Chow, we want you foodies to discover the best and mouthwatering restaurants in your city.',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 15,
                        ),
                      ),
                      new ListTile(
                        leading: new AboutListItem(),
                        title: new Text(
                          'For restaurant owners, this can be a game-changing app. The restaurant owners can effortlessly register their restaurant and upload their menu to start receiving orders free of cost. This is a fast-growing portal that is beneficial for restaurant owners.',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ),
                      new ListTile(
                        leading: new AboutListItem(),
                        title: new Text(
                          'Attention, Restaurant owners!',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ),
                      new ListTile(
                        leading: new AboutListItem(),
                        title: new Text(
                          'Have a low budget but want to make your restaurant a success? ',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ),
                      new ListTile(
                        leading: new AboutListItem(),
                        title: new Text(
                          'This is the opportunity for you to boost your business online with the CHOW CHOW food ordering app. You just have to get yourself registered and upload your menu to get orders. Your online visibility can increase your business even if you do not have proper technical knowledge.',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 15,
                        ),
                      ),
                      new ListTile(
                        leading: new AboutListItem(),
                        title: new Text(
                          'Are you a foodie and love your local food? ',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ),
                      new ListTile(
                        leading: new AboutListItem(),
                        title: new Text(
                          'This app lets you order food from your local restaurants online. This Food Ordering System is an internet-based app that will accept group meals, individual meals, process payments, and make prompt deliveries of the prepared meal to your location.',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 7,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => setState(() {
                          Navigator.pushNamed(context, '/TermsAndCondition');
                          //  _launched = _launchInWebViewOrVC(toLaunch);
                        }),
                        child: const Text('Our Terms And Condition'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
