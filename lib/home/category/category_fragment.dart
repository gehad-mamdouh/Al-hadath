import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../models/Category.dart';

class CategoryFragment extends StatelessWidget {
  final categoriesList = Category.getCategories();
  final Function onCategoryItemClick;

  CategoryFragment({super.key, required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    final categoryColors = [
      Colors.green,
      Colors.blueAccent,
      Colors.pinkAccent,
      Colors.orange,
      Colors.purple,
      Colors.redAccent,
      Colors.grey,
    ];

    final categoryIcons = [
      Icons.sports,
      Icons.public,
      Icons.favorite,
      Icons.work,
      Icons.videogame_asset,
      Icons.science,
      Icons.computer,
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your category\nof interest'.tr(),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primarylightColor,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: categoriesList.length,
              itemBuilder: (context, index) {
                final category = categoriesList[index];
                return InkWell(
                  onTap: () {
                    onCategoryItemClick(category);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: categoryColors[index % categoryColors.length],
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                categoryIcons[index % categoryIcons.length],
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: categoryColors[index % categoryColors.length]
                                  .withOpacity(0.2),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                category.id.tr(),  // ترجمة اسم الكاتيجوري هنا
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primarylightColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}