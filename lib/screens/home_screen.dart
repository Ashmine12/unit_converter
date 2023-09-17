import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:unit_converter_app/constants/assets.dart';
import 'package:unit_converter_app/constants/color_constant.dart';
import 'package:unit_converter_app/database/database_helper.dart';
import 'package:unit_converter_app/modules/history_model.dart';
import 'package:unit_converter_app/screens/history_screen.dart';

import 'unit_converting_screen.dart';
import '../modules/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HistoryModel> historyList = [];
  final searchFieldText = TextEditingController();

  void clearText() {
    searchFieldText.clear();
    searchList(searchFieldText.text);
  }

  List<SearchValues> homeContents = [];
  @override
  void initState() {
    homeContents = searchItems;
    super.initState();
  }

// searchbar

  void searchList(String enteredKeyword) {
    List<SearchValues> results = [];
    if (enteredKeyword.isEmpty) {
      results = searchItems;
    } else {
      results = searchItems
          .where((element) => element.title
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      homeContents = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'Unit Converter',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: CustomColors.primary),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: GestureDetector(
                  onTap: () async {
                    historyList = await DatabaseHelper.instance.getData();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HistoryScreen(
                          historyList: historyList,
                        ),
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    Assets.historyLogo,
                    width: 7.w,
                    height: 3.h,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: TextField(
                  controller: searchFieldText,
                  onChanged: (value) => searchList(value),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 1.h,
                      horizontal: 1.h,
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(fontSize: 15.sp),
                    prefixIcon: Icon(Icons.search_rounded, size: 15.sp),
                    suffixIcon: searchFieldText.text.isEmpty
                        ? null
                        : GestureDetector(
                            onTap: () {
                              clearText();
                            },
                            child: Padding(
                              padding: EdgeInsets.all(14.0.sp),
                              child: SvgPicture.asset(
                                "images/c.svg",
                              ),
                            ),
                          ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3 / 2, crossAxisCount: 2),
                  itemCount: homeContents.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UnitConvertingScreen(
                              homeContents[index].list,
                              homeContents[index].title,
                              homeContents[index].formula,
                              homeContents[index].measuermap,
                            ),
                          ),
                        );
                        debugPrint(index.toString());
                      },
                      child: Card(
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        color: Colors.white,
                        margin: EdgeInsets.all(10.sp),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(homeContents[index].images,
                                width: 10.w, height: 6.h),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              homeContents[index].title,
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: CustomColors.primary,
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
        ),
      ),
    );
  }
}
