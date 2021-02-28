import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkHelper {
  NetworkHelper({this.url});

  final String url;

  Future getWeatherData() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
      // var itemCount = jsonResponse['totalItems'];
      // print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}