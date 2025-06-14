import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:period/data/datasources/chat_remote_datasource.dart';
import 'package:period/presentation/cubit/calendario_cubit.dart';
import 'package:period/data/repositories/chat_repository_impl.dart';
import 'package:period/domain/usecases/send_chat_message.dart';
import 'package:period/presentation/cubit/chat_cubit.dart';
import 'package:period/domain/usecases/configurar_ciclo_usecase.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:period/presentation/screens/tela_inicial/tela_inicial.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CalendarioCubit(
                      ConfigurarCicloUseCase(),

        )),
      BlocProvider(
  create: (_) {
    final datasource = ChatRemoteDatasource();
    final repository = ChatRepositoryImpl(datasource);
    final usecase = SendChatMessage(repository);
    return ChatCubit(usecase);
  },
),
      ],
      child: MaterialApp(
        title: 'Ciclo Menstrual',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          useMaterial3: true,
        ),
        home: TelaInicial(),
      ),
    );
  }
}

