// Chama a API
// Trata a resposta que irá retornar para o controle
// Add package - DIO
// Para fazer injeção de dependencia

import 'package:dio/dio.dart';

import '../models/github_user_model.dart';

class GithubRepository {
  final Dio dio;

  GithubRepository({required this.dio});

  // Chama a lista de user
  Future<List<GithubUserModel>> getGithubUsers() async {
    final result = await dio
        .get('https://api.github.com/users'); // Recebe a url para fazer a REQ
    final List<GithubUserModel> users = [];

    if (result.statusCode == 200) {
      // True, indica que conseguiu encontrar o que stava buscando na REQ
      // Retorna uma Lista de Maps Que será convertido em um obj dart
      // Necessario criar um model
      // Cada item será convertido para um GithubUserModel
      // Add na lista de users, cada item que pegou na req
      result.data
          .map((item) => users.add(GithubUserModel.fromMap(item)))
          .toList();
      // Retorna a lista
    }
    return users;
  }

  // Pega os dados do usuário ao clicar
  Future<GithubUserModel> getGithubUser({required String username}) async {
    final result = await dio.get('https://api.github.com/$username');

    late GithubUserModel githubUser;

    if (result.statusCode == 200) {
      // Onde está os dados do user
      githubUser = GithubUserModel.fromMap(result.data);
    }
    return githubUser;
  }
}
