/// ChineseMoneyDisplayWidget 是一个用于在Flutter应用程序中显示中国货币格式价格的组件
///
/// 作者：李俊才
/// 邮箱：291148484@163.com
/// 协议：MIT
///
/// 有关MIT协议的详细信息，请参阅项目的许可证文档（通常在项目的根目录中的"LICENSE"文件）
///
import 'package:flutter/material.dart';
import 'enums.dart';
import 'utils.dart';

/// 用于显示带有可自定义选项的格式化货币值的组件
class MoneyDisplayWidget extends StatelessWidget {
  /// 要显示的价格
  final double price;

  /// 货币符号的类型
  final CurrencySymbol currencySymbol;

  /// 如果[currencySymbol]设置为[CurrencySymbol.custom]，则使用自定义货币符号
  final String customCurrencySymbol;

  /// 货币符号的大小
  final double currencySymbolSize;

  /// 货币符号的颜色
  final Color currencySymbolColor;

  /// 货币符号的字体粗细
  final FontWeight currencySymbolFontWeight;

  /// 整数部分的大小
  final double integerPartSize;

  /// 整数部分的颜色
  final Color integerPartColor;

  /// 整数部分的字体粗细
  final FontWeight integerPartFontWeight;

  /// 小数点的大小
  final double decimalPointSize;

  /// 小数点的颜色
  final Color decimalPointColor;

  /// 小数点的字体粗细
  final FontWeight decimalPointFontWeight;

  /// 小数部分的大小
  final double decimalPartSize;

  /// 小数部分的颜色
  final Color decimalPartColor;

  /// 小数部分的字体粗细
  final FontWeight decimalPartFontWeight;

  /// 确定是否在小数部分显示尾随零
  final bool showTrailingZeros;

  /// 自定义构造函数用于 MoneyDisplayWidget
  ///
  /// [key] 是此组件的唯一键
  ///
  /// [price] 是要显示的价格值
  ///
  /// [currencySymbol] 定义货币符号的类型（默认为[CurrencySymbol.yuan]）
  ///
  /// [currencySymbolSize] 设置货币符号的大小（默认为20）
  ///
  /// [currencySymbolColor] 定义货币符号的颜色（默认为红色）
  ///
  /// [currencySymbolFontWeight] 设置货币符号的字体粗细（默认为FontWeight.normal）
  ///
  /// [integerPartSize] 确定整数部分的大小（默认为25）
  ///
  /// [integerPartColor] 定义整数部分的颜色（默认为红色）
  ///
  /// [integerPartFontWeight] 设置整数部分的字体粗细（默认为FontWeight.normal）
  ///
  /// [decimalPointSize] 设置小数点的大小（默认为20）
  ///
  /// [decimalPointColor] 定义小数点的颜色（默认为红色）
  ///
  /// [decimalPointFontWeight] 确定小数点的字体粗细（默认为FontWeight.normal）
  ///
  /// [decimalPartSize] 确定小数部分的大小（默认为20）
  ///
  /// [decimalPartColor] 设置小数部分的颜色（默认为红色）
  ///
  /// [decimalPartFontWeight] 设置小数部分的字体粗细（默认为FontWeight.normal）
  ///
  /// [showTrailingZeros] 指定是否在小数部分显示尾随零（默认为false）
  ///
  /// [customCurrencySymbol] 允许使用自定义货币符号（默认为空字符串）
  const MoneyDisplayWidget({
    super.key,
    required this.price,
    this.currencySymbol = CurrencySymbol.yuan,
    this.currencySymbolSize = 20,
    this.currencySymbolColor = Colors.red,
    this.currencySymbolFontWeight = FontWeight.normal,
    this.integerPartSize = 25,
    this.integerPartColor = Colors.red,
    this.integerPartFontWeight = FontWeight.normal,
    this.decimalPointSize = 20,
    this.decimalPointColor = Colors.red,
    this.decimalPointFontWeight = FontWeight.normal,
    this.decimalPartSize = 20,
    this.decimalPartColor = Colors.red,
    this.decimalPartFontWeight = FontWeight.normal,
    this.showTrailingZeros = false,
    this.customCurrencySymbol = '',
  });

  @override
  Widget build(BuildContext context) {
    // 格式化价格并提取整数和小数部分
    final formattedPrice = formatPrice(price, showTrailingZeros);
    final integerPart = formattedPrice['integerPart'];
    final decimalPart = formattedPrice['decimalPart'];

    // 创建要显示格式化价格的内联跨度列表
    List<InlineSpan> children = [
      TextSpan(
        text: getCurrencySymbol(currencySymbol, customCurrencySymbol),
        style: TextStyle(
          fontSize: currencySymbolSize,
          color: currencySymbolColor,
          fontWeight: currencySymbolFontWeight,
        ),
      ),
      TextSpan(
        text: formatWithComma(integerPart!),
        style: TextStyle(
          fontSize: integerPartSize,
          color: integerPartColor,
          fontWeight: integerPartFontWeight,
        ),
      ),
    ];

    // 如果适用，添加小数点和小数部分
    if (decimalPart!.isNotEmpty && decimalPart.length >= 2) {
      children.add(
        TextSpan(
          text: '.',
          style: TextStyle(
            fontSize: decimalPointSize,
            color: decimalPointColor,
            fontWeight: decimalPointFontWeight,
          ),
        ),
      );
      children.add(
        TextSpan(
          text: decimalPart.substring(0, 2),
          style: TextStyle(
            fontSize: decimalPartSize,
            color: decimalPartColor,
            fontWeight: decimalPartFontWeight,
          ),
        ),
      );
    }

    return RichText(
      text: TextSpan(
        children: children,
      ),
    );
  }

  /// 通过删除小数部分中的尾随零来格式化价格
  Map<String, String> formatPrice(double price, bool showTrailingZeros) {
    // 将价格转换为字符串
    final numberString = price.toString();
    // 定义用于匹配整数和小数部分的正则表达式
    final regex = RegExp(r'(\d+)(?:\.(\d+))?');
    // 尝试匹配正则表达式与数字字符串
    final match = regex.firstMatch(numberString);

    if (match != null) {
      final integerPartStr = match.group(1) ?? '';
      var decimalPartStr = match.group(2) ?? '';

      // 如果需要，从小数部分中删除尾随零
      if (!showTrailingZeros) {
        decimalPartStr = decimalPartStr.replaceAll(RegExp(r'0*$'), '');
      } else if (decimalPartStr.length == 1) {
        decimalPartStr += '0'; // 补充到有两位小数
      }

      // 返回格式化后的整数和小数部分
      return {'integerPart': integerPartStr, 'decimalPart': decimalPartStr};
    }

    // 如果没有找到匹配项，则返回空字符串
    return {'integerPart': '', 'decimalPart': ''};
  }
}
