import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:news_app/provider/my_provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // العنوان مع أيقونة
            Row(
              children: [
                Icon(
                  Icons.language_outlined,
                  size: 30,
                  color: AppColors.primarylightColor,
                ),
                const SizedBox(width: 10),
                Text(
                  tr('Language Settings'),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: AppColors.primarylightColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // صندوق تغيير اللغة
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primarylightColor, AppColors.whiteColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tr('Select Language'),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  DropdownButton<String>(
                    value: provider.langCode,
                    onChanged: (String? newLang) {
                      if (newLang != null) {
                        provider.changeLanguage(newLang);
                        context.setLocale(Locale(newLang));
                      }
                    },
                    items: [
                      DropdownMenuItem(
                        value: 'en',
                        child: Row(
                          children: [
                            Icon(Icons.language, color: Colors.green),
                            const SizedBox(width: 10),
                            Text(
                              'English',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'ar',
                        child: Row(
                          children: [
                            Icon(Icons.language, color: Colors.blue),
                            const SizedBox(width: 10),
                            Text(
                              'العربية',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    underline: SizedBox(),
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // قسم إضافي للشرح
            Center(
              child: Text(
                tr('Change the app language to suit your preference.'),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            // زر الحفظ (اختياري)
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(tr('Language updated successfully!')),
                      backgroundColor: AppColors.primarylightColor,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primarylightColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  tr('Save'),
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}