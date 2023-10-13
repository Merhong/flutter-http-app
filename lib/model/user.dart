/*
Model - 서버로 부터 받을 데이터 타입을 정의
(서버측 테이블과 동일하게 만들면 된다!!!)
DTO랑은 다르다.
Map으로 데이터를 받아서 Json으로 컨버팅하기 위해 사용하는게 목적임
 */

// Getter, Setter 필요 없음
class User {
  int? id;
  String? username;
  String? password;
  String? email;

  User({this.id, this.username, this.password, this.email});

  // Map을 받는 것이지만 컨벤션으로 fromJson으로 쓰는 거임
  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    username = json["username"];
    password = json["password"];
    email = json["email"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "password": password,
      "email": email
    };
  }
}
