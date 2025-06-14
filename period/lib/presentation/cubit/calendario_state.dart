class CalendarioState {
  final DateTime? ultimaMenstruacao;
  final int duracaoCiclo;
  final int duracaoMenstruacao;
  final List<DateTime> diasMenstruacao;
  final List<DateTime> diasFertilidade;
  final List<DateTime> diasOvulacao;
  final DateTime focusedDay;
  final DateTime? proximaMenstruacao; 

  CalendarioState({
    this.ultimaMenstruacao,
    required this.duracaoCiclo,
    required this.duracaoMenstruacao,
    required this.diasMenstruacao,
    required this.diasFertilidade,
    required this.diasOvulacao,
    required this.focusedDay,
    this.proximaMenstruacao,
  });

  CalendarioState copyWith({
    DateTime? ultimaMenstruacao,
    int? duracaoCiclo,
    int? duracaoMenstruacao,
    List<DateTime>? diasMenstruacao,
    List<DateTime>? diasFertilidade,
    List<DateTime>? diasOvulacao,
    DateTime? focusedDay,
    DateTime? proximaMenstruacao, 
  }) {
    return CalendarioState(
      ultimaMenstruacao: ultimaMenstruacao ?? this.ultimaMenstruacao,
      duracaoCiclo: duracaoCiclo ?? this.duracaoCiclo,
      duracaoMenstruacao: duracaoMenstruacao ?? this.duracaoMenstruacao,
      diasMenstruacao: diasMenstruacao ?? this.diasMenstruacao,
      diasFertilidade: diasFertilidade ?? this.diasFertilidade,
      diasOvulacao: diasOvulacao ?? this.diasOvulacao,
      focusedDay: focusedDay ?? this.focusedDay,
      proximaMenstruacao: proximaMenstruacao ?? this.proximaMenstruacao, 
    );
  }
}