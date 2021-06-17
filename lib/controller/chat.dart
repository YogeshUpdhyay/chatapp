import 'package:dio/dio.dart';

class ChatController {
  Future<List<Map<String, dynamic>>?> getChats() async {
    try {
      var dio = Dio();
      final response = await dio.get("http://192.168.43.129:8000/chats");
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}