import 'package:get/get.dart';
import 'package:getx/getX1/data/models/github_user_model.dart';
import 'package:getx/getX1/data/repositories/github_repository.dart';

class DetalhesController extends GetxController {
  final GithubRepository repository;
  DetalhesController({required this.repository});

  // Para pegar o result e atribuir à uma variável do tipo GithubUser
  GithubUserModel? _githubUser;
  GithubUserModel? get githubUser => _githubUser;

  // Para exibir o indicador de progresso
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  // Pega os dados do user
  getGithubUser({required String username}) async {
    //Progress indicator antes de começar a requisição
    isLoading.value = true;

    final result = await repository.getGithubUser(username: username);
    print(result);
    // Após retornar a resposta
    // A tela de detalhes precisa esperar a função ser executada e poder retornar
    // o detalhe do usuário
    // Pega o usuário
    _githubUser = result;

    //Progress indicator passa a ser false após terminar a requisição
    _isLoading.value = false;
  }
}
