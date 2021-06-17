import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../controllers/home_controller.dart';
import '../elements/CaregoriesCarouselWidget.dart';
import '../elements/FoodsCarouselWidget.dart';
import '../elements/HomeSliderWidgetNew.dart';
import '../elements/SearchBarWidget.dart';
import '../elements/ShoppingCartButtonWidget.dart';
import '../repository/settings_repository.dart' as settingsRepo;
import 'liveForFoodPage.dart';

class HomeWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  HomeWidget({Key key, this.parentScaffoldKey}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends StateMVC<HomeWidget> {
  HomeController _con;

  _HomeWidgetState() : super(HomeController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
          onPressed: () => widget.parentScaffoldKey.currentState.openDrawer(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: ValueListenableBuilder(
          valueListenable: settingsRepo.setting,
          builder: (context, value, child) {
            return Text(
              value.appName ?? S.of(context).home,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .merge(TextStyle(letterSpacing: 1.3)),
            );
          },
        ),
        actions: <Widget>[
          // new InkWell(
          //   onTap: () {
          //     widget.parentScaffoldKey.currentState.openEndDrawer();
          //   },
          //   child: Container(
          //     padding:
          //         const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(5)),
          //       //color: Theme.of(context).focusColor.withOpacity(0.1),
          //     ),
          //     // child: Icon(
          //     //   Icons.filter_alt_rounded,
          //     //   color: Theme.of(context).hintColor,
          //     //   size: 21,
          //     // ),
          //   ),
          // ),
          new ShoppingCartButtonWidget(
              iconColor: Theme.of(context).hintColor,
              labelColor: Theme.of(context).accentColor),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _con.refreshHome,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              //SlidingUpPanelExample(),
              //search
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SearchBarWidget(
                  onClickFilter: (event) {
                    widget.parentScaffoldKey.currentState.openEndDrawer();
                  },
                ),
              ),
              //slider

              //HomeSliderWidget(slides: _con.slides),
              HomeSliderWidgetNew(slides: _con.offerFoods),
/*   case 'categories_heading':
                    return*/
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  leading: Icon(
                    Icons.category,
                    color: Theme.of(context).hintColor,
                  ),
                  title: Text(
                    S.of(context).food_categories,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              /* case 'categories':
                    return*/
              CategoriesCarouselWidget(
                categories: _con.categories,
              ),
              // 'trending_week_heading':
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Icon(
                  Icons.trending_up,
                  color: Theme.of(context).hintColor,
                ),
                title: Text(
                  S.of(context).trending_this_week,
                  style: Theme.of(context).textTheme.headline4,
                ),
                subtitle: Text(
                  S.of(context).clickOnTheFoodToGetMoreDetailsAboutIt,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),

              //popularfood
              FoodsCarouselWidget(
                  foodsList: _con.trendingFoods, heroTag: 'home_food_carousel'),

              //liveForfood
              LiveForFoodView(),
            ],
          ),
        ),
      ),
    );
  }
}
