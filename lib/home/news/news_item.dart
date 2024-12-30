import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../app_colors.dart';
import '../../models/newsResponse.dart';

class NewsItem extends StatelessWidget {
  final News news;

  NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? "",
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.primarylightColor,
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            news.author ?? "Unknown Author",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            news.description ?? "No description available.",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.blackColor,
                ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            news.publishedAt ?? "Unknown Date",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
