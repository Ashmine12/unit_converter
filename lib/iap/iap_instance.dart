import 'package:in_app_purchase/in_app_purchase.dart';

class IAPConnection{
  static InAppPurchase? inAppPurchase;
  static set instance(InAppPurchase value){
    inAppPurchase = value;
  }

  static InAppPurchase get instance{
    inAppPurchase??= InAppPurchase.instance;
    return inAppPurchase!;
  }
}