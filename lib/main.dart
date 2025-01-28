import 'package:flutter/material.dart';
import 'package:iss_mir_egal/home/data/database_repository.dart';
import 'package:iss_mir_egal/home/data/mock_database.dart';
import 'package:iss_mir_egal/my_app.dart';

void main() {
  DatabaseRepository mockDatabase = MockDatabase();

  runApp(const MyApp());
}
