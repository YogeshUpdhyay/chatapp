import 'package:dio/dio.dart';

class ChatController {
  Future<List<dynamic>?> getChats() async {
    try {
      var dio = Dio();
      final response = await dio.get("http://192.168.43.129:8000/chats");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<dynamic, dynamic>?> getChat(id) async {
    try {
      var dio = Dio();
      print("http://192.168.43.129:8000/chat/$id");
      final response = await dio.get("http://192.168.43.129:8000/chat/$id");
      if (response.statusCode == 200) {
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