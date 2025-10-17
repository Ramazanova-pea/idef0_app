import 'package:flutter/material.dart';
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
          return Card(
            child: ListTile(
              title: Text(block.title),
              subtitle: Text(block.content, maxLines: 2, overflow: TextOverflow.ellipsis),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: const Icon(Icons.edit), onPressed: () => onEdit(block)),
                  IconButton(icon: const Icon(Icons.delete), onPressed: () => onDelete(block)),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAdd,
        child: const Icon(Icons.add),
      ),
    );
  }
}
