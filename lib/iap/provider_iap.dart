// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:in_app_purchase/in_app_purchase.dart';
// import 'package:unit_converter/iap/iap_ids.dart';
// import 'package:unit_converter/iap/iap_instance.dart';
// import 'package:unit_converter/iap/purchasable_products.dart';
// import 'package:unit_converter/iap/store_status.dart';
//
// class Purchase extends ChangeNotifier {
//   StoreState storeState = StoreState.loading;
//   late StreamSubscription<List<PurchaseDetails>> subscription;
//   List<PurchasableProduct> products = [];
//   final iapConnection = IAPConnection.instance;
//   Purchase() {
//     final purchaseUpdate =
//         iapConnection.purchaseStream;
//      subscription = purchaseUpdate.listen(onPurchaseUpdate,
//      onDone: updateStreamDone,
//          onError: updateStreamError);
//      loadPurchases();
//   }
//
//   Future<void> loadPurchases() async{
//     final available = await iapConnection.isAvailable();
//     if(!available){
//       storeState =  StoreState.notAvailable;
//       notifyListeners();
//       return;
//     }
//     const ids = <String>{
//       storeKeyConsumable,
//     };
//     final response = await iapConnection.queryProductDetails(ids);
//     for (var element in response.notFoundIDs){
//       debugPrint('Purchases $element not found');
//     }
//     products = response.productDetails.map((e) => PurchasableProduct(e)).toList();
//     storeState = StoreState.isAvailable;
//     notifyListeners();
//   }
// @override
//   void dispose(){
//     subscription.cancel();
//     super.dispose();
//   }
//
//   Future<void> buy(PurchasableProduct product) async {
//     final purchaseParam = PurchaseParam(productDetails: product.productDetails);
//     switch (product.id) {
//       case storeKeyConsumable:
//         await iapConnection.buyConsumable(purchaseParam: purchaseParam);
//         break;
//       default:
//         throw ArgumentError.value(
//             product.productDetails, '${product.id} is not a known product');
//     }
//   }
//
//   void onPurchaseUpdate(List<PurchaseDetails> purchaseDetailsList) {
//     purchaseDetailsList.forEach(handlePurchase);
//     notifyListeners();
//   }
//   void handlePurchase(PurchaseDetails purchaseDetails){
// if(purchaseDetails.status == PurchaseStatus.purchased){
//   switch(purchaseDetails.productID){
//     case storeKeyConsumable:
//
//
//
//   }
// }
//   }
//
//   void updateStreamDone() {
//     subscription.cancel();
//   }
//
//   void updateStreamError(dynamic error) {
//
//   }
//
//
// }
