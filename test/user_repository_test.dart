/* 통신 테스트 */

import 'package:dio/dio.dart';
import 'package:flutter_http_app/model/user.dart';

final dio = Dio();

void main() async {
  // await fetchUser_test();
  await fetchUserList_test();
}

// 여러건 수신시 사용
Future<List<User>> fetchUserList_test() async {
  Response<dynamic> response = await dio.get("http://192.168.0.50:8080/user/");
  print(response.data);

  List<dynamic> bodyList = response.data as List<dynamic>;
  List<User> userList = bodyList.map((e) => User.fromJson(e)).toList();
  print(userList[0].username);

  return userList;
}

// 한건 수신시 사용
// await가 걸려있으면 Future를 붙여서 빈 택배박스를 들고 나오게 만들어준다.
Future<User> fetchUser_test(int id) async {
  // app 입장에서 localhost를 넣으면 못 찾는다!!!
  // ip 주소를 넣어줘야한다.
  // dio.get("http://192.168.0.50:8080/user");

  Response<dynamic> response =
      await dio.get("http://192.168.0.50:8080/user/$id");
  print(response.data);
  
  // 다운캐스팅!!!
  // Map 혹은 리스트로 Map을 감싼 컬렉션이 들어올 수 있어서
  Map<String, dynamic> body = response.data as Map<String, dynamic>;
  print(body["username"]);

  User user = User.fromJson(body);
  return user;
}