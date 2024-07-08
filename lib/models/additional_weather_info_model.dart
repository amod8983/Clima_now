import 'package:flutter/material.dart';

class AdditionalWeatherInfoModel {
  const AdditionalWeatherInfoModel(
      {required this.paramaterIcon,
      required this.parameterName,
      required this.parameterValue});

  final Icon paramaterIcon;
  final String parameterName;
  final String parameterValue;

  Map<String, String> get formattedParamValue {
    int firstSapceIndex = parameterValue.indexOf(" ");
    String firstPart = parameterValue.substring(0, firstSapceIndex);
    String secondPart = parameterValue.substring(firstSapceIndex+1);
    var result = {
      'first': firstPart,
      'second': secondPart
    };
    return result;
  }
}
