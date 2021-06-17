import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import '../helpers/custom_trace.dart';
import '../helpers/helper.dart';
import '../models/cart.dart';
import '../models/user.dart';
import '../repository/user_repository.dart' as userRepo;

Future<Stream<Cart>> getCart() async {
  User _user = userRepo.currentUser.value;
  if (_user.apiToken == null) {
    return new Stream.value(null);
  }
  final String _apiToken = 'api_token=${_user.apiToken}&';
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}addcart3/?${_apiToken}user_id=${_user.id}';
  print("GetAllCartData..$url");
  final client = new http.Client();
  final streamedRest = await client.send(http.Request('post', Uri.parse(url)));
  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .expand((data) => (data as List))
      .map((data) {
    print("getCaetResponse....$data");
    return Cart.fromJSON(data);
  });
}

Future<Stream<Cart>> getCartAgain() async {
  User _user = userRepo.currentUser.value;
  if (_user.apiToken == null) {
    return new Stream.value(null);
  }
  final String _apiToken = 'api_token=${_user.apiToken}&';
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}confmsndta?${_apiToken}user_id=${_user.id}';
  print("GetAllNewCartData..$url");
  final client = new http.Client();
  final streamedRest = await client.send(http.Request('post', Uri.parse(url)));
  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .expand((data) => (data as List))
      .map((data) {
    print("getCaetNewResponse....$data");
    return Cart.fromJSON(data);
  });
}

Future<Cart> getPayment(Cart cart) async {
  final String url =
      //'${GlobalConfiguration().getValue('api_base_url')}carts?${_apiToken}with=food;food.restaurant;extras&search=user_id:${_user.id}&searchFields=user_id:=';
      '${GlobalConfiguration().getValue('api_base_url')}paymenttype';
  print("PaymentDatas....$url");
  final client = new http.Client();
  final response = await client.post(
    url,
    //headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: {
      //"id": cart.id,
      "id": userRepo.currentUser.value.id,
      "payment_type": '0',
    },
  );
  print("resposePayment....${response.body}");
}

Future<Stream<int>> getCartCount() async {
  User _user = userRepo.currentUser.value;
  if (_user.apiToken == null) {
    return new Stream.value(0);
  }
  final String _apiToken = 'api_token=${_user.apiToken}&';
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}count/?api_token=${_apiToken}&user_id=${_user.id}';
  print("countCartUrl...$url");
  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map(
        (data) => Helper.getIntData(data),
      );
}

Future<Cart> addCart(Cart cart, bool reset) async {
  User _user = userRepo.currentUser.value;
  if (_user.apiToken == null) {
    return new Cart();
  }
  Map<String, dynamic> decodedJSON = {};
  // final String _apiToken = 'api_token=${_user.apiToken}';
  // final String _resetParam = 'reset=${reset ? 1 : 0}';
  // final String _user_id = 'user_id=${_user.id}';
  // final String _food_id = 'food_id=${cart.food.id}';
  // final String _quantity_id = 'quantity_id=${cart.quantity}';

  final int resetData = 0;
  if (reset == false) {
    resetData == 0;
  } else {
    resetData == 1;
  }
  print("resetP...$resetData");
  cart.userId = _user.id;
  //final String url = '${GlobalConfiguration().getValue('api_base_url')}addcarts?$_apiToken&$_resetParam';
  final String url = '${GlobalConfiguration().getValue('api_base_url')}addcart';
  print("AddcartData...$url");
  // print("UserData...${(cart.toMap())}");
  final client = new http.Client();
  print(
      "foodId...${cart.food.restaurant_id + cart.userId + cart.food.id + _user.apiToken + cart.quantity.toString()}");
  final response = await client.post(
    url,
    //headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: {
      "api_token": _user.apiToken,

      //"reset":resetData,
      "food_id": cart.food.id,
      "quantity": cart.quantity.toString(),

      "user_id": cart.userId,
      "rid": cart.food.restaurant_id,
    },
  );
  print("AddResponse..${response.body}");
  try {
    // decodedJSON = json.decode(response.body)['data'] as  Map<String, dynamic>;
    List<dynamic> data = decodedJSON['data'];
    print("Data..$data");
    //decodedJSON = json.decode(response.body)['data'] ;
    ///  print(decodedJSON);
  } on FormatException catch (e) {
    print(CustomTrace(StackTrace.current, message: e.toString()));
  }

  return Cart.fromJSON(decodedJSON);
}

Future<Cart> updateCart(Cart cart) async {
  User _user = userRepo.currentUser.value;
  if (_user.apiToken == null) {
    return new Cart();
  }
  Map<String, dynamic> decodedJSON = {};
  final String _apiToken = 'api_token=${_user.apiToken}';
  cart.userId = _user.id;
  // final String url = '${GlobalConfiguration().getValue('api_base_url')}carts/${cart.id}?$_apiToken';
  final String url = '${GlobalConfiguration().getValue('api_base_url')}addcart';
  print("update..$url");
  final client = new http.Client();
  print("restId...${cart.food.restaurant_id}");
  print("quantity...${cart.quantity}");
  print(
      "quantityData...${_user.apiToken + cart.food.id + cart.quantity.toString() + cart.userId}");
  final response = await client.post(
    url,
    // headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: {
      "api_token": _user.apiToken,

      // "reset":resetData,
      "food_id": cart.food.id,
      "quantity": cart.quantity.toString(),

      "user_id": cart.userId,
      "rid": cart.food.restaurant_id
    },
    // body: json.encode(cart.toMap()),
  );
  print("ResponseOfCUpdate...${json.decode(response.body)}");
  try {
    decodedJSON = json.decode(response.body);
    //List<dynamic> data = decodedJSON["data"];

    // decodedJSON = json.decode(response.body)['data'] as Map<String, dynamic>;
    ///  print(decodedJSON);
  } on FormatException catch (e) {
    print(CustomTrace(StackTrace.current, message: e.toString()));
  }
  return Cart.fromJSON(decodedJSON);
}

Future<bool> removeCart(Cart cart) async {
  User _user = userRepo.currentUser.value;
  if (_user.apiToken == null) {
    return false;
  }
  final String _apiToken = 'api_token=${_user.apiToken}';
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}addcart2/${_user.id}?$_apiToken';
  print("RemoveCarturl...$url");
  final client = new http.Client();
  // final response = await client.delete(
  //   url,
  //   headers: {HttpHeaders.contentTypeHeader: 'application/json'},
  // );
  final response = await client.post(
    url,
    body: {
      "item_id": cart.id,
    },
    //headers: {HttpHeaders.contentTypeHeader: 'application/json'},
  );
  print("RemoveResponse..${response.body}");
  return Helper.getBoolData(json.decode(response.body));
}
