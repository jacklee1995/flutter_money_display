# Money Display

一个用于在Flutter应用程序中显示中国货币格式的小部件，支持自定义设置。

## 作者信息

- 作者：李俊才
- 邮箱：291148484@163.com
- 协议：MIT
- 项目仓库：http://thispage.tech:9680/jclee1995/flutter_money_display.git

## 用法

一句话描述最简单的用法：

```dart
ChineseMoneyDisplayWidget(99.89)
```

要使用 `MoneyDisplay` 小部件，只需导入它并将其包括在您的Flutter应用程序中。下面是一个简单的示例：

```dart
import 'package:flutter/material.dart';
import 'package:money_display/money_display.dart';

void main() {
  runApp(const MoneyDisplayExample());
}

class MoneyDisplayExample extends StatelessWidget {
  const MoneyDisplayExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Money Display 示例'),
        ),
        body: const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChineseMoneyDisplayWidget(0.9),
              ChineseMoneyDisplayWidget(0.17),
              ChineseMoneyDisplayWidget(0.1796),
              ChineseMoneyDisplayWidget(6),
              ChineseMoneyDisplayWidget(6.1),
              ChineseMoneyDisplayWidget(9.16),
              ChineseMoneyDisplayWidget(9.1671),
              ChineseMoneyDisplayWidget(10),
              ChineseMoneyDisplayWidget(10.7),
              ChineseMoneyDisplayWidget(10.71),
              ChineseMoneyDisplayWidget(999),
              ChineseMoneyDisplayWidget(999.7),
              ChineseMoneyDisplayWidget(999.99),
              ChineseMoneyDisplayWidget(1000),
              ChineseMoneyDisplayWidget(1995.0),
              ChineseMoneyDisplayWidget(1995.07),
              ChineseMoneyDisplayWidget(6666.66),
              ChineseMoneyDisplayWidget(9999),
              ChineseMoneyDisplayWidget(99999),
              ChineseMoneyDisplayWidget(999999),
              ChineseMoneyDisplayWidget(996786),
              ChineseMoneyDisplayWidget(9999999), // maxNum 默认值为10000
              ChineseMoneyDisplayWidget(
                9999999,
                maxNum: 10000001,
              ),
              ChineseMoneyDisplayWidget(
                9999999.97,
                maxNum: 10000001,
                integerColor: Colors.blue,
                integerFontsize: 25,
                decimalFontsize: 21,
                currencySymbolColor: Colors.pink,
                tenThousandSymbol: 'w',
                tenThousandSymbolColor: Colors.limeAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

![Alt text](example_yqB2iNalbc.png)

## ChineseMoneyDisplayWidget 参数说明

本例中，我们导入了 `ChineseMoneyDisplayWidget` 并使用它以自定义样式和符号显示价格。

### price

- **类型**: `double`
- **默认值**: 无
- **说明**: 价格，要在小部件中显示的货币金额。

### integerFontsize

- **类型**: `double`
- **默认值**: `18`
- **说明**: 整数位的字体大小。

### decimalFontsize

- **类型**: `double`
- **默认值**: `15`
- **说明**: 小数位的字体大小。

### currencySymbolFontsize

- **类型**: `double`
- **默认值**: `15`
- **说明**: 货币符号的字体大小。

### tenThousandSymbolSize

- **类型**: `double`
- **默认值**: `15`
- **说明**: 万位分隔符（“万”）的字体大小。

### maxNum

- **类型**: `double`
- **默认值**: `1000000`
- **说明**: 允许的最大数字，超过此数字将显示 `overflowSymbol`。

### overflowSymbol

- **类型**: `String`
- **默认值**: `'-'`
- **说明**: 超过最大数字时显示的符号。

### tenThousandSymbol

- **类型**: `String`
- **默认值**: `'万'`
- **说明**: 用于分隔万位的文本。

### currencySymbol

- **类型**: `String`
- **默认值**: `'¥'`
- **说明**: 货币符号，默认为人民币符号 "¥"。

### tenThousandSymbolColor

- **类型**: `Color`
- **默认值**: 红色
- **说明**: 万位分隔符的颜色。

### integerColor

- **类型**: `Color`
- **默认值**: 红色
- **说明**: 整数位的文本颜色。

### decimalDigitColor

- **类型**: `Color`
- **默认值**: 红色
- **说明**: 小数位的文本颜色。

### currencySymbolColor

- **类型**: `Color`
- **默认值**: 红色
- **说明**: 货币符号的颜色。

### overflowSymbolColor

- **类型**: `Color`
- **默认值**: 红色
- **说明**: 超过最大数字时的符号颜色。

### integerFontWeight

- **类型**: `FontWeight`
- **默认值**: `FontWeight.normal`
- **说明**: 整数位的字体权重。

### decimalFontWeight

- **类型**: `FontWeight`
- **默认值**: `FontWeight.normal`
- **说明**: 小数位的字体权重。

### tenThousandSymbolWeight

- **类型**: `FontWeight`
- **默认值**: `FontWeight.normal`
- **说明**: 万位分隔符（“万”）的字体权重。

### currencyFontWeight

- **类型**: `FontWeight`
- **默认值**: `FontWeight.normal`
- **说明**: 货币符号的字体权重。

这些参数允许您自定义货币显示小部件的外观和行为，以适应您的应用程序需求。您可以通过调整这些参数来控制字体大小、颜色、符号等外观属性，以及定义何时显示超过最大数字时的溢出符号。