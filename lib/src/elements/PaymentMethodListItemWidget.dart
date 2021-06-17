import 'package:chowchow/src/controllers/cart_controller.dart';
import 'package:chowchow/src/models/route_argument.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../helpers/custom_trace.dart';
import '../models/payment_method.dart';

// ignore: must_be_immutable
class PaymentMethodListItem extends StatefulWidget {
  PaymentMethod paymentMethod;
  RouteArgument routeArgument;

  PaymentMethodListItem({Key key, this.paymentMethod, this.routeArgument})
      : super(key: key);

  @override
  _PaymentMethodListItemWidget createState() => _PaymentMethodListItemWidget();
}

class _PaymentMethodListItemWidget extends StateMVC<PaymentMethodListItem> {
  CartController _con;

  _PaymentMethodListItemWidget() : super(CartController()) {
    _con = controller;
  }

  //
  @override
  void initState() {
    _con.listenForCarts();
    // _con.listenForPayments(_con.carts.first);
    super.initState();
  }

  String heroTag;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      focusColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).primaryColor,
      onTap: () {
        _con.listenForPayments(_con.carts.elementAt(0));
        Navigator.of(context).pushNamed(this.widget.paymentMethod.route);
        print(CustomTrace(StackTrace.current,
            message: this.widget.paymentMethod.name));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.9),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).focusColor.withOpacity(0.1),
                blurRadius: 5,
                offset: Offset(0, 2)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                    image: AssetImage(widget.paymentMethod.logo),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.paymentMethod.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          widget.paymentMethod.description,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).focusColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
