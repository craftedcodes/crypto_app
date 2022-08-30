import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/crypto_bloc.dart';
import 'pages/home_page.dart';
import 'package:flutter/material.dart';

import 'services/data_repo.dart';

void main() => runApp(
      const MyApp(), // Wrap your app
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CryptoRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.purple.shade200,
          colorScheme:
              const ColorScheme.dark().copyWith(secondary: Colors.white),
        ),
        home: BlocProvider(
          create: (context) => CryptoBloc(
            cryptoRepository: context.read<CryptoRepository>(),
          )..add(Start()),
          child: const HomePage(),
        ),
      ),
    );
  }
}
