import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/helper.dart';
import '../models/food.dart';
import 'HomeSliderLoaderWidget.dart';

class HomeSliderWidgetNew extends StatefulWidget {
  final List<Food> slides;

  @override
  _NewHomeSliderWidgetState createState() => _NewHomeSliderWidgetState();

  HomeSliderWidgetNew({Key key, this.slides}) : super(key: key);
}

class _NewHomeSliderWidgetState extends State<HomeSliderWidgetNew> {
  int _current = 0;
  AlignmentDirectional _alignmentDirectional;

  @override
  Widget build(BuildContext context) {
    return widget.slides == null || widget.slides.isEmpty
        ? HomeSliderLoaderWidget()
        : Stack(
            // alignment: _alignmentDirectional ?? Helper.getAlignmentDirectional(widget.slides.elementAt(0).textPosition),
            fit: StackFit.passthrough,
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  height: 180,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                      //  _alignmentDirectional = Helper.getAlignmentDirectional(widget.slides.elementAt(index).textPosition);
                    });
                  },
                ),
                items: widget.slides.map((Food slide) {
                  int discountPrice = slide.discountPrice.toInt();
                  //  double discountPrice =slide.discountPrice .toDouble().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        height: 140,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.15),
                                blurRadius: 15,
                                offset: Offset(0, 2)),
                          ],
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsetsDirectional.only(
                                  start: 10, end: 10),
                              width: double.infinity,
                              height: 130,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: slide.restaurant.image.url,
                                  placeholder: (context, url) => Image.asset(
                                    'assets/img/loading.gif',
                                    fit: BoxFit.contain,
                                  ),
                                  // errorWidget: (context, url, error) => Icon(Icons.error),
                                  errorWidget: (context, url, error) =>
                                      Image.network(
                                          slide.restaurant.image.thumb),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(
                                  end: 45, top: 0, bottom: 105, start: 250),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: discountPrice > 0
                                    ? Colors.red
                                    : Theme.of(context).accentColor,
                              ),
                              alignment: AlignmentDirectional.center,
                              child: Helper.getPrice(
                                slide.price,
                                context,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .merge(TextStyle(
                                        color: Theme.of(context).primaryColor)),
                              ),
                            ),
                          ],
                        ),
                        // child: Stack(
                        //   children: [
                        //
                        //     Stack(
                        //       alignment: AlignmentDirectional.topEnd,
                        //       children: <Widget>[
                        //         ClipRRect(
                        //
                        //           borderRadius: BorderRadius.all(Radius.circular(10)),
                        //           child: CachedNetworkImage(
                        //
                        //             height: 140,
                        //             width: double.infinity,
                        //             fit: Helper.getBoxFit(slide.restaurant.image.url),
                        //             imageUrl: slide.restaurant.image.url,
                        //             placeholder: (context, url) => Image.asset(
                        //               'assets/img/loading.gif',
                        //               fit: BoxFit.cover,
                        //               width: double.infinity,
                        //               height: 140,
                        //             ),
                        //             errorWidget: (context, url, error) => Icon(Icons.error),
                        //           ),
                        //         ),
                        //         Container(
                        //           alignment: Helper.getAlignmentDirectional(slide.name),
                        //           width: double.infinity,
                        //           padding: const EdgeInsets.symmetric(horizontal: 20),
                        //           child: Container(
                        //             width: config.App(context).appWidth(40),
                        //             child: Column(
                        //               crossAxisAlignment: CrossAxisAlignment.stretch,
                        //               mainAxisSize: MainAxisSize.max,
                        //               mainAxisAlignment: MainAxisAlignment.center,
                        //               children: <Widget>[
                        //                 if (slide.name != null && slide.name != '')
                        //                   Text(
                        //                     slide.name,
                        //                     style: Theme.of(context).textTheme.headline6.merge(
                        //                       TextStyle(
                        //                         fontSize: 14,
                        //                         height: 1,
                        //                         //color: Helper.of(context).getColorFromHex(slide.textColor),
                        //                       ),
                        //                     ),
                        //                     textAlign: TextAlign.center,
                        //                     overflow: TextOverflow.fade,
                        //                     maxLines: 3,
                        //                   ),
                        //                 // if (slide.button != null && slide.button != '')
                        //                 //   FlatButton(
                        //                 //     onPressed: () {
                        //                 //       if (slide.restaurant != null) {
                        //                 //         Navigator.of(context)
                        //                 //             .pushNamed('/Details', arguments: RouteArgument(id: '0', param: slide.restaurant.id, heroTag: 'home_slide'));
                        //                 //       } else if (slide.food != null) {
                        //                 //         Navigator.of(context).pushNamed('/Food', arguments: RouteArgument(id: slide.food.id, heroTag: 'home_slide'));
                        //                 //       }
                        //                 //     },
                        //                 //     padding: EdgeInsets.symmetric(vertical: 5),
                        //                 //     color: Helper.of(context).getColorFromHex(slide.buttonColor),
                        //                 //     shape: StadiumBorder(),
                        //                 //     child: Text(
                        //                 //       slide.button,
                        //                 //       textAlign: TextAlign.start,
                        //                 //       style: TextStyle(color: Theme.of(context).primaryColor),
                        //                 //     ),
                        //                 //   ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //         Container(
                        //
                        //           margin: EdgeInsetsDirectional.only(end: 25, top: 0),
                        //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.all(Radius.circular(100)),
                        //            color: slide.discountPrice > 0 ? Colors.red : Theme.of(context).accentColor,
                        //           ),
                        //           alignment: AlignmentDirectional.topEnd,
                        //           child: Helper.getPrice(
                        //             slide.price,
                        //             context,
                        //             style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(color: Theme.of(context).primaryColor,
                        //           )),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //     Container(
                        //       alignment: Helper.getAlignmentDirectional(slide.name),
                        //       width: double.infinity,
                        //       padding: const EdgeInsets.symmetric(horizontal: 20),
                        //       child: Container(
                        //         width: config.App(context).appWidth(40),
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.stretch,
                        //           mainAxisSize: MainAxisSize.max,
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: <Widget>[
                        //             if (slide.name != null && slide.name != '')
                        //               Text(
                        //                 slide.name,
                        //                 style: Theme.of(context).textTheme.headline6.merge(
                        //                       TextStyle(
                        //                         fontSize: 14,
                        //                         height: 1,
                        //                         color: Helper.of(context).getColorFromHex('#ea5c44'),
                        //                       ),
                        //                     ),
                        //                 textAlign: TextAlign.center,
                        //                 overflow: TextOverflow.fade,
                        //                 maxLines: 3,
                        //               ),
                        //             // if (slide.button != null && slide.button != '')
                        //             //   FlatButton(
                        //             //     onPressed: () {
                        //             //       if (slide.restaurant != null) {
                        //             //         Navigator.of(context)
                        //             //             .pushNamed('/Details', arguments: RouteArgument(id: '0', param: slide.restaurant.id, heroTag: 'home_slide'));
                        //             //       } else if (slide.food != null) {
                        //             //         Navigator.of(context).pushNamed('/Food', arguments: RouteArgument(id: slide.food.id, heroTag: 'home_slide'));
                        //             //       }
                        //             //     },
                        //             //     padding: EdgeInsets.symmetric(vertical: 5),
                        //             //     color: Helper.of(context).getColorFromHex(slide.buttonColor),
                        //             //     shape: StadiumBorder(),
                        //             //     child: Text(
                        //             //       slide.button,
                        //             //       textAlign: TextAlign.start,
                        //             //       style: TextStyle(color: Theme.of(context).primaryColor),
                        //             //     ),
                        //             //   ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      );
                    },
                  );
                }).toList(),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 22, horizontal: 42),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.slides.map((Food slide) {
                    return Container(
                      width: 10.0,
                      height: 3.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          color: _current == widget.slides.indexOf(slide)
                              ? Helper.of(context).getColorFromHex('#ea5c44')
                              : Helper.of(context)
                                  .getColorFromHex('#ea5c44')
                                  .withOpacity(0.3)),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
  }
}
