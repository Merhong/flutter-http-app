import 'package:dio/dio.dart';
import 'package:flutter_http_app/model/user.dart';

final dio = Dio(
    // baseUrl 설정시 dio.get에 주소를 따로 안적어도 된다! /user로 끝
    BaseOptions(baseUrl: "http://192.168.0.50:8080"));

class UserRepository {
  // 여러건 수신시 사용
  Future<List<User>> fetchUserList() async {
    Response<dynamic> response =
        await dio.get("/user"); // baseUrl 설정해서 이렇게 사용가능
    print(response.data);

    List<dynamic> bodyList = response.data as List<dynamic>;
    List<User> userList = bodyList.map((e) => User.fromJson(e)).toList();
    print(userList[0].username);

    return userList;
  }

// 한건 수신시 사용
// await가 걸려있으면 Future를 붙여서 빈 택배박스를 들고 나오게 만들어준다.
  Future<User> fetchUser(int id) async {
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
}
