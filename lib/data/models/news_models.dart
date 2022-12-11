


import '../data.dart';

class NewsModels extends NewsEntities {
  NewsModels({
    final String? title,
    final String? author,
    final String? imageUrl,
    final String? content,
    final String? dateTime,
  }) : super(
          title: title,
          author: author,
          imageUrl: imageUrl,
          content: content,
          dateTime: _getDateTimeInDateTime(dateTime),
        );

  static DateTime _getDateTimeInDateTime(String? dateTime) {
    if (dateTime == null) {
      return DateTime.now();
    } else {
      final DateTime? formattedDateTime = DateTime.tryParse(dateTime);
      if (formattedDateTime == null) {
        return DateTime.now();
      } else {
        return formattedDateTime;
      }
    }
  }

  factory NewsModels.fromJson(Map<String, dynamic> json) {
    return NewsModels(
      title: json['title'],
      author: json['author'],
      content: json['content'],
      imageUrl: json['urlToImage'],
      dateTime: json['publishedAt'],
    );
  }
}

