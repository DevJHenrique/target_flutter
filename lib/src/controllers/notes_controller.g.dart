// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotesController on _NotesController, Store {
  Computed<int>? _$notesLengthComputed;

  @override
  int get notesLength =>
      (_$notesLengthComputed ??= Computed<int>(() => super.notesLength,
              name: '_NotesController.notesLength'))
          .value;
  Computed<int>? _$nextIdComputed;

  @override
  int get nextId => (_$nextIdComputed ??=
          Computed<int>(() => super.nextId, name: '_NotesController.nextId'))
      .value;

  late final _$notesAtom =
      Atom(name: '_NotesController.notes', context: context);

  @override
  ObservableList<Note> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<Note> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$_NotesControllerActionController =
      ActionController(name: '_NotesController', context: context);

  @override
  void addNote({required String description, int? id}) {
    final _$actionInfo = _$_NotesControllerActionController.startAction(
        name: '_NotesController.addNote');
    try {
      return super.addNote(description: description, id: id);
    } finally {
      _$_NotesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeNote(Note note) {
    final _$actionInfo = _$_NotesControllerActionController.startAction(
        name: '_NotesController.removeNote');
    try {
      return super.removeNote(note);
    } finally {
      _$_NotesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNote(Note note) {
    final _$actionInfo = _$_NotesControllerActionController.startAction(
        name: '_NotesController.setNote');
    try {
      return super.setNote(note);
    } finally {
      _$_NotesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notes: ${notes},
notesLength: ${notesLength},
nextId: ${nextId}
    ''';
  }
}
