import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:period/domain/usecases/configurar_ciclo_usecase.dart';
import 'calendario_state.dart';

class CalendarioCubit extends Cubit<CalendarioState> {
  final ConfigurarCicloUseCase configurarCicloUseCase;

  CalendarioCubit(this.configurarCicloUseCase)
      : super(CalendarioState(
          ultimaMenstruacao: null,
          duracaoCiclo: 28,
          duracaoMenstruacao: 5,
          diasMenstruacao: [],
          diasFertilidade: [],
          diasOvulacao: [],
          focusedDay: DateTime.now(),
        ));

  void configurarCiclo(int novoCiclo, int novaDuracaoMenstruacao) {
    final novaEntity = configurarCicloUseCase(
      duracaoCiclo: novoCiclo,
      duracaoMenstruacao: novaDuracaoMenstruacao,
      ultimaMenstruacao: state.ultimaMenstruacao,
    );

  emit(state.copyWith(
  duracaoCiclo: novoCiclo,
  duracaoMenstruacao: novaDuracaoMenstruacao,
  diasMenstruacao: novaEntity.diasMenstruacao,
  diasFertilidade: novaEntity.diasFertilidade,
  diasOvulacao: novaEntity.diasOvulacao,
  proximaMenstruacao: novaEntity.proximaMenstruacao,
));
  }

  void selecionarUltimaMenstruacao(DateTime selecionada, DateTime focusedDay) {
    emit(state.copyWith(
      ultimaMenstruacao: selecionada,
      focusedDay: focusedDay,
    ));

    configurarCiclo(state.duracaoCiclo, state.duracaoMenstruacao);
  }
}
