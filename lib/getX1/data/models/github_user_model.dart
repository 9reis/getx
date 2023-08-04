// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class GithubUserModel {
  final String login;
  final String avatarUrl;
  final String? location;
  final String? name;
  final int? followes;
  final int? publicRepos;

  GithubUserModel(
      // String login1, String avatar_url1, String? location1,
      //   String? name1, int? followes1, int? public_repos1,
      {Key? key,
      required this.login,
      required this.avatarUrl,
      this.location,
      this.name,
      this.followes,
      this.publicRepos});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'avatar_url': avatarUrl,
      'location': location,
      'name': name,
      'followes': followes,
      'publicepos': publicRepos,
    };
  }

  factory GithubUserModel.fromMap(Map<String, dynamic> map) {
    return GithubUserModel(
      login: map['login'],
      avatarUrl: map['avatar_url'],
      location: map['location'],
      name: map['name'],
      followes: map['followes'],
      publicRepos: map['public_repos'],
      // login: '',
      // avatarUrl: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubUserModel.fromJson(String source) =>
      GithubUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
