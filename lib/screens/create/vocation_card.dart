import 'package:crpg/models/vocation.dart';
import 'package:crpg/shared/styled_text.dart';
import 'package:crpg/theme.dart';
import 'package:flutter/material.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({required this.vocation, required this.onTap, required this.selected, super.key});

  final Vocation vocation;
  final void Function(Vocation) onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(vocation);
      },
      child: Card(
        color: selected ? AppColors.secondaryColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset('assets/imgs/vocations/${vocation.image}', width: 80, colorBlendMode: BlendMode.color, color: !selected ? Colors.black.withOpacity(0.8): Colors.transparent,),
              const SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeadline(vocation.title),
                    StyledText(vocation.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}