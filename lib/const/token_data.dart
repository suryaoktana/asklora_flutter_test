import 'package:timeago/timeago.dart' as timeago;

class TokenDataList{
  static List<TokenModel> dataToken = [
    TokenModel('ADA-USD', 'Cardano', 'assets/token_icon/cardano.png'),
    TokenModel('BTC-USD', 'Bitcoin', 'assets/token_icon/btc.png'),
    TokenModel('DASH-USD', 'Dash', 'assets/token_icon/dash.png'),
    TokenModel('DOGE-USD', 'Doge', 'assets/token_icon/dogecoin.png'),
    TokenModel('EOS-USD', 'Eos', 'assets/token_icon/eos.png'),
    TokenModel('ETH-USD', 'Ethereum', 'assets/token_icon/ethereum.png'),
    TokenModel('LTC-USD', 'Litecoin', 'assets/token_icon/litecoin.png'),
    TokenModel('NEO-USD', 'Neo', 'assets/token_icon/neo.png'),
    TokenModel('USDT-USD', 'USDT', 'assets/token_icon/usdt.png'),
    TokenModel('WAVES-USD', 'Waves', 'assets/token_icon/waves.png'),
    TokenModel('XMR-USD', 'Monero', 'assets/token_icon/monero.png'),
  ];
}

class TokenModel{
  String pair;
  String name;
  String imageAssetPath;
  double volume;
  double openPrice;
  bool favorite;
  bool isSubscribed;
  DateTime? lastSynced;
  TokenModel(this.pair, this.name, this.imageAssetPath, {this.openPrice=0, this.volume=0, this.favorite=false, this.isSubscribed=false, this.lastSynced});
  String timeAgo(){
    final fifteenAgo = DateTime.now().subtract(DateTime.now().difference(lastSynced!));
    return timeago.format(fifteenAgo);
  }
}
