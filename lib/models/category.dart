import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart'; // استيراد easy_localization

class Category {
  String id;
  String title;

  Category({required this.id, required this.title});

  String getTranslatedTitle(BuildContext context) {
    return title.tr();
  }

  static List<Category> getCategories() {
    return [
      Category(
        id: 'sports',
        title: 'Sports',
      ),
      Category(
        id: 'general',
        title: 'General',
      ),
      Category(
        id: 'health',
        title: 'Health',
      ),
      Category(
        id: 'business',
        title: 'Business',
      ),
      Category(
        id: 'entertainment',
        title: 'Entertainment',
      ),
      Category(
        id: 'science',
        title: 'Science',
      ),
      Category(
        id: 'technology',
        title: 'Technology',
      ),
    ];
  }
}