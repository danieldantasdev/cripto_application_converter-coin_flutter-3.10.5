import 'package:cripto/models/coin.model.dart';
import 'package:cripto/services/coin.service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CoinService _coinService = CoinService();
  final TextEditingController realController = TextEditingController();
  final TextEditingController dolarController = TextEditingController();
  final TextEditingController euroController = TextEditingController();

  Coin _coin = Coin();

  void _realOnChanged(String text) {
    double? real = double.tryParse(text);
    dolarController.text =
        (real! / _coin.results!.currencies!.uSD!.buy!).toStringAsPrecision(4);
    euroController.text =
        (real! / _coin.results!.currencies!.eUR!.buy!).toStringAsPrecision(4);
  }

  void _dolarOnChanged(String text) {
    double? dollar = double.tryParse(text);
    realController.text =
        (dollar! * _coin.results!.currencies!.uSD!.buy!).toStringAsPrecision(4);
    euroController.text = (dollar! *
            _coin.results!.currencies!.uSD!.buy! /
            _coin.results!.currencies!.eUR!.buy!)
        .toStringAsPrecision(4);
  }

  void _euroOnChanged(String text) {
    double? euro = double.tryParse(text);
    realController.text =
        (euro! / _coin.results!.currencies!.eUR!.buy!).toStringAsPrecision(4);
    dolarController.text = (euro! *
            _coin.results!.currencies!.eUR!.buy! /
            _coin.results!.currencies!.uSD!.buy!)
        .toStringAsPrecision(4);
  }

  Widget buildTextField(String label, String prefix,
      TextEditingController controller, Function function) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.amber,
          ),
          prefixText: prefix),
      style: const TextStyle(
        color: Colors.amber,
        fontSize: 25,
      ),
      onChanged: (value) {
        function(value);
      },
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Icon(
          Icons.currency_bitcoin,
          size: 50,
          color: Colors.amber,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<Coin>(
        future: _coinService.getAll(),
        builder: (context, snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.none:
              return const Center();
            case ConnectionState.active:
              return const Center();
            case ConnectionState.done:
              // dollar = snapShot.data!.results!.currencies!.uSD!.buy;
              // euro = snapShot.data!.results!.currencies!.eUR!.buy;
              _coin = snapShot.data!;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.monetization_on,
                      size: 150,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTextField(
                        'Real', 'R\$', realController, _realOnChanged),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTextField(
                        'Dólar', 'US\$', dolarController, _dolarOnChanged),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTextField('Euro', '€', euroController, _euroOnChanged),
                  ],
                ),
              );
            case ConnectionState.waiting:
              return const Center(
                child: Text(
                  'Carregando dados!',
                  textAlign: TextAlign.center,
                ),
              );
          }
        },
      ),
    );
  }
}
