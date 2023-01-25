import 'package:flutter/widgets.dart';

class DownloadNotifier with ChangeNotifier{
  double _value = 1;
  double get value => _value;
  startDownload()async{
    for(int i = 1; i <10 ; i++){
      await Future.delayed(Duration(milliseconds: 100,), (){
        _value = i.toDouble();
        notifyListeners();
      });
      // print(i * 0.01);
    }

  }

  resetValue(){
    _value = 1;
    notifyListeners();
  }

}