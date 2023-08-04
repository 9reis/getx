// Classe que faz a REQ no repository
import 'package:get/get.dart';
import 'package:getx/getX1/data/models/github_user_model.dart';
import 'package:getx/getX1/data/repositories/github_repository.dart';

class HomeController extends GetxController {
  // Necessario o repository para fazer a REQ à API
  HomeController({required this.repository});

  final GithubRepository repository;

  // Torna al ista observavel
  // Poder ser exibida na view
  final List<GithubUserModel> _users = <GithubUserModel>[].obs;
  // Get para ter acesso a lista
  List<GithubUserModel> get users => _users;

  // Cria uma variável observavel na view
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  getGithubUsers() async {
    // Seta um valor na variável observavel
    // A view monitora a variável, dependendo do valor dela, mosta um progressIndicator
    _isLoading.value = true;

    // Função do repository
    final response = await repository.getGithubUsers();

    // Add na lista todo conteudo da response
    _users.addAll(response);

    _isLoading.value = false;
  }
}
