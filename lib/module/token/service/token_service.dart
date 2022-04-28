import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../const/const_variable.dart';
import '../model/snapshot_model.dart';

class TokenService extends GetConnect{
  TokenService(){
    httpClient.timeout = const Duration(seconds: 20);
  }

  Future<dynamic> getCurrentTokenData() async{
    print('get current component data');
    final response = await get('${ConstVariable.apiHost}snapshot/locale/global/markets/crypto/tickers?apiKey=${ConstVariable.apiKey}');
    if (kDebugMode) {
      print("RESPONSE ${response.body}");
    }
    if(response.status.hasError){
      return Future.error(response.statusText!);
    } else {
      return SnapshotModel.fromJson(response.body);
    }
  }
}