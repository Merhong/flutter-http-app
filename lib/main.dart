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
    return Scaffold(
      appBar: AppBar(
        title: Text("유저리스트"),
      ),
      // 통신시 FutureBuilder를 안쓰면 그림을 못 그린다!!!
      // 리턴 타입을 뒤에 적어준다. <List<User>>
      body: FutureBuilder<List<User>>(
        // 통신시 Repository에서 데이터를 가져와서 snapshot으로 던짐
        future: UserRepository().fetchUserList(),
        // 데이터를 뿌림
        builder: (context, snapshot) {
          print("그림 그려짐!!!!!!!!!");
          // 스냅샷에 데이터 있다? 통신 끝남
          if (snapshot.hasData) {
            // userList가 null이면 빈 배열을 준다.
            List<User> userList = snapshot.data ?? [];
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${userList[index].id}"),
                  title: Text("${userList[index].username}"),
                  subtitle: Text("${userList[index].email}"),
                );
              },
            );
          }
          // 스냅샷에 데이터가 없다? 통신중인 상태
          else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
