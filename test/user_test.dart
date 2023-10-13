import 'package:flutter_http_app/model/user.dart';

void main() {
  // 1. User 객체 만들기
  User u1 =
      User(id: 1, username: "ssar", password: "1234", email: "ssar@nate.com");
  print(u1.username);

  // 2. User Map 만들기
  Map<String, dynamic> u2 = {
    "id": 2,
    "username": "cos",
    "password": "1234",
    "email": "cos@nate.com"
  };
  print(u2["username"]);

  // 3. Map -> (Dart) Object 변환 (수신, Receive)
  User u3 = User.fromJson(u2);
  print(u3.username);

  // 4. (Dart) Object -> Map 변환 (송신, Send)

}
