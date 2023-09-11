import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class HttpService {
  String adress = 'http://192.168.7.49:8000';

  Future<List<dynamic>> getSummary() async {
    print("===========entered==================");
    var url = Uri.parse('$adress/sum/');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("==================CATCH=====================");
      throw Exception("Exception: $e");
    }
  }

  Future<String?> getSummaryId() async {
    String apiUrl = '$adress/sum/';
    try {
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        List<dynamic> summaries = responseData['summaries'];
        if (summaries.isNotEmpty) {
          String summaryId = summaries[0]['id'].toString();
          return summaryId;
        }
      }
    } catch (e) {
      print('Error during HTTP request: $e');
    }
    return null;
  }

  Future<List<dynamic>> getSummaryQuizz(String summaryId) async {
    String apiUrl = '$adress/quizz/?summary=$summaryId';
    try {
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body) as List<dynamic>;
        print(responseBody);
        return responseBody;
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("==================CATCH=====================");
      throw Exception("Exception: $e");
    }
  }

  Future<List<dynamic>> getKeypointQuizz(String KeypointId) async {
    String apiUrl = '$adress/quizz/?summary=$KeypointId';
    try {
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body) as List<dynamic>;
        print(responseBody);
        return responseBody;
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("==================CATCH=====================");
      throw Exception("Exception: $e");
    }
  }
}
