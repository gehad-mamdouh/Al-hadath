import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/models/api_constants.dart';
import 'package:news_app/models/newsResponse.dart';

class ApiManger {
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceApi, {
      'apiKey': ApiConstants.apiKey,
      'category':categoryId
    });
    var response = await http.get(url);
    try {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  /*https://newsapi.org/v2/everything?q=bitcoin&apiKey=448f41e0b86a4c849ad922b6994956f4*/
  static Future<NewsResponse?> getNewsBySourceId(String sourceId)async {
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,{
      'apiKey': ApiConstants.apiKey,
      'sources':sourceId,

    });
    var response=await http.get(url);
    try{
    var responseBody=response.body; //string
    var json=jsonDecode(responseBody); //json
    return NewsResponse.fromJson(json);
    }
    catch(e){
      throw e;
    }

  }
}
