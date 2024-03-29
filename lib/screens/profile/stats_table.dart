import 'package:crpg/models/character.dart';
import 'package:crpg/shared/styled_text.dart';
import 'package:crpg/theme.dart';
import 'package:flutter/material.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            color: AppColors.secondaryColor,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(Icons.star, color: widget.character.points > 0 ? Colors.yellow : Colors.grey,),
                const SizedBox(width: 20,),
                const StyledText('Stat Points Available:'),
                const Expanded(child: SizedBox(width: 20,)),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: StyledHeadline(widget.character.points.toString()),
                )
              ],
            ),
          ),

          Table(
            children: widget.character.statsAsFmtList.map((stat) {
              return TableRow(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.5),
                ),
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: StyledHeadline(stat['title']!),
                    )
                  ),

                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: StyledHeadline(stat['value']!),
                    )
                  ),

                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(Icons.arrow_upward, color: AppColors.textColor,),
                      onPressed: () {
                        setState(() {
                          widget.character.increaseStat(stat['title']!);
                        });
                      },
                    ),
                  ),

                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(Icons.arrow_downward, color: AppColors.textColor,),
                      onPressed: () {
                        setState(() {
                          widget.character.decreaseStat(stat['title']!);
                        });
                      },
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}