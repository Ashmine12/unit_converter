import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:unit_converter_app/constants/color_constant.dart';
import 'package:unit_converter_app/database/database_helper.dart';
import 'package:unit_converter_app/modules/history_model.dart';
import 'package:unit_converter_app/widgets/custom_button.dart';
import 'package:unit_converter_app/widgets/gap.dart';

// ignore: must_be_immutable
class UnitConvertingScreen extends StatefulWidget {
  String title;
  List<String> list;
  Map<String, int> measureMap;
  dynamic formula;

  UnitConvertingScreen(this.list, this.title, this.formula, this.measureMap,
      {super.key});

  @override
  State<UnitConvertingScreen> createState() => _UnitConvertingScreenState();
}

class _UnitConvertingScreenState extends State<UnitConvertingScreen> {
  String? dropDownValue;
  String? dropDownValue2;
  String resultMessage = '';
  String resultMessage2 = '';
  double outPutMessage = 0;
  double? inputValue;
  TextEditingController inputValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: CustomColors.secondary),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              widget.title,
              style: const TextStyle(color: CustomColors.primary),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From :',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: CustomColors.secondary,
                                fontSize: 12.sp),
                          ),
                          Gap(height: 1.h),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 4.h,
                            width: 40.w,
                            padding: const EdgeInsets.only(left: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Center(
                              child: DropdownButton(
                                hint: const Text(
                                  'Select',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: CustomColors.secondary),
                                ),
                                underline: const SizedBox(),
                                value: dropDownValue,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Colors.grey,
                                  size: 4.h,
                                ),
                                items: widget.list.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          color: CustomColors.secondary),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  setState(
                                    () {
                                      dropDownValue = value!;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'To :',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: CustomColors.secondary,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 4.h,
                            width: 40.w,
                            padding: const EdgeInsets.only(left: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Center(
                              child: DropdownButton(
                                underline: const SizedBox(),
                                hint: const Text(
                                  'Select',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: CustomColors.secondary),
                                ),
                                value: dropDownValue2,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Colors.grey,
                                  size: 4.h,
                                ),
                                items: widget.list.map(
                                  (String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            color: CustomColors.secondary),
                                      ),
                                    );
                                  },
                                ).toList(),
                                onChanged: (String? value) {
                                  setState(
                                    () {
                                      dropDownValue2 = value!;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Input Data :',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: CustomColors.secondary,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          SizedBox(
                            height: 4.h,
                            width: 40.w,
                            child: TextField(
                              controller: inputValueController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String? value) {
                                inputValue =
                                    double.tryParse(inputValueController.text);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Output Data :',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: CustomColors.secondary,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            height: 4.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: EdgeInsets.all(3.0.sp),
                              child: Text(
                                textAlign: TextAlign.start,
                                outPutMessage.toString(),
                                style: const TextStyle(fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                GestureDetector(
                  onTap: () {
                    if (dropDownValue != null && dropDownValue2 != null) {
                      swapValue();
                    } else {
                      Fluttertoast.showToast(
                          msg: " Select the values",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: SvgPicture.asset('images/v13.svg'),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomButton(
                  onPressed: () {
                    if (dropDownValue != null &&
                        dropDownValue2 != null &&
                        inputValue != null) {
                      convert();
                      DatabaseHelper.instance.insert(
                        historyModel: HistoryModel(
                          unitName: '$dropDownValue to $dropDownValue2',
                          result: "$resultMessage $resultMessage2",
                          date: DateFormat.yMMMd().format(DateTime.now()),
                        ),
                      );
                    } else {
                      Fluttertoast.showToast(msg: 'plz Select values');
                    }
                  },
                  text: 'Result',
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0.sp),
                  child: Row(
                    children: [
                      Text(
                        resultMessage,
                        style: const TextStyle(
                            color: CustomColors.secondary,
                            fontFamily: 'Poppins'),
                      ),
                      Flexible(
                        child: Text(
                          resultMessage2,
                          style: const TextStyle(
                              color: CustomColors.primary,
                              overflow: TextOverflow.ellipsis),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// logic of unit converting and print result on the screen

  void convert() {
    if (inputValue != 0 && dropDownValue != null && dropDownValue2 != null) {
      int? from = widget.measureMap[dropDownValue];
      int? to = widget.measureMap[dropDownValue2];

      var multiplier = widget.formula[from.toString()][to];
      setState(() {
        resultMessage = "Result: ${inputValueController.text} $dropDownValue = ";
        resultMessage2 = "${inputValue! * multiplier} $dropDownValue2";
        outPutMessage = inputValue! * multiplier;
      });
    }
  }


//Swapping of values


  void swapValue() {
    debugPrint('Before swapping\n Input =  ${inputValue.toString()}');
    debugPrint('Before swapping\n Output =  ${outPutMessage.toString()}');
    setState(() {
      String tempValue = dropDownValue!;
      dropDownValue = dropDownValue2;
      dropDownValue2 = tempValue;

      double tempInput = inputValue!;
      inputValueController.text = outPutMessage.toString();
      inputValue = outPutMessage.toDouble();
      outPutMessage = tempInput;
    });
    debugPrint('After swapping\n Input =  ${inputValueController.text}');
    debugPrint('After swapping\n Output =  ${outPutMessage.toString()}');
  }
}
