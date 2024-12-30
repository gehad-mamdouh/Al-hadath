import 'package:flutter/material.dart';

import '../../models/Category.dart';

class CategoryItem extends StatelessWidget {
  Category category ;
  int index ;
  CategoryItem({required this.category,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(
                  index % 2 == 0 ? 25 : 0
              ),
              bottomRight: Radius.circular(
                  index % 2 != 0 ? 25 : 0
              )
          )
      ),
      child: Column(
        children: [
          Text(category.title,
            style: Theme.of(context).textTheme.titleLarge,)
        ],
      ),
    );
  }
}