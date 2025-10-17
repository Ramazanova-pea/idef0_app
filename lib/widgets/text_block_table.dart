import 'package:flutter/material.dart';
import '../features/text_data/domain/text_block_model.dart';
import 'text_block_row.dart';

class TextBlockTable extends StatelessWidget {
  final List<TextBlockModel> blocks;
  final void Function(TextBlockModel)? onEdit;
  final void Function(TextBlockModel)? onRemove;

  const TextBlockTable({
    required this.blocks,
    this.onEdit,
    this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: blocks.length,
      itemBuilder: (context, index) {
        final block = blocks[index];
        return TextBlockRow(
          key: ValueKey(block.id),
          block: block,
          onEdit: onEdit != null ? () => onEdit!(block) : null,
          onRemove: onRemove != null ? () => onRemove!(block) : null,
        );
      },
    );
  }
}
