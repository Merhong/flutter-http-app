import 'package:flutter/material.dart';
import 'package:flutter_http_app/model/user.dart';
import 'package:flutter_http_app/repository/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListPage(),
    );
  }
}

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {

    // 데이터를 기반으로 그림을 그려야 하므로 리턴전에 데이터 요청
    UserRepository ur = UserRepository();
    List<User> userList = ur.fetchUserList();

    return Scaffold(
      appBar: AppBar(
        title: Text("유저리스트"),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text("${userList[index].id}"),
            title: Text("${userList[index].username}"),
            subtitle: Text("${userList[index].email}"),
          );
        },
      ),
    );
  }
}
