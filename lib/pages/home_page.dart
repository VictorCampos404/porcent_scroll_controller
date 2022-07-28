import 'package:flutter/material.dart';
import 'package:teste_scroll/widgets/users_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String status = "Inicio do Scroll";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Teste de Scroll")),
      body: UsersList(
        onScroll: (porcent) {
          if (porcent == 0 && status != "Inicio")
            setStatus("Inicio");
          else if (porcent > 0 && porcent < 100 && status != "Meio")
            setStatus("Meio");
          else if (porcent == 100 && status != "Fim") setStatus("Fim");
        },
      ),
      bottomNavigationBar: _bottomPage(status),
    );
  }

  void setStatus(value) {
    setState(() {
      status = "$value do Scroll";
    });
  }

  Widget _bottomPage(String text) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      height: 60,
      child: Text(
        text,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
