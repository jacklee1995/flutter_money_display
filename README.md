
# Money Display

A Flutter widget for displaying Chinese currency format with flexible customization.

## Author

- Author: Juncai Li
- Email: 291148484@163.com
- License: MIT
- Repository: http://thispage.tech:9680/jclee1995/flutter_money_display.git

## Usage

Describe the simplest usage in one sentence:

```dart
ChineseMoneyDisplayWidget(99.89)
```

To use the `MoneyDisplay` widget, simply import it and include it in your Flutter app. Here's a simple example:

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

## ChineseMoneyDisplayWidget Parameter Description

In this example, we import the `ChineseMoneyDisplayWidget` and use it to customize the style and symbol for displaying prices.

### price

- **Type**: `double`
- **Default Value**: None
- **Description**: The price, the currency amount to be displayed in the widget.

### integerFontsize

- **Type**: `double`
- **Default Value**: `18`
- **Description**: Font size for the integer part.

### decimalFontsize

- **Type**: `double`
- **Default Value**: `15`
- **Description**: Font size for the decimal part.

### currencySymbolFontsize

- **Type**: `double`
- **Default Value**: `15`
- **Description**: Font size for the currency symbol.

### tenThousandSymbolSize

- **Type**: `double`
- **Default Value**: `15`
- **Description**: Font size for the ten-thousand separator ("万").

### maxNum

- **Type**: `double`
- **Default Value**: `1000000`
- **Description**: The maximum allowed number; if the number exceeds this value, the `overflowSymbol` will be displayed.

### overflowSymbol

- **Type**: `String`
- **Default Value**: `'-'`
- **Description**: The symbol to be displayed when the number exceeds the maximum value.

### tenThousandSymbol

- **Type**: `String`
- **Default Value**: `'万'`
- **Description**: The text used to separate ten-thousand units.

### currencySymbol

- **Type**: `String`
- **Default Value**: `'¥'`
- **Description**: The currency symbol, defaulting to the Chinese Renminbi symbol "¥."

### tenThousandSymbolColor

- **Type**: `Color`
- **Default Value**: Red
- **Description**: The color of the ten-thousand separator.

### integerColor

- **Type**: `Color`
- **Default Value**: Red
- **Description**: The text color for the integer part.

### decimalDigitColor

- **Type**: `Color`
- **Default Value**: Red
- **Description**: The text color for the decimal part.

### currencySymbolColor

- **Type**: `Color`
- **Default Value**: Red
- **Description**: The color of the currency symbol.

### overflowSymbolColor

- **Type**: `Color`
- **Default Value**: Red
- **Description**: The symbol color when the number exceeds the maximum value.

### integerFontWeight

- **Type**: `FontWeight`
- **Default Value**: `FontWeight.normal`
- **Description**: The font weight for the integer part.

### decimalFontWeight

- **Type**: `FontWeight`
- **Default Value**: `FontWeight.normal`
- **Description**: The font weight for the decimal part.

### tenThousandSymbolWeight

- **Type**: `FontWeight`
- **Default Value**: `FontWeight.normal`
- **Description**: The font weight for the ten-thousand separator ("万").

### currencyFontWeight

- **Type**: `FontWeight`
- **Default Value**: `FontWeight.normal`
- **Description**: The font weight for the currency symbol.

These parameters allow you to customize the appearance and behavior of the ChineseMoneyDisplayWidget to suit the needs of your application. You can control font size, color, symbols, and define the symbol to be displayed when the number exceeds the maximum value by adjusting these parameters.