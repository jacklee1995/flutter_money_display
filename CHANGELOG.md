# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0+2] - 2023-10-14

### Added

- Introducing the `MoneyDisplayWidget` class for displaying formatted currency values.
  - `price` (double): The price to be displayed.
  - `currencySymbol` (CurrencySymbol): The type of currency symbol.
  - `customCurrencySymbol` (String): Custom currency symbol if `currencySymbol` is set to `CurrencySymbol.custom`.

## [1.0.0+1] - 2023-10-14

### Added

- Introducing the `ChineseMoneyDisplayWidget` class for displaying Chinese-style formatted currency values.
  - `price` (double): The currency amount to be displayed.
  - `integerColor` (Color): The text color of the integer part.
  - `integerFontsize` (double): The font size of the integer part.
  - `decimalFontsize` (double): The font size of the decimal part.
  - `currencySymbolFontsize` (double): The font size of the currency symbol.
  - `tenThousandSymbolSize` (double): The size of the ten thousand symbol.
  - `decimalDigitColor` (Color): The text color of the decimal digits.
  - `maxNum` (double): The maximum allowed number; if exceeded, it displays the `overflowSymbol`.
  - `currencySymbol` (String): The currency symbol, typically "¥".
  - `overflowSymbol` (String): The symbol displayed when exceeding the maximum number (default: "-").
  - `tenThousandSymbol` (String): The text used to separate ten thousand units (default: "万").
  - `tenThousandSymbolColor` (Color): The color of the ten thousand unit symbol.
  - `currencySymbolColor` (Color): The color of the currency symbol.
  - `overflowSymbolColor` (Color): The color of the overflow symbol.
  - `integerFontWeight` (FontWeight): The font weight of the integer part.
  - `decimalFontWeight` (FontWeight): The font weight of the decimal part.
  - `tenThousandSymbolWeight` (FontWeight): The font weight of the ten thousand symbol.
  - `currencyFontWeight` (FontWeight): The font weight of the currency symbol.
