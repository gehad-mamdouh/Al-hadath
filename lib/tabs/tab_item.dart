import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/models/SourceResponse.dart';

class TabItem extends StatelessWidget {
  final bool isSelected;
  final Source source;

  const TabItem({required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6, right: 12, left: 12),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primarylightColor.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppColors.primarylightColor : Colors.transparent,
          width: 2,
        ),
      ),
      child: Text(
        source.name ?? '',
        style: TextStyle(
          color: isSelected ? AppColors.primarylightColor : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 18,
        ),
      ),
    );
  }
}