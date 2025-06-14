class CalendarioEntity {
  final List<DateTime> diasMenstruacao;
  final List<DateTime> diasFertilidade;
  final List<DateTime> diasOvulacao;
  final DateTime? proximaMenstruacao;

  CalendarioEntity({
    required this.diasMenstruacao,
    required this.diasFertilidade,
    required this.diasOvulacao,
    required this.proximaMenstruacao,
  });
}
