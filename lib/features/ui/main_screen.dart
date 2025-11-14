import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/app_state_provider.dart';
import '../text_data/domain/text_block_model.dart';
import '../text_data/presentation/text_editor_screen.dart';
import '../text_data/presentation/text_list_screen.dart';

class MainScreen extends ConsumerWidget   {
  const MainScreen({super.key});

  void _onAdd(BuildContext context, WidgetRef ref) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TextEditorScreen(
          initialBlock: null,
          onSave: (newBlock) {
            ref.read(appStateProvider.notifier).addTextBlock(newBlock);
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  void _onEdit(BuildContext context, WidgetRef ref, TextBlockModel block) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TextEditorScreen(
          initialBlock: block,
          onSave: (updatedBlock) {
            ref.read(appStateProvider.notifier).updateTextBlock(updatedBlock);
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  void _onDelete(WidgetRef ref,TextBlockModel block) {
    ref.read(appStateProvider.notifier).deleteTextBlock(block);
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);

    return TextListScreen(
          blocks: appState.textBlocks,
          onAdd: () => _onAdd(context, ref),
          onEdit: (block) => _onEdit(context, ref, block),
          onDelete: (block) => _onDelete(ref, block),
    );
  }
}
