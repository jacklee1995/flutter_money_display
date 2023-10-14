import 'package:flutter/material.dart';
import 'enums.dart';

/// 格式化整数部分，添加千分位分隔符
String formatWithComma(String price) {
  final parts = price.split('.');
  final wholePart = parts[0];
  final decimalPart = parts.length > 1 ? '.${parts[1]}' : '';
  final regex = RegExp(r'\B(?=(\d{3})+(?!\d))');
  return wholePart.replaceAllMapped(regex, (Match match) => ',') + decimalPart;
}

/// 创建富文本
TextSpan fText(
  String text,
  double fontSize,
  Color color,
  FontWeight fontWeight,
) {
  return TextSpan(
    text: text,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

String getCurrencySymbol(
    CurrencySymbol currencySymbol, String customCurrencySymbol) {
  if (currencySymbol == CurrencySymbol.custom) {
    return customCurrencySymbol;
  } else {
    return getCurrencySymbolFromEnum(currencySymbol);
  }
}

/// 枚举值转换为货币符号
String getCurrencySymbolFromEnum(CurrencySymbol symbol) {
  switch (symbol) {
    case CurrencySymbol.dollar:
      return '\$';
    case CurrencySymbol.euro:
      return '€';
    case CurrencySymbol.yuan:
      return '¥';
    case CurrencySymbol.franc:
      return '₣';
    case CurrencySymbol.ruble:
      return '₽';
    default:
      return '¥';
  }
}
