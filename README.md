
# Money Display

A Flutter widget for displaying Chinese currency format with flexible customization.

## Author

- **Author**: [Juncai Li](https://blog.csdn.net/qq_28550263?spm=1011.2415.3001.5343)
- **Email**: [291148484@163.com](291148484@163.com)
- **License**: [MIT](http://thispage.tech:9680/jclee1995/flutter_money_display/-/blob/master/LICENSE)
- Repository: [http://thispage.tech:9680/jclee1995/flutter_money_display.git](http://thispage.tech:9680/jclee1995/flutter_money_display.git)
- 中文文档：[http://thispage.tech:9680/jclee1995/flutter_money_display/-/blob/master/README_CN.md](http://thispage.tech:9680/jclee1995/flutter_money_display/-/blob/master/README_CN.md)

## Workflow Logic

This module provides a `ChineseMoneyDisplayWidget` component designed to display currency amounts in Chinese currency format, such as "¥123,456.78," and offers various customization options to meet different requirements.

The approximate logic for displaying currency in this module is as follows:

1. **Constructor Parameters**: The `ChineseMoneyDisplayWidget` constructor takes multiple parameters, including the currency amount (`price`) and various options for custom display, such as integer part font size, decimal part font size, maximum number, overflow symbol, and more.

2. **Formatting the Price**: The `_formatPrice` method is responsible for formatting the incoming `price` into rich text (`TextSpan`). First, it converts the price into a string and uses regular expressions to separate the integer and decimal parts.

3. **Handling Large Values**: If the price is greater than or equal to `maxNum`, it displays the `overflowSymbol`, typically a symbol representing infinity. If the price is less than `maxNum`, the processing continues.

4. **Handling Prices Greater Than Ten Thousand**: If the price is greater than ten thousand, the integer part is divided into an integer part and a decimal part (if any). If there is no decimal part, the "万" symbol is directly added. If there is a decimal part, both the integer and decimal parts are displayed together, with the integer part followed by the "万" symbol.

5. **Handling Prices Greater Than a Thousand**: If the price is greater than a thousand, the integer part is formatted, and a comma separator is added between thousands. The processing is similar to the above, depending on whether there is a decimal part, it displays the integer part, decimal part, and the "万" symbol.

6. **Handling Prices Less Than a Thousand**: For prices less than a thousand, the integer part does not have a comma separator. Instead, it displays the integer part, decimal part (if any), and the "万" symbol based on whether there is a decimal part.

7. **Handling Decimal Places**: If the price has a decimal part, it is displayed, and the style is set according to `smallFontsize` and `decimalDigitColor`.

8. **Text Integration**: All these text segments are integrated into a `TextSpan` for displaying together.

9. **Building Rich Text**: In the `build` method, a part of the rich text is the `currencySymbol`, which appears in front of the currency symbol. Then, the rich text part returned by `_formatPrice` is displayed in the `RichText` component. The entire component is responsible for displaying this rich text on the screen.

Through this logic, the `ChineseMoneyDisplayWidget` component can display the input price in Chinese currency format and customize the style based on the provided parameters. This allows developers to easily integrate it into Flutter applications to meet various currency display requirements.

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
  const MoneyDisplayExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:
              const Text('Money Display Example'), // Setting the app bar title.
        ),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Widget for displaying money with a euro symbol.
                  MoneyDisplayWidget(
                    192837465.2523432, // Set the price to be displayed.
                    currencySymbol:
                        CurrencySymbol.euro, // Set the currency symbol to euro.
                    showTrailingZeros:
                        false, // Determine whether to show trailing zeros.
                    currencySymbolSize:
                        26, // Set the size of the currency symbol.
                    currencySymbolColor: Color.fromARGB(255, 0, 43,
                        32), // Set the color of the currency symbol.
                    currencySymbolFontWeight: FontWeight
                        .w800, // Set the font weight of the currency symbol.
                    integerPartColor: Color.fromARGB(
                        255, 206, 192, 0), // Set the color of the integer part.
                    integerPartSize: 46, // Set the size of the integer part.
                    decimalPartColor:
                        Colors.purple, // Set the color of the decimal part.
                  ),
                  // Widget for displaying Chinese money with custom options.
                  ChineseMoneyDisplayWidget(
                    9999879999.92347,
                    maxNum: 10000000000, // Set a maximum number for display.
                    integerColor:
                        Colors.blue, // Set the color of the integer part.
                    integerFontsize:
                        25, // Set the font size of the integer part.
                    decimalFontsize:
                        21, // Set the font size of the decimal part.
                    currencySymbolColor:
                        Colors.pink, // Set the color of the currency symbol.
                    tenThousandSymbol: 'w', // Set the ten thousand symbol.
                    tenThousandSymbolColor: Color.fromARGB(255, 0, 156,
                        78), // Set the color of the ten thousand symbol.
                  ),
                  // Widget for displaying money with a custom currency symbol.
                  MoneyDisplayWidget(
                    12345, // Set the price to be displayed.
                    currencySymbol: CurrencySymbol
                        .custom, // Set the currency symbol to custom.
                    customCurrencySymbol:
                        '💲', // If using a custom currency symbol, set it here.
                    showTrailingZeros:
                        false, // Determine whether to show trailing zeros.
                  ),
                ],
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 4,
              children: const [
                Center(child: ChineseMoneyDisplayWidget(0.9)),
                Center(child: ChineseMoneyDisplayWidget(0.17)),
                Center(child: ChineseMoneyDisplayWidget(0.1796)),
                Center(child: ChineseMoneyDisplayWidget(6)),
                Center(child: ChineseMoneyDisplayWidget(6.1)),
                Center(
                  child: ChineseMoneyDisplayWidget(
                    9.16,
                    decimalFontsize: 29,
                    integerColor: Color.fromARGB(255, 0, 150, 187),
                  ),
                ),
                Center(child: ChineseMoneyDisplayWidget(9.1671)),
                Center(child: ChineseMoneyDisplayWidget(10)),
                Center(child: ChineseMoneyDisplayWidget(10.7)),
                Center(
                  child: ChineseMoneyDisplayWidget(
                    10.71,
                    integerFontsize: 25,
                  ),
                ),
                Center(child: ChineseMoneyDisplayWidget(999)),
                Center(child: ChineseMoneyDisplayWidget(999.7)),
                Center(
                  child: ChineseMoneyDisplayWidget(
                    999.99,
                    decimalDigitColor: Color.fromARGB(255, 80, 0, 133),
                  ),
                ),
                Center(child: ChineseMoneyDisplayWidget(1000)),
                Center(child: ChineseMoneyDisplayWidget(1995.0)),
                Center(child: ChineseMoneyDisplayWidget(1995.07)),
                Center(child: ChineseMoneyDisplayWidget(6666.66)),
                Center(child: ChineseMoneyDisplayWidget(9999)),
                Center(
                  child: ChineseMoneyDisplayWidget(
                    99999,
                    currencyFontWeight: FontWeight.w900,
                    currencySymbolColor: Color.fromARGB(255, 22, 0, 148),
                    currencySymbolFontsize: 56,
                  ),
                ),
                Center(child: ChineseMoneyDisplayWidget(999999)),
                Center(child: ChineseMoneyDisplayWidget(996786)),
                Center(
                  child: ChineseMoneyDisplayWidget(
                      9999999), // maxNum defaults to 10000.
                ),
                Center(
                  child: ChineseMoneyDisplayWidget(
                    9999999,
                    maxNum:
                        10000001, // Set a custom maximum number for display.
                  ),
                ),
                Center(
                  child: ChineseMoneyDisplayWidget(
                    9999999.97,
                    maxNum: 10000001,
                    integerColor: Colors.blue,
                    integerFontsize: 25,
                    decimalFontsize: 21,
                    currencySymbolColor: Colors.pink,
                    tenThousandSymbol: 'w',
                    tenThousandSymbolColor: Color.fromARGB(255, 0, 156, 78),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

```

![https://raw.githubusercontent.com/jacklee1995/flutter_money_display/master/example_OZYpI1Nuky.png](https://raw.githubusercontent.com/jacklee1995/flutter_money_display/master/example_OZYpI1Nuky.png)

## class ChineseMoneyDisplayWidget

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

## Class MoneyDisplayWidget

The `MoneyDisplayWidget` class is a component used for displaying formatted currency values in a customizable manner. It supports the following properties and methods:

### Properties

- `price` (double): The price to be displayed.
- `currencySymbol` (CurrencySymbol): The type of currency symbol, defaulting to [CurrencySymbol.yuan].
- `customCurrencySymbol` (String): If `currencySymbol` is set to `CurrencySymbol.custom`, this is the custom currency symbol used, defaulting to an empty string.
- `currencySymbolSize` (double): The size of the currency symbol, defaulting to 20.
- `currencySymbolColor` (Color): The color of the currency symbol, defaulting to red.
- `currencySymbolFontWeight` (FontWeight): The font weight of the currency symbol, defaulting to normal.
- `integerPartSize` (double): The size of the integer part, defaulting to 25.
- `integerPartColor` (Color): The color of the integer part, defaulting to red.
- `integerPartFontWeight` (FontWeight): The font weight of the integer part, defaulting to normal.
- `decimalPointSize` (double): The size of the decimal point, defaulting to 20.
- `decimalPointColor` (Color): The color of the decimal point, defaulting to red.
- `decimalPointFontWeight` (FontWeight): The font weight of the decimal point, defaulting to normal.
- `decimalPartSize` (double): The size of the decimal part, defaulting to 20.
- `decimalPartColor` (Color): The color of the decimal part, defaulting to red.
- `decimalPartFontWeight` (FontWeight): The font weight of the decimal part, defaulting to normal.
- `showTrailingZeros` (bool): Whether to display trailing zeros in the decimal part, defaulting to `false`.
- `customCurrencySymbol` (String): Allows for the use of a custom currency symbol, defaulting to an empty string.

### Methods

- `MoneyDisplayWidget({ ... })`: Constructor used for creating an instance of `MoneyDisplayWidget`.
- `build(BuildContext context)`: Build method, returns a `RichText` component used to display the formatted currency value.
- `formatPrice(double price, bool showTrailingZeros)`: Method for formatting prices, converting the price into a Map object containing the integer and decimal parts.

## Class CurrencySymbol

`CurrencySymbol` is an enumeration type used to define the type of currency symbol. It includes the following options:

- `CurrencySymbol.yuan`: Chinese Yuan symbol.
- `CurrencySymbol.dollar`: US Dollar symbol.
- `CurrencySymbol.euro`: Euro symbol.
- `CurrencySymbol.pound`: British Pound symbol.
- `CurrencySymbol.custom`: Custom currency symbol.
-
