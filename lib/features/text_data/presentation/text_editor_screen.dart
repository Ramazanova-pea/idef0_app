import 'package:flutter/material.dart';
import '../domain/text_block_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TextEditorScreen extends StatefulWidget {
  final TextBlockModel? initialBlock;
  final void Function(TextBlockModel) onSave;

  const TextEditorScreen({this.initialBlock, required this.onSave, super.key});

  @override
  State<TextEditorScreen> createState() => _TextEditorScreenState();
}

class _TextEditorScreenState extends State<TextEditorScreen> {
  final _formKey = GlobalKey<FormState>();
  late final _titleController = TextEditingController(text: widget.initialBlock?.title ?? '');
  late final _contentController = TextEditingController(text: widget.initialBlock?.content ?? '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.initialBlock == null ? 'Добавить блок' : 'Редактировать текст'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final newBlock = TextBlockModel(
                  id: widget.initialBlock?.id ?? DateTime.now().toString(),
                  userId: widget.initialBlock?.userId ?? "default_user",
                  title: _titleController.text,
                  content: _contentController.text,
                  updatedAt: DateTime.now(),
                );
                widget.onSave(newBlock);
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl:
                'https://img.icons8.com/?size=100&id=64062&format=png&color=000000',
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
              const SizedBox(height: 10),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Название блока'),
                validator: (value) => value == null || value.isEmpty ? 'Введите название' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Содержимое блока'),
                maxLines: 6,
                validator: (value) => value == null || value.isEmpty ? 'Введите текст' : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
