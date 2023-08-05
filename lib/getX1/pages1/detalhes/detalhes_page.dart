import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx/getX1/data/repositories/github_repository.dart';
import 'package:getx/getX1/pages1/detalhes/detalhes_controller.dart';

class DetalhesPage extends StatefulWidget {
  final String username;
  const DetalhesPage({super.key, required this.username});

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  late final DetalhesController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DetalhesController(
      repository: GithubRepository(
        dio: Dio(),
      ),
    );
    _controller.getGithubUser(username: widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
        centerTitle: true,
      ),
      body: Obx(() {
        return _controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _controller.githubUser! == null // Verifica se o usuário é nulo
                ? Center(child: Text('Usuário não encontrado'))
                : _buildUserInfo();
      }),
    );
  }

  Widget _buildUserInfo() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              _controller.githubUser!.avatarUrl,
              fit: BoxFit.contain,
              height: 275,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 32),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.emoji_people_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Nome',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              _controller.githubUser!.name ?? 'Sem informções',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.short_text_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Login',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.githubUser!.login,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.grain_outlined,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Repositório público',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.githubUser!.publicRepos.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.people_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Seguidores',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              _controller.githubUser!.followes.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.flag_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Local',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.githubUser!.location ?? "Sem informações",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
