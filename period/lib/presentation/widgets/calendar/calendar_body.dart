import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:period/presentation/cubit/calendario_state.dart';
import 'package:period/presentation/cubit/calendario_cubit.dart';

import 'day_cell.dart';
import 'legenda_widget.dart';
import 'periodo_fertil_text.dart';

class CalendarBody extends StatelessWidget {
  const CalendarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarioCubit, CalendarioState>(
      builder: (context, state) {
        final cubit = context.read<CalendarioCubit>();

        return SingleChildScrollView(
          child: Column(
            children: [
              if (state.ultimaMenstruacao == null)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Center(
                    child: Text(
                      'Escolha no calendário o \n primeiro dia da sua menstruação',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              const SizedBox(height: 20),

              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),

                child: TableCalendar(
                  locale: 'pt_BR',
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: state.focusedDay,
                  calendarFormat: CalendarFormat.month,
                  availableCalendarFormats: const {CalendarFormat.month: 'Mês'},
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  selectedDayPredicate: (day) => false,
                  onDaySelected: (selected, focused) {
                    cubit.selecionarUltimaMenstruacao(selected, focused);
                  },
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder:
                        (context, day, _) => DayCell(day: day, state: state),
                    todayBuilder:
                        (context, day, _) => DayCell(day: day, state: state),
                    outsideBuilder:
                        (context, day, _) =>
                            DayCell(day: day, state: state, outside: true),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const LegendaWidget(),
              const SizedBox(height: 20),

              if (state.ultimaMenstruacao != null) ...[
                PeriodoFertilText(state: state),
                const SizedBox(height: 20),
                Text(
                  'Última menstruação: ${DateFormat('dd/MM/yyyy').format(state.ultimaMenstruacao!)}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
