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
  final TextEditingController _realController = TextEditingController();
  final TextEditingController _dolarController = TextEditingController();
  final TextEditingController _euroController = TextEditingController();

  Coin _coin = Coin();

  void _realOnChanged(String text) {
    if (text.isEmpty) {
      _clearAllFields();
      return;
    }

    double? real = double.tryParse(text);
    _dolarController.text =
        (real! / _coin.results!.currencies!.uSD!.buy!).toStringAsPrecision(4);
    _euroController.text =
        (real! / _coin.results!.currencies!.eUR!.buy!).toStringAsPrecision(4);
  }

  void _dolarOnChanged(String text) {
    if (text.isEmpty) {
      _clearAllFields();
      return;
    }

    double? dollar = double.tryParse(text);
    _realController.text =
        (dollar! * _coin.results!.currencies!.uSD!.buy!).toStringAsPrecision(4);
    _euroController.text = (dollar! *
            _coin.results!.currencies!.uSD!.buy! /
            _coin.results!.currencies!.eUR!.buy!)
        .toStringAsPrecision(4);
  }

  void _euroOnChanged(String text) {
    if (text.isEmpty) {
      _clearAllFields();
      return;
    }

    double? euro = double.tryParse(text);
    _realController.text =
        (euro! / _coin.results!.currencies!.eUR!.buy!).toStringAsPrecision(4);
    _dolarController.text = (euro! *
            _coin.results!.currencies!.eUR!.buy! /
            _coin.results!.currencies!.uSD!.buy!)
        .toStringAsPrecision(4);
  }

  void _clearAllFields() {
    _realController.clear();
    _dolarController.clear();
    _euroController.clear();
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
        actions: <Widget>[
          IconButton(
              onPressed: _clearAllFields, icon: const Icon(Icons.refresh))
        ],
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
                        'Real', 'R\$', _realController, _realOnChanged),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTextField(
                        'Dólar', 'US\$', _dolarController, _dolarOnChanged),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTextField(
                        'Euro', '€', _euroController, _euroOnChanged),
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
