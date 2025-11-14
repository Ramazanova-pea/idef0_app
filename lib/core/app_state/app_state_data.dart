import 'package:flutter/material.dart';
import '../../features/text_data/domain/text_block_model.dart';

class AppStateData extends ChangeNotifier {
  List<TextBlockModel> _textBlocks = [];
  String? _currentUserId;
  bool _isLoggedIn = false;

  List<TextBlockModel> get textBlocks => _textBlocks;
  String? get currentUserId => _currentUserId;
  bool get isLoggedIn => _isLoggedIn;

  void addTextBlock(TextBlockModel block) {
    _textBlocks.add(block);
    notifyListeners();
  }

  void updateTextBlock(TextBlockModel block) {
    final index = _textBlocks.indexWhere((b) => b.id == block.id);
    if (index >= 0) {
      _textBlocks[index] = block;
      notifyListeners();
    }
  }

  void deleteTextBlock(TextBlockModel block) {
    _textBlocks.removeWhere((b) => b.id == block.id);
    notifyListeners();
  }

  void login(String userId) {
    _currentUserId = userId;
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _currentUserId = null;
    _isLoggedIn = false;
    _textBlocks.clear();
    notifyListeners();
  }
}