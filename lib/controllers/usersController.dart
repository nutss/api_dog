import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_dog/models/usersModel.dart';
import 'package:flutter/foundation.dart';



  //Fetch data from Restful API
  Future<List<Users>> usersFetchAPI(http.Client client) async {

    var url = Uri.https('ec1.classicscan.co.th:4000', '/v1.0/hr1');
    var response = await client.get(url);

    if(response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);

      if(mapResponse["error"] == false) {
        final toUsers = mapResponse["data"].cast<Map<String, dynamic>>();
        final listOfUsers = await toUsers.map<Users>((json) {
          return Users.fromJson(json);
        }).toList();
        return listOfUsers;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load Todo from the Internet');
    }
  }
class UserProvider with ChangeNotifier{
  int _userID = 0;
  int get userID => _userID;
  set userID(int newValue) {
    _userID = newValue;
    notifyListeners();
  }

  int _userINDEX = 0;
  int get userINDEX => _userINDEX;
  set userINDEX(int newValue) {
    _userINDEX = newValue;
    notifyListeners();
  }

  String _process;
  String get process => _process;
  set process(String newValue) {
    _process = newValue;
    notifyListeners();
  }

  List<Users> User = [];

    UserProvider() {
      fetchData();
    }

    // ดึงข้อมูล
    void fetchData() async {

      //ดึงข้อมูล API มาแสดงผล
      final httpUsersFetchData = await usersFetchAPI(http.Client());
      User = httpUsersFetchData;

      //แจ้งเตือน Consumer
      notifyListeners();

    }

}