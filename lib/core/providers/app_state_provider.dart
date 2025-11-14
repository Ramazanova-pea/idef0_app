import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/text_data/domain/text_block_model.dart';

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(AppState.initial());

  void login(String userId) {
    state = state.copyWith(
      currentUserId: userId,
      isLoggedIn: true,
    );
  }

  void logout() {
    state = AppState.initial();
  }

  void addTextBlock(TextBlockModel block) {
    state = state.copyWith(
      textBlocks: [...state.textBlocks, block],
    );
  }

  void updateTextBlock(TextBlockModel block) {
    final index = state.textBlocks.indexWhere((b) => b.id == block.id);
    if (index >= 0) {
      final newBlocks = List<TextBlockModel>.from(state.textBlocks);
      newBlocks[index] = block;
      state = state.copyWith(textBlocks: newBlocks);
    }
  }

  void deleteTextBlock(TextBlockModel block) {
    state = state.copyWith(
      textBlocks: state.textBlocks.where((b) => b.id != block.id).toList(),
    );
  }
}

// Модель состояния
class AppState {
  final List<TextBlockModel> textBlocks;
  final String? currentUserId;
  final bool isLoggedIn;

  const AppState({
    required this.textBlocks,
    this.currentUserId,
    required this.isLoggedIn,
  });

  factory AppState.initial() => const AppState(
    textBlocks: [],
    currentUserId: null,
    isLoggedIn: false,
  );

  AppState copyWith({
    List<TextBlockModel>? textBlocks,
    String? currentUserId,
    bool? isLoggedIn,
  }) {
    return AppState(
      textBlocks: textBlocks ?? this.textBlocks,
      currentUserId: currentUserId ?? this.currentUserId,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}

// Провайдеры
final appStateProvider = StateNotifierProvider<AppStateNotifier, AppState>(
      (ref) => AppStateNotifier(),
);



