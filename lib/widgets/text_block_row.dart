import 'package:cached_network_image/cached_network_image.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl:
            'https://img.icons8.com/?size=100&id=42336&format=png&color=000000',
            height: 150,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.grey[300],
              child: Icon(Icons.image),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey[300],
              child: Icon(Icons.error),
            ),
          ),
          ListTile(
            title: Text(block.title),
            subtitle: Text(
              block.content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: const Icon(Icons.edit), onPressed: onEdit),
                IconButton(icon: const Icon(Icons.delete), onPressed: onRemove),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
