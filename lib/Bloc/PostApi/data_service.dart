import 'dart:developer';
import 'package:http/http.dart' as http;
class DataService {
  Future<http.Response?> getPosts() async {
    const _baseUrl ='jsonplaceholder.typicode.com';
    try {
      // final url = Uri.https(_baseUrl, '/photos');
      // final response = await http.get(url);
      // return response;
      var client=http.Client();
      var response=await client.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      // log('-------------------------------');
      // log('form data service${response.body[5]}');
      // log('-------------------------------');
      return response;
    } catch (e) {
      log('Error=====$e');
      rethrow;
    }
  }
}




