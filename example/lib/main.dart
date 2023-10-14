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
                    price: 192837465.2523432, // Set the price to be displayed.
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
                    price: 12345, // Set the price to be displayed.
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
