import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

import '../../data/repositories/github_repository.dart';
import 'detalhes_controller.dart';

setUpDetalhes() {
  Get.put<DetalhesController>(
    DetalhesController(
      repository: GithubRepository(
        dio: Dio(),
      ),
    ),
  );
}
