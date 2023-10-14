# Money Display

一个用于在Flutter应用程序中显示中国货币格式的组件，支持自定义设置。

## 作者信息

- 作者：李俊才
- 邮箱：[291148484@163.com](291148484@163.com)
- 协议：[MIT](http://thispage.tech:9680/jclee1995/flutter_money_display/-/blob/master/LICENSE)
- 项目仓库：[http://thispage.tech:9680/jclee1995/flutter_money_display.git](http://thispage.tech:9680/jclee1995/flutter_money_display.git)
- English Document: [https://github.com/jacklee1995/flutter_money_display/blob/master/README.md](https://github.com/jacklee1995/flutter_money_display/blob/master/README.md)

## 工作逻辑

本模块提供了一个 `ChineseMoneyDisplayWidget` 组件旨在将货币金额显示为中国货币格式，例如 "¥123,456.78"，并提供了一些自定义选项来满足不同的需求。

以下是本模块显示货币的大概逻辑：

1. **构造函数参数**：`ChineseMoneyDisplayWidget` 构造函数接受多个参数，包括货币金额（`price`）以及用于自定义显示的各种选项，如整数位字体大小、小数位字体大小、最大数字、溢出符号等。

2. **格式化价格**：`_formatPrice` 方法负责将传入的 `price` 格式化为富文本（`TextSpan`）。首先，它将价格转换为字符串并使用正则表达式分离整数部分和小数部分。

3. **处理大数值**：如果价格大于等于 `maxNum`，则显示 `overflowSymbol`，通常是表示无限大的符号。如果价格小于 `maxNum`，则继续处理。

4. **处理大于一万的价格**：如果价格大于一万，整数部分会被分隔成整数部分和小数部分（如果有的话）。如果没有小数部分，直接添加 "万" 符号。如果有小数部分，将整数部分和小数部分一同显示，整数部分后跟 "万" 符号。

5. **处理大于一千的价格**：如果价格大于一千，整数部分会被格式化，千位之间会添加逗号分隔符。处理方式与上述类似，根据是否有小数部分，显示整数部分、小数部分和 "万" 符号。

6. **处理小于一千的价格**：对于小于一千的价格，整数部分不添加逗号分隔符，而是根据是否有小数部分来显示整数部分、小数部分和 "万" 符号。

7. **处理小数位**：如果价格有小数部分，它将被显示，小数部分会根据 `smallFontsize` 和 `decimalDigitColor` 进行样式设置。

8. **整合文本**：所有这些文本片段都会被整合到一个 `TextSpan` 中，以便一起显示。

9. **构建富文本**：在 `build` 方法中，富文本的一部分是 `currencySymbol`，它位于货币符号的前面。然后，`_formatPrice` 返回的富文本部分在 `RichText` 组件中显示。整个组件就是在屏幕上显示这个富文本。

通过这种逻辑，`ChineseMoneyDisplayWidget` 组件能够将输入的价格以中国货币格式显示出来，并根据所提供的参数进行自定义样式。这使得开发人员能够轻松地将其集成到Flutter应用中以满足不同的货币显示需求。

## 用法

一句话描述最简单的用法：

```dart
ChineseMoneyDisplayWidget(99.89)
```

要使用 `MoneyDisplay` 组件，只需导入它并将其包括在您的Flutter应用程序中。下面是一个简单的示例：

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



![https://raw.githubusercontent.com/jacklee1995/flutter_money_display/master/example_yqB2iNalbc.png](https://raw.githubusercontent.com/jacklee1995/flutter_money_display/master/example_yqB2iNalbc.png)

## ChineseMoneyDisplayWidget 参数说明

本例中，我们导入了 `ChineseMoneyDisplayWidget` 并使用它以自定义样式和符号显示价格。

### price

- **类型**: `double`
- **默认值**: 无
- **说明**: 价格，要在组件中显示的货币金额。

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

这些参数允许您自定义货币显示组件的外观和行为，以适应您的应用程序需求。您可以通过调整这些参数来控制字体大小、颜色、符号等外观属性，以及定义何时显示超过最大数字时的溢出符号。




## 类 `MoneyDisplayWidget`说明

`MoneyDisplayWidget` 类是一个用于显示格式化货币值的组件.normal，具有可自定义的选项。它支持以下属性和方法：

### 属性

- `price` (double): 要显示的价格。
- `currencySymbol` (CurrencySymbol): 货币符号的类型，默认为 [CurrencySymbol.yuan]。
- `customCurrencySymbol` (String): 如果 `currencySymbol` 设置为 `CurrencySymbol.custom`，则使用的自定义货币符号，默认为空字符串。
- `currencySymbolSize` (double): 货币符号的大小，默认为 20。
- `currencySymbolColor` (Color): 货币符号的颜色，默认为红色。
- `currencySymbolFontWeight` (FontWeight): 货币符号的字体粗细，默认为正常。
- `integerPartSize` (double): 整数部分的大小，默认为 25。
- `integerPartColor` (Color): 整数部分的颜色，默认为红色。
- `integerPartFontWeight` (FontWeight): 整数部分的字体粗细，默认为正常。
- `decimalPointSize` (double): 小数点的大小，默认为 20。
- `decimalPointColor` (Color): 小数点的颜色，默认为红色。
- `decimalPointFontWeight` (FontWeight): 小数点的字体粗细，默认为正常。
- `decimalPartSize` (double): 小数部分的大小，默认为 20。
- `decimalPartColor` (Color): 小数部分的颜色，默认为红色。
- `decimalPartFontWeight` (FontWeight): 小数部分的字体粗细，默认为正常。
- `showTrailingZeros` (bool): 是否在小数部分显示尾随零，默认为 `false`。
- `customCurrencySymbol` (String): 允许使用自定义货币符号，默认为空字符串。

### 方法

- `MoneyDisplayWidget({ ... })`: 构造函数，用于创建 `MoneyDisplayWidget` 实例。
- `build(BuildContext context)`: 构建方法，返回一个 `RichText` 组件.normal，用于显示格式化的货币值。
- `formatPrice(double price, bool showTrailingZeros)`: 格式化价格的方法，将价格转换为包含整数部分和小数部分的 Map 对象。

## 类 `CurrencySymbol`

`CurrencySymbol` 是一个枚举类型，用于定义货币符号的类型。它包括以下选项：

- `CurrencySymbol.yuan`: 人民币符号。
- `CurrencySymbol.dollar`: 美元符号。
- `CurrencySymbol.euro`: 欧元符号。
- `CurrencySymbol.pound`: 英镑符号。
- `CurrencySymbol.custom`: 自定义货币符号。

这是一个简单的 API 文档示例，您可以根据需要添加更多详细信息、示例和注意事项。

---

![Alt text](./example_yqB2iNalbc.png)

![Alt text](./example_OZYpI1Nuky.png)
