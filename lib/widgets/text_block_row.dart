import 'package:flutter/material.dart';
import '../features/text_data/domain/text_block_model.dart';

class TextBlockRow extends StatelessWidget {
  final TextBlockModel block;
  final VoidCallback? onEdit;
  final VoidCallback? onRemove;

  const TextBlockRow({
    required this.block,
    this.onEdit,
    this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(block.title),
        subtitle: Text(block.content, maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: const Icon(Icons.edit), onPressed: onEdit),
            IconButton(icon: const Icon(Icons.delete), onPressed: onRemove),
          ],
        ),
      ),
    );
  }
}
