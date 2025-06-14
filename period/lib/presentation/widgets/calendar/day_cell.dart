import 'package:flutter/material.dart';
import 'package:period/presentation/cubit/calendario_state.dart';

class DayCell extends StatelessWidget {
  final DateTime day;
  final CalendarioState state;
  final bool outside;

  const DayCell({
    super.key,
    required this.day,
    required this.state,
    this.outside = false,
  });

  bool _isSameDay(DateTime day1, DateTime day2) {
    return day1.year == day2.year &&
        day1.month == day2.month &&
        day1.day == day2.day;
  }

  @override
Widget build(BuildContext context) {
  Widget? content;

  if (state.proximaMenstruacao != null && _isSameDay(day, state.proximaMenstruacao!)) {
  content = _buildColoredDot(day.day, Colors.red[200]!);
} else if (state.diasMenstruacao.any((d) => _isSameDay(d, day))) {
  content = _buildIcon(day.day, Icons.water_drop, Colors.red);
}else if (state.diasOvulacao.any((d) => _isSameDay(d, day))) {
    content = _buildIcon(day.day, Icons.favorite, Colors.yellow[700]!);
  } else if (state.diasFertilidade.any((d) => _isSameDay(d, day))) {
    content = _buildIcon(day.day, Icons.water_drop, Colors.green);
  }

  return Container(
    child: content ??
        Center(
          child: Text(
            '${day.day}',
            style: TextStyle(
              fontSize: 12,
              color: outside ? Colors.grey[400] : Colors.black,
            ),
          ),
        ),
  );
}
  Widget _buildIcon(int day, IconData icon, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$day', style: const TextStyle(fontSize: 12)),
        Icon(icon, size: 14, color: color),
      ],
    );
  }
}
Widget _buildColoredDot(int day, Color backgroundColor) {
  return Center(
    child: Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Text(
        '$day',
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
    ),
  );
}