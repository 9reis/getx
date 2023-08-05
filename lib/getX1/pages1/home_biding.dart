// Faz a ligação das dependencias nos arquivos

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:getx/getX1/data/repositories/github_repository.dart';
import 'package:getx/getX1/pages1/home_controller.dart';

setUpHome() {
  // Importar do instance manager
  Get.put(
    HomeController(
      repository: GithubRepository(
        dio: Dio(),
      ),
    ),
  );
}
