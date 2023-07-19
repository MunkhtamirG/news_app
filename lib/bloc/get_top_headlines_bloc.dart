import 'package:news_app/model/article_response.dart';
import 'package:news_app/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class GetTopHeadlinesBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject =
      BehaviorSubject<ArticleResponse>();

  getTopHeadlines() async {
    ArticleResponse response = await _repository.getTopHeadlines();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;
}

final getTopHeadlinesBloc = GetTopHeadlinesBloc();
