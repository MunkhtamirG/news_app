import 'package:dio/dio.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/model/article_response.dart';
import 'package:news_app/model/source_response.dart';

class NewsRepository {
  static String mainUrl = 'https://newsapi.org/v2/';
  final String apiKey = 'a925738d610b4acda6a3dc924b224072';

  final Dio _dio = Dio();

  var getSourcesUrl = '$mainUrl/sources';
  var getTopHeadlinesUrl = '$mainUrl/top-headlines';
  var everythingUrl = '$mainUrl/everything';

  Future<SourceResponse> getSources() async {
    var params = {'apiKey': apiKey, 'language': 'en', 'country': 'us'};

    try {
      Response response =
          await _dio.get(getSourcesUrl, queryParameters: params);
      return SourceResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      return SourceResponse.withError(error.toString());
    }
  }

  Future<ArticleResponse> getTopHeadlines() async {
    var params = {'apiKey': apiKey, 'country': 'us'};

    try {
      Response response =
          await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      return ArticleResponse.withError(error.toString());
    }
  }

  Future<ArticleResponse> getHotNews() async {
    var params = {'apiKey': apiKey, 'q': 'apple', 'sortBy': 'popularity'};

    try {
      Response response =
          await _dio.get(everythingUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      return ArticleResponse.withError(error.toString());
    }
  }

  Future<ArticleResponse> getSourceNews(String sourceId) async {
    var params = {'apiKey': apiKey, 'sources': sourceId};

    try {
      Response response =
          await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      return ArticleResponse.withError(error.toString());
    }
  }

  Future<ArticleResponse> search(String searchValue) async {
    var params = {'apiKey': apiKey, "q": searchValue};

    try {
      Response response =
          await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      return ArticleResponse.withError(error.toString());
    }
  }
}
