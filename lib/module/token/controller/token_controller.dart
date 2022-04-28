import 'dart:convert';

import 'package:asklora_flutter_test/const/const_variable.dart';
import 'package:asklora_flutter_test/const/token_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:web_socket_channel/io.dart';

import '../model/aggregates_model.dart';
import '../model/snapshot_model.dart';
import '../service/token_service.dart';

class TokenController extends GetxController with WidgetsBindingObserver {
  var isLoading = false.obs;
  var favoriteLength = 0.obs;
  var tokenDataList = <TokenModel>[].obs;
  var searchTokenDataList = <TokenModel>[].obs;
  late var channel;
  bool wsConnected = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance!.addObserver(this);
    initiateData('/main');
  }

  void initiateData(String fromRoute) async{
    await GetStorage().initStorage;
    isLoading.value = true;
    tokenDataList.value = await getAllData();
    doSortByFavorite();
    initiateWebSocket();
    isLoading.value = false;
    if(fromRoute=='/main'){
      Get.offNamed('/parent_tab');
    }
  }

  bool getFavoriteFromStorage(String pair){
    final fav = GetStorage().read('fav_$pair');
    if(fav!=null){
      if(fav=='1') {
        favoriteLength++;
        return true;
      } else {
        return false;
      }
    }
    else{
      return false;
    }
  }

  Future <List<TokenModel>> getAllData() async{
    List<TokenModel> tokenDataList = TokenDataList.dataToken;
    SnapshotModel snapshotModel = await TokenService().getCurrentTokenData();
    if(snapshotModel.status=="OK"){
      for (var element in tokenDataList) {
        element.favorite = getFavoriteFromStorage(element.pair);
        Tickers? tickers = snapshotModel.tickers!.firstWhereOrNull((item) => "X:${element.pair.replaceAll("-", "")}"==item.ticker);
        if(tickers!=null){
          element.openPrice = tickers.lastTrade!.p??0;
          element.volume = tickers.day!.v??0;
        }
      }
    }
    return tokenDataList;
  }

  authenticateWebSocket(){
    channel.sink.add(json.encode({
      "action": "auth",
      "params": ConstVariable.apiKey
    }));

  }

  subscribeToken(){
      for (var element in tokenDataList) {
        channel.sink.add(json.encode(
            {"action": "subscribe", "params": "XA.${element.pair}"}));
        element.isSubscribed=true;
        if(tokenDataList.firstWhereOrNull((item) => item.isSubscribed == false)==null) {
          if (kDebugMode) {
            print("All Token Subscribed");
          }
        }
      }
  }

  void processData(String message){
    List<dynamic> decodedJson = json.decode(message);
    for (var element in decodedJson) {
      AggregatesModel aggregatesModel = AggregatesModel.fromJson(element);
      if(aggregatesModel.ev=="XA"){
        isLoading.value = true;
        int index = tokenDataList.indexWhere((item) => item.pair == aggregatesModel.pair);
        tokenDataList[index].openPrice = aggregatesModel.o??0;
        tokenDataList[index].volume = aggregatesModel.v??0;
        tokenDataList[index].lastSynced = DateTime.now();
        isLoading.value = false;
      }
    }
  }

  void initiateWebSocket(){
    channel = IOWebSocketChannel.connect(ConstVariable.webSocketUrl);
    authenticateWebSocket();
    subscribeToken();
    channel.stream.listen((message) {
      if (kDebugMode) {
        if(message.contains('connected')){
          wsConnected = true;
        }
        print(message);
      }
      processData(message);
      }, onDone: () {
        wsConnected = false;
        debugPrint('ws channel closed');
      },
    );
  }

  void doSortByFavorite(){
    tokenDataList.sort((a, b) {
      if(b.favorite) {
        return 1;
      }
      return -1;
    });
  }

  void markAsFavorite(String pair){
    isLoading.value = true;
    favoriteLength++;
    tokenDataList[tokenDataList.indexWhere((element) => element.pair == pair)].favorite = true;
    GetStorage().write('fav_$pair', '1');
    doSortByFavorite();
    isLoading.value = false;
  }

  void unmarkAsFavorite(String pair){
    isLoading.value = true;
    favoriteLength--;
    tokenDataList[tokenDataList.indexWhere((element) => element.pair == pair)].favorite = false;
    GetStorage().write('fav_$pair', '0');
    doSortByFavorite();
    isLoading.value = false;
  }

  void initiateSearchResult(){
    searchTokenDataList.clear();
  }

  void searchToken(String keyword){
    isLoading.value = true;
    searchTokenDataList;
    if (keyword.isEmpty) {
      searchTokenDataList.clear();
    } else {
      searchTokenDataList.value = tokenDataList
          .where((element) =>
          element.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    isLoading.value = false;

  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed){
      print('resumed');
      if(!wsConnected){
        initiateWebSocket();
      }
    }
  }
}
