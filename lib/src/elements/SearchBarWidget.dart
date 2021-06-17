import 'package:chowchow/src/pages/map.dart';
import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import '../elements/SearchWidget.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged onClickFilter;

  const SearchBarWidget({Key key, this.onClickFilter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(SearchModal());
      },
      child: Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Theme.of(context).focusColor.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                _bottomSheetMore(context);
                // onClickFilter('e');
              },
              child: Container(
                padding: const EdgeInsets.only(
                    right: 10, left: 10, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  // color: Theme.of(context).focusColor.withOpacity(0.1),
                ),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 4,
                  children: [
                    Text(
                      "DineIN",
                      style: TextStyle(color: Theme.of(context).hintColor),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Theme.of(context).hintColor,
                      size: 21,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 12, left: 0),
              child: Icon(Icons.search, color: Theme.of(context).accentColor),
            ),
            Expanded(
              child: Text(
                S.of(context).search_for_restaurants_or_foods,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .merge(TextStyle(fontSize: 12)),
              ),
            ),
            SizedBox(width: 8),
            // InkWell(
            //   onTap: () {
            //     onClickFilter('e');
            //   },
            //   child: Container(
            //     padding: const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(5)),
            //       color: Theme.of(context).focusColor.withOpacity(0.1),
            //     ),
            //     child: Wrap(
            //       crossAxisAlignment: WrapCrossAlignment.center,
            //       spacing: 4,
            //       children: [
            //         Text(
            //           S.of(context).filter,
            //           style: TextStyle(color: Theme.of(context).hintColor),
            //         ),
            //         Icon(
            //           Icons.filter_list,
            //           color: Theme.of(context).hintColor,
            //           size: 21,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void _bottomSheetMore(context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return new Container(
          height: 450.0,
          padding: EdgeInsets.only(
            left: 5.0,
            right: 5.0,
            top: 5.0,
            bottom: 5.0,
          ),
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(10.0),
                  topRight: const Radius.circular(10.0))),
          child: new Wrap(
            spacing: 20, // to apply margin in the main axis of the wrap
            runSpacing: 20, // to apply margin in the cross axis of the wrap
            children: <Widget>[
              SizedBox(height: 20),
              SizedBox(
                height: 90,
                child: new ListTile(
                    leading: new Container(
                      width: 2.0,
                      child: Icon(
                        Icons.restaurant,
                        color: Theme.of(context).hintColor,
                        size: 24.0,
                      ),
                    ),
                    title: const Text(
                      'Dine In',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                        "As restaurants reopen, experts say there are issues for consumers to consider before deciding to dine out again."),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed('/Pages', arguments: 2);
                    }),
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 90,
                child: new ListTile(
                    leading: new Container(
                      width: 2.0,
                      child: Icon(
                        Icons.run_circle,
                        color: Theme.of(context).hintColor,
                        size: 24.0,
                      ),
                    ),
                    title: const Text(
                      'On the Way',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                        "As restaurants reopen, experts say there are issues for consumers to consider before deciding to dine out again."),
                    onTap: () {
                      Navigator.push(
                        context,
                        //   MaterialPageRoute(builder: (context) => MyLocation()),
                        MaterialPageRoute(builder: (context) => MapWidget()),
                      );
                      //    Navigator.of(context).pushReplacementNamed('/Pages', arguments:1);
                    }),
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 90,
                child: new ListTile(
                    leading: new Container(
                      width: 2.0,
                      child: Icon(
                        Icons.delivery_dining,
                        color: Theme.of(context).hintColor,
                        size: 24.0,
                      ),
                    ),
                    title: const Text(
                      'Delivery',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                        "As restaurants reopen, experts say there are issues for consumers to consider before deciding to dine out again."),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed('/Pages', arguments: 2);
                    }),
              ),
              Divider(
                thickness: 2,
              ),
            ],
          ),
        );
      },
    );
  }
}
