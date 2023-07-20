import 'package:assignment/models/products.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<Products?> getProducts() async {
    var client = http.Client();

    var uri = Uri.parse('https://dummyjson.com/products');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return Products.fromJson(json as Map<String, dynamic>);
    } else {
      // If the response status code is not 200, return null or handle the error accordingly.
      // For simplicity, I'll return null here, but you can add error handling logic as needed.
      return null;
    }
  }
}
