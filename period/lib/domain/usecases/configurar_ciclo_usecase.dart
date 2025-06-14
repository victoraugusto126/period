import '../entities/calendario_entity.dart';

class ConfigurarCicloUseCase {
  CalendarioEntity call({
    required int duracaoCiclo,
    required int duracaoMenstruacao,
    required DateTime? ultimaMenstruacao,
  }) {
    if (ultimaMenstruacao == null) {
      return CalendarioEntity(
        diasMenstruacao: [],
        diasFertilidade: [],
        diasOvulacao: [],
        proximaMenstruacao: null,
      );
    }

    final proximaMenstruacao = ultimaMenstruacao.add(Duration(days: duracaoCiclo));

    final menstruacao = List<DateTime>.generate(
      duracaoMenstruacao,
      (i) => ultimaMenstruacao.add(Duration(days: i)),
    )..add(proximaMenstruacao);

    final ovulacaoProvavel = proximaMenstruacao.subtract(Duration(days: 14));
    final ovulacao = [
      ovulacaoProvavel.subtract(const Duration(days: 1)),
      ovulacaoProvavel,
    ];

    final fertilidade = List<DateTime>.generate(
      7,
      (i) => ovulacaoProvavel.subtract(const Duration(days: 4)).add(Duration(days: i)),
    );

    return CalendarioEntity(
      diasMenstruacao: menstruacao,
      diasFertilidade: fertilidade,
      diasOvulacao: ovulacao,
      proximaMenstruacao: proximaMenstruacao,
    );
  }
}
