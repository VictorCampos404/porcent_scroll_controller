import 'package:flutter/material.dart';

class UsersList extends StatefulWidget {
  Function(double) onScroll;
  UsersList({Key? key, required this.onScroll}) : super(key: key);

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController()..addListener(event);
  }

  @override
  void dispose() {
    _controller.dispose();
  }

  void event() {
    int max = _controller.positions.last.maxScrollExtent.ceil();
    int actual = _controller.offset.ceil();

    double porcent = ((actual * 100) / max);

    widget.onScroll(porcent);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      child: Column(
        children: [
          for (int i = 0; i < 20; i++)
            ListTile(
              title: Text(
                "User ${i + 1}",
                style: const TextStyle(fontSize: 20),
              ),
              leading: const Icon(Icons.person),
              trailing: const Icon(Icons.more_vert),
            )
        ],
      ),
    );
  }
}
