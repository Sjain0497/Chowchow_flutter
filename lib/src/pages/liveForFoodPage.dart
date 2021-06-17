import 'package:flutter/material.dart';

import '../helpers/app_config.dart' as config;

class LiveForFoodView extends StatelessWidget {
  const LiveForFoodView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.all(15.0),
      //  height: 400.0,
      color: Theme.of(context).primaryColor,
      //color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'DO MORE WITH CHOWCHOW',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Colors.pink,
                  letterSpacing: 0.2,
                ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Stack(alignment: AlignmentDirectional.center, children: <Widget>[
            Image.asset(
              'assets/img/find_out_back.png',
              width: config.App(context).appWidth(100),
              height: config.App(context).appHeight(17),
              fit: BoxFit.cover,
            ), // Background Image !
            Positioned(
              left: 10.0,
              right: 10.0,
              top: 20.0,
              child: Text(
                'Fresh. Fast. Fasty',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.yellow[700],
                      fontSize: 20.0,
                      letterSpacing: 0.2,
                      height: 0.8,
                    ),
              ),
            ),
            Positioned(
              left: 10.0,
              right: 10.0,
              top: 50.0,
              child: Text(
                'Yours Truly Restaurant.\n\n For AM & PM People ',
                style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.white,
                      fontSize: 12.0,
                      letterSpacing: 0.3,
                      height: 0.8,
                    ),
              ),
            ),
            Positioned(
              left: 10.0,
              top: 60.0,
              child: Image.asset(
                'assets/img/find_btn.png',
                height: 90.0,
                width: 90.0,
              ),
            ),
            Positioned(
                left: 17.0,
                right: 3.0,
                top: 100.0,
                child: Text(
                  "Find Out More",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.white,
                        fontSize: 10.0,
                        letterSpacing: 0.2,
                        height: 1.0,
                      ),
                )),
            Positioned(
              left: 240.0,
              right: 10.0,
              top: 10.0,
              child: Image.asset(
                'assets/img/find_out_right.png',
                height: 100.0,
                width: 150.0,
              ),
            )
            // Image.asset('assets/img/find_out_right.png'),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: config.App(context).appWidth(44),
                margin: EdgeInsetsDirectional.only(start: 0, end: 5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: [
                          Image.asset(
                            'assets/img/tasty_food_box.png',
                            width: config.App(context).appWidth(45),
                            height: config.App(context).appHeight(17),
                          ), //our image widget here

                          Positioned(
                              left: 10.0,
                              top: 22.0,
                              child: SizedBox(
                                width: config.App(context).appWidth(45),
                                height: config.App(context).appHeight(10),
                                child: Text(
                                  'Tasty Food \nAt Your doorstep!!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                        color: Colors.pinkAccent,
                                        fontSize: 14.0,
                                        letterSpacing: 0.2,
                                        height: 1.0,
                                      ),
                                ),
                              )),
                          Positioned(
                            left: 10.0,
                            top: 55.0,
                            child: SizedBox(
                              width: config.App(context).appWidth(45),
                              height: config.App(context).appHeight(10),
                              child: Text(
                                'Select your favorite\ndishes & we will \ndeliver them \nto you on time.',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                      color: Colors.black,
                                      fontSize: 11.0,
                                      letterSpacing: 0.2,
                                      height: 1.0,
                                    ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10.0,
                            top: 105.0,
                            child: Image.asset(
                              'assets/img/tasty_food_arrow_left.png',
                              height: 20.0,
                              width: 20.0,
                            ),
                          ),
                          Positioned(
                            left: 100.0,
                            top: 65.0,
                            child: SizedBox(
                              child: Image.asset(
                                'assets/img/tasty_food_right.png',
                                width: 70.0,
                                height: 70.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              Container(
                width: config.App(context).appWidth(44),
                margin: EdgeInsetsDirectional.only(start: 0, end: 5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: [
                          Image.asset(
                            'assets/img/safe_food_box.png',
                            width: config.App(context).appWidth(45),
                            height: config.App(context).appHeight(17),
                          ), //our image widget here

                          Positioned(
                            left: 10.0,
                            top: 23.0,
                            child: SizedBox(
                              width: config.App(context).appWidth(45),
                              height: config.App(context).appHeight(10),
                              child: Text(
                                'Safe Food Delivery',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      color: Colors.deepPurpleAccent,
                                      fontSize: 15.0,
                                      letterSpacing: 0.2,
                                      height: 1.0,
                                    ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10.0,
                            top: 45.0,
                            child: SizedBox(
                              width: config.App(context).appWidth(45),
                              height: config.App(context).appHeight(10),
                              child: Text(
                                'Get Genie to pickup\n& drop on priority .',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                      color: Colors.black,
                                      fontSize: 11.0,
                                      letterSpacing: 0.2,
                                      height: 1.0,
                                    ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10.0,
                            top: 95.0,
                            child: Image.asset(
                              'assets/img/safe_food_left.png',
                              height: 20.0,
                              width: 20.0,
                            ),
                          ),
                          Positioned(
                            left: 100.0,
                            top: 65.0,
                            child: SizedBox(
                              child: Image.asset(
                                'assets/img/safe_food_right.png',
                                width: 60.0,
                                height: 60.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
