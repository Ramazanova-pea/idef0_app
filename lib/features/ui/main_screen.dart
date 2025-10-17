import 'package:flutter/material.dart';
import '../text_data/domain/text_block_model.dart';
import '../text_data/presentation/text_editor_screen.dart';
import '../text_data/presentation/text_list_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<TextBlockModel> _blocks = [];

  void _onAdd() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TextEditorScreen(onSave: _onSave),
      ),
    );
  }

  void _onEdit(TextBlockModel block) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TextEditorScreen(
          initialBlock: block,
          onSave: _onSave,
        ),
      ),
    );
  }

  void _onDelete(TextBlockModel block) {
    setState(() {
      _blocks.removeWhere((b) => b.id == block.id);
    });
  }

  void _onSave(TextBlockModel block) {
    setState(() {
      final index = _blocks.indexWhere((b) => b.id == block.id);
      if (index >= 0) {
        _blocks[index] = block.copyWith(
          title: block.title,
          content: block.content,
        );
      } else {
        _blocks.add(block);
      }
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextListScreen(
      blocks: _blocks,
      onAdd: _onAdd,
      onEdit: _onEdit,
      onDelete: _onDelete,
    );
  }
}
