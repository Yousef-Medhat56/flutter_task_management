import 'package:riverpod_annotation/riverpod_annotation.dart';

part "expansion_provider.g.dart";

@riverpod
class ExpansionState extends _$ExpansionState {
  bool build() {
    return false;
  }

  void setState(bool newState) {
    state = newState;
  }
}

@riverpod
class ExpansionState0 extends _$ExpansionState0 {
  bool build() {
    return false;
  }

  void setState(bool newState) {
    state = newState;
  }
}
