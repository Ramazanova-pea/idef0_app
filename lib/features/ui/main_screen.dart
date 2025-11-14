import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/app_state/app_state_data.dart';
import '../text_data/domain/text_block_model.dart';
import '../text_data/presentation/text_editor_screen.dart';
import '../text_data/presentation/text_list_screen.dart';

class MainScreen extends StatelessWidget  {
  const MainScreen({super.key});

  void _onAdd(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TextEditorScreen(
          initialBlock: null,
          onSave: (newBlock) {
            final appStateData = Provider.of<AppStateData>(context, listen: false);
            appStateData.addTextBlock(newBlock);
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  void _onEdit(BuildContext context, TextBlockModel block) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TextEditorScreen(
          initialBlock: block,
          onSave: (updatedBlock) {
            final appStateData = Provider.of<AppStateData>(context, listen: false);
            appStateData.updateTextBlock(updatedBlock);
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  void _onDelete(BuildContext context,TextBlockModel block) {
    final appStateData = Provider.of<AppStateData>(context, listen: false);
    appStateData.deleteTextBlock(block);
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateData>(
      builder: (context, appStateData, child) {
        return TextListScreen(
          blocks: appStateData.textBlocks,
          onAdd: () => _onAdd(context),
          onEdit: (block) => _onEdit(context, block),
          onDelete: (block) => _onDelete(context, block),
        );
      },
    );
  }
}
