import 'package:flutter/material.dart';
import 'package:idef0_app/widgets/text_block_row.dart';
import '../domain/text_block_model.dart';

class TextListScreen extends StatelessWidget {
  final List<TextBlockModel> blocks;
  final void Function(TextBlockModel) onEdit;
  final void Function(TextBlockModel) onDelete;
  final VoidCallback onAdd;

  TextListScreen({
    required this.blocks,
    required this.onEdit,
    required this.onDelete,
    required this.onAdd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Текстовые блоки'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: blocks.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.note_add, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Нет текстовых блоков',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Нажмите + чтобы добавить первый блок',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      )
          : ListView.builder(
        itemCount: blocks.length,
        itemBuilder: (context, index) {
          final block = blocks[index];
          return TextBlockRow(
            block: block,
            onEdit: () => onEdit(block),
            onRemove: () => onDelete(block),
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
