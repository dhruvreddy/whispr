// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whispr/features/note/presentation/bloc/note_bloc.dart';
import 'package:whispr/features/note/presentation/pages/add_note_page.dart';
import 'package:whispr/injection.dart';

import '/core/theme/theme.dart';
import 'features/auth/presentation/pages/sign_in_page.dart';
import 'features/auth/presentation/pages/sign_up_page.dart';
import 'features/home/presentation/pages/home.dart';

void main(List<String> args) {
  service();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkThemeMode,
        home: AddNotePage(),
      ),
    );
  }
}
