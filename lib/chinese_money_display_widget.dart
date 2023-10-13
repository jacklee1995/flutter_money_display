/// ChineseMoneyDisplayWidget 是一个用于在Flutter应用程序中显示中国货币格式价格的小部件
///
/// 作者：李俊才
/// 邮箱：291148484@163.com
/// 协议：MIT
///
/// 有关MIT协议的详细信息，请参阅项目的许可证文档（通常在项目的根目录中的"LICENSE"文件）
///
import 'package:flutter/material.dart';

class ChineseMoneyDisplayWidget extends StatelessWidget {
  /// 价格，要显示的货币金额
  final double price;

  /// 整数位的文本颜色
  final Color integerColor;

  /// 整数位的字体大小
  final double integerFontsize;

  /// 小数位的字体大小
  final double decimalFontsize;

  /// 货币符号的字体大小
  final double currencySymbolFontsize;

  // 万字大小
  final double tenThousandSymbolSize;

  /// 小数位的文本颜色
  final Color decimalDigitColor;

  /// 允许的最大数字，超过此数字将显示[overflowSymbol]
  final double maxNum;

  /// 货币符号，通常为"¥"
  final String currencySymbol;

  /// 超过最大数字时显示的符号
  final String overflowSymbol;

  /// 用于分隔万位的文本
  final String tenThousandSymbol;

  /// 万位分隔符的颜色
  final Color tenThousandSymbolColor;

  /// 货币符号的颜色
  final Color currencySymbolColor;

  /// 超过最大数字时的符号颜色
  final Color overflowSymbolColor;

  final FontWeight integerFontWeight;
  final FontWeight decimalFontWeight;
  final FontWeight tenThousandSymbolWeight;
  final FontWeight currencyFontWeight;

  /// 创建一个新的[ChineseMoneyDisplayWidget]实例
  ///
  /// [price]是要显示的价格，[integerFontsize]和[decimalFontsize]分别表示整数位和小数位的字体大小
  ///
  /// [maxNum]是一个可选参数，表示允许的最大数字，超过此数字将显示[overflowSymbol]
  ///
  /// [overflowSymbol]是一个可选参数，用于表示超过最大数字时显示的符号，默认为"-"
  ///
  /// [tenThousandSymbol]是一个可选参数，用于分隔万位的文本，默认为"万"
  ///
  /// [currencySymbol]是一个可选参数，表示货币符号，默认为"¥"
  ///
  /// [tenThousandSymbolColor]、[currencySymbolColor]、[overflowSymbolColor]是可选参数，
  /// 分别表示万位分隔符、货币符号和溢出符号的颜色，默认为红色
  const ChineseMoneyDisplayWidget(
    this.price, {
    Key? key,
    this.integerFontsize = 18,
    this.decimalFontsize = 15,
    this.tenThousandSymbolSize = 15,
    this.currencySymbolFontsize = 15,
    this.maxNum = 1000000,
    this.overflowSymbol = '-',
    this.tenThousandSymbol = '万',
    this.currencySymbol = '¥',
    this.tenThousandSymbolColor = Colors.red,
    this.integerColor = Colors.red,
    this.decimalDigitColor = Colors.red,
    this.currencySymbolColor = Colors.red,
    this.overflowSymbolColor = Colors.red,
    this.integerFontWeight = FontWeight.normal,
    this.decimalFontWeight = FontWeight.normal,
    this.tenThousandSymbolWeight = FontWeight.normal,
    this.currencyFontWeight = FontWeight.normal,
  });

  // 末尾添加万字
  TextSpan _addWan(TextSpan t) {
    return TextSpan(
      children: [
        t,
        TextSpan(
          text: tenThousandSymbol,
          style: TextStyle(
            color: tenThousandSymbolColor,
            fontSize: tenThousandSymbolSize,
          ),
        )
      ],
    );
  }

  // 格式化价格为富文本
  TextSpan _formatPrice() {
    String numberString = price.toString();
    RegExp regex = RegExp(r'(\d+)(?:\.(\d+))?');
    Match? match = regex.firstMatch(numberString);

    if (match != null) {
      String integerPartStr = match.group(1) ?? ''; // 整数部分
      String decimalPartStr = match.group(2) ?? ''; // 小数部分

      if (decimalPartStr.length > 2) {
        decimalPartStr = decimalPartStr.substring(0, 2);
      }

      int integerPart = int.parse(integerPartStr);

      // 如果价格大于 maxNum，显示overflowSymbol
      if (integerPart >= maxNum) {
        return TextSpan(
          text: overflowSymbol,
          style: TextStyle(
            fontSize: integerFontsize,
            color: integerColor,
          ),
        );
      }
      // 否则，如果价格大于 1万 但小于 maxNum
      else if (integerPart >= 10000) {
        String tenThousandNumberString = (integerPart / 10000).toString();
        Match? matchtenThousand = regex.firstMatch(tenThousandNumberString);

        String tenThousandIntegerPartStr =
            matchtenThousand?.group(1) ?? ''; // 万级整数部分
        String tenThousandDecimalPartStr = matchtenThousand!
                .group(2)
                ?.substring(0, 2)
                .replaceAll(RegExp(r'0*$'), '') ??
            ''; // 万级小数部分
        // 小数位为空
        if (tenThousandDecimalPartStr == '') {
          return _addWan(_fText(tenThousandIntegerPartStr, integerFontsize,
              integerColor, integerFontWeight));
        }
        // 需要小数位
        else {
          return _addWan(
            TextSpan(
              children: [
                _fText(tenThousandIntegerPartStr, integerFontsize, integerColor,
                    integerFontWeight), // 整数位
                _fText('.$tenThousandDecimalPartStr', decimalFontsize,
                    decimalDigitColor, decimalFontWeight) // 小数位
              ],
            ),
          );
        }
      }
      // 如果价格 大于1000 （1千-1万之间）
      else if (integerPart >= 1000) {
        // 小数位为空
        if (decimalPartStr == '') {
          return _fText(_formatWithComma(integerPartStr), integerFontsize,
              integerColor, integerFontWeight); //整数位
        }
        // 需要小数位
        else {
          return TextSpan(
            children: [
              _fText(_formatWithComma(integerPartStr), integerFontsize,
                  integerColor, integerFontWeight), // 整数位
              _fText('.$decimalPartStr', decimalFontsize, decimalDigitColor,
                  decimalFontWeight) // 小数位
            ],
          );
        }
      }
      // 1000以下
      else {
        // 小数位为空
        if (decimalPartStr == '') {
          return _fText(
              integerPartStr, integerFontsize, integerColor, integerFontWeight);
        }
        // 需要小数位
        else {
          return TextSpan(
            children: [
              _fText(integerPartStr, integerFontsize, integerColor,
                  integerFontWeight), // 整数位
              _fText('.$decimalPartStr', decimalFontsize, decimalDigitColor,
                  decimalFontWeight) // 小数位
            ],
          );
        }
      }
    } else {
      throw Exception(
          'ChineseMoneyDisplayWidgetError: Mismatch error occurred when splitting the amount into integer and decimal.');
    }
  }

  // 格式化整数部分，添加千分位分隔符
  String _formatWithComma(String price) {
    final parts = price.split('.');
    final wholePart = parts[0];
    final decimalPart = parts.length > 1 ? '.${parts[1]}' : '';
    final regex = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return wholePart.replaceAllMapped(regex, (Match match) => ',') +
        decimalPart;
  }

  // 创建富文本
  TextSpan _fText(
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

  @override
  Widget build(BuildContext context) {
    // 构建富文本显示价格
    return RichText(
      text: TextSpan(
        children: [
          _fText(currencySymbol, currencySymbolFontsize, currencySymbolColor,
              currencyFontWeight), // 添加货币符号，字体大小为decimalFontsize
          _formatPrice(),
        ],
      ),
    );
  }
}
