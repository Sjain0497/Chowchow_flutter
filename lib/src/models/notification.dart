import '../helpers/custom_trace.dart';

class Notification {
  String id;
  String Order_id;
  String Order_status;
  String type;
  Map<String, dynamic> data;
  bool read;
  DateTime createdAt;

  Notification();

  Notification.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      Order_id = jsonMap['order_id'].toString();
      Order_status = jsonMap['order_status'].toString();
      type = jsonMap['type'] != null ? jsonMap['type'].toString() : '';
      data = jsonMap['data'] != null ? {} : {};
      read = jsonMap['read_at'] != null ? true : false;
      createdAt = DateTime.parse(jsonMap['created_at']);
    } catch (e) {
      id = '';
      Order_id = '';
      Order_status = '';
      type = '';
      data = {};
      read = false;
      createdAt = new DateTime(0);
      print(CustomTrace(StackTrace.current, message: e));
    }
  }

  Map markReadMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["read_at"] = !read;
    return map;
  }
}
