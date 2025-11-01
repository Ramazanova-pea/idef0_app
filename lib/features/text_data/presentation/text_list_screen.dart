import 'package:flutter/material.dart';
import 'package:idef0_app/widgets/text_block_row.dart';
import '../domain/text_block_model.dart';


class TextListScreen extends StatelessWidget {
  final List<TextBlockModel> blocks;
  final void Function(TextBlockModel) onEdit;
  final void Function(TextBlockModel) onDelete;
  final VoidCallback onAdd;

  const TextListScreen({
    required this.blocks,
    required this.onEdit,
    required this.onDelete,
    required this.onAdd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Текстовые блоки')),
      body: ListView.builder(
        itemCount: blocks.length,
        itemBuilder: (context, index) {
          final block = blocks[index];
          return TextBlockRow(
            block: block,
            onEdit: onEdit != null ? () => onEdit!(block) : null,
            onRemove: onDelete != null ? () => onDelete!(block) : null);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAdd,
        child: const Icon(Icons.add),
      ),
    );
  }
}
