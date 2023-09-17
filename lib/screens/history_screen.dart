import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unit_converter_app/constants/color_constant.dart';
import 'package:unit_converter_app/modules/history_model.dart';



class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key, required this.historyList}) : super(key: key);

final List<HistoryModel> historyList;
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}
class _HistoryScreenState extends State<HistoryScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: CustomColors.secondary),
        elevation: 0,
        backgroundColor: Colors.white,
        title:const  Text(
          'History',
          style: TextStyle(
            color: CustomColors.primary,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.historyList.length,
        itemBuilder: (BuildContext context, index) {
          return widget.historyList.isNotEmpty ?
           Column(
            children: [
              //BannerForADs(),
              Card(
                elevation: 5,
                child: ListTile(
                  title: Text(widget.historyList[index].unitName),
                  subtitle: Text(widget.historyList[index].result),
                  // trailing: IconButton(
                  //   onPressed: () {
                  //         setState(() {
                  //         DatabaseHelper.instance.delete(widget.historyList[index].id);
                  //           DatabaseHelper.instance.update(
                  //             id: widget.historyList[index].id!,
                  //             historyModel: HistoryModel(
                  //               unitName: 'Abc',
                  //               result: "anc",
                  //               date: DateTime.now().toString(),
                  //             ),
                  //           );
                  //         });
                  //   },
                  //   icon: const Icon(
                  //     Icons.edit,
                  //   ),
                  // ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:  EdgeInsets.all(8.0.sp),
                    child: Text(widget.historyList[index].date),
                  ),
                ],
              )
            ],
          )
          : const Center(child: Text("No data"),
          );
        },
      ),
    );
  }
}
