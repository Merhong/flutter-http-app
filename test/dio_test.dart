import 'package:dio/dio.dart';

final dio = Dio();

void main() async {
  await getHttp();
}

Future<void> getHttp() async {
  final response = await dio.get('https://dart.dev');
  print("1");
  print(response.data);
  print("2");
}
