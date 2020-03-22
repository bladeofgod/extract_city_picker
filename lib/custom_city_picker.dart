





import 'package:flutter/material.dart';
import 'package:flutter_extract_city_picker/city_picker_plugin/meta/province.dart';

import 'city_picker_plugin/city_picker.dart';
import 'city_picker_plugin/model/result.dart';
import 'city_picker_plugin/show_types.dart';

class CustomCityPicker extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return CustomCityPickerState();
  }

}

class CustomCityPickerState extends State<CustomCityPicker> {
  @override
  Widget build(BuildContext context) {

    return Material(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                _showCityPicker();
              },
              child: Text("show city picker"),
            ),
          ],
        ),
      ),
    );
  }
  Result resultAttr = new Result();
  double barrierOpacityAttr = 0.5;
  bool barrierDismissibleAttr = false;
  double customerItemExtent = 40;

  bool customerItemBuilder = false;

  getItemBuilder() {
    if (customerItemBuilder) {
      return (item, list, index) {
        return Center(
            child: Text(item, maxLines: 1, style: TextStyle(fontSize: 55)));
      };
    } else {
      return null;
    }
  }


  _showCityPicker()async{

    Result tempResult = await CityPickers.showCityPicker(
        context: context,
        //theme: themeAttr != null ? themeAttr.value : null,
        locationCode: resultAttr != null
            ? resultAttr.areaId ??
            resultAttr.cityId ??
            resultAttr.provinceId
            : null,
        showType: ShowType.pca,
        isSort: false,//todo  我在 base_citiys(CityTree)中屏蔽了 拼音，所以排序应该无法使用，需要的话按功能恢复
        barrierOpacity: barrierOpacityAttr,
        barrierDismissible: barrierDismissibleAttr,
//        citiesData: customerMeta == true ? citiesData : null,
//        provincesData: customerMeta == true ? provincesData : null,
        citiesData: citiesData,
        provincesData: provincesData,
        itemExtent: customerItemExtent,
        cancelWidget:  Text('cancle') ,
        confirmWidget: Text('confirm') ,
        itemBuilder: this.getItemBuilder());
    if (tempResult == null) {
      return;
    }

  }

}























