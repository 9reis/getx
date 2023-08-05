import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/getX1/pages1/detalhes/detalhes_page.dart';
import 'package:getx/getX1/pages1/home_biding.dart';
import 'package:getx/getX1/pages1/home_controller.dart';
import 'package:get/instance_manager.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  // Instancia do controller para fazer a REQ
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();
    setUpHome();
    // Get do Instance Manager
    _controller = Get.find<HomeController>();
    _controller.getGithubUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Users'),
        centerTitle: true,
      ),
      // Atualiza a UI quando ocorre mudanças na variável observável
      body: Obx(() {
        return _controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : _controller.users.isEmpty
                ? Center(child: Text('Nenhum usuário foi encontrado'))
                : ListView.builder(
                    itemCount: _controller.users.length,
                    itemBuilder: (_, index) {
                      final user = _controller.users[index];

                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: 50,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage: NetworkImage(user.avatarUrl),
                            ),
                          ),
                        ),
                        title: Text(
                          'usuário',
                          style: TextStyle(color: Colors.black54),
                        ),
                        subtitle: Text(
                          user.login,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Get.to(DetalhesPage(username: user.login));
                        },
                      );
                    },
                  );
      }),
    );
  }
}
