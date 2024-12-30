import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../models/Category.dart';
import '../settings/settings_tab.dart';
import 'category/category_details.dart';
import 'category/category_fragment.dart';
import 'category/drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category? selectedCategory;
  int selectedSideMenuItem = HomeDrawer.categories;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(),
        _buildScaffold(context),
      ],
    );
  }

  Widget _buildBackground() {
    return Container(
      color: AppColors.whiteColor,
      child: Image.asset(
        'assets/images/background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: _buildAppBar(context),
      drawer: Drawer(
        child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick),
      ),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.primarylightColor,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      title: Text(
        _getAppBarTitle().tr(),
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppColors.whiteColor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String _getAppBarTitle() {
    if (selectedSideMenuItem == HomeDrawer.settings) {
      return 'Settings'.tr();
    } else if (selectedCategory == null) {
      return 'Al-Hadath'.tr();
    } else {
      return selectedCategory!.title.tr();
    }
  }

  Widget _buildBody() {
    if (selectedSideMenuItem == HomeDrawer.settings) {
      return SettingTab();
    } else if (selectedCategory == null) {
      return CategoryFragment(onCategoryItemClick: onCategoryItemClick);
    } else {
      return CategoryDetails(category: selectedCategory!);
    }
  }

  void onCategoryItemClick(Category newCategory) {
    setState(() {
      selectedCategory = newCategory;
    });
  }

  void onSideMenuItemClick(int newSideMenuItem) {
    setState(() {
      selectedSideMenuItem = newSideMenuItem;
      selectedCategory = null;
      Navigator.pop(context);
    });
  }
}
