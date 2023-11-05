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

  late final _$addNoteAsyncAction =
      AsyncAction('_NotesController.addNote', context: context);

  @override
  Future<void> addNote({required String description, int? id}) {
    return _$addNoteAsyncAction
        .run(() => super.addNote(description: description, id: id));
  }

  late final _$removeNoteAsyncAction =
      AsyncAction('_NotesController.removeNote', context: context);

  @override
  Future<void> removeNote(Note note) {
    return _$removeNoteAsyncAction.run(() => super.removeNote(note));
  }

  late final _$setNoteAsyncAction =
      AsyncAction('_NotesController.setNote', context: context);

  @override
  Future<void> setNote(Note note) {
    return _$setNoteAsyncAction.run(() => super.setNote(note));
  }

  late final _$loadSharedPrefsAsyncAction =
      AsyncAction('_NotesController.loadSharedPrefs', context: context);

  @override
  Future<void> loadSharedPrefs() {
    return _$loadSharedPrefsAsyncAction.run(() => super.loadSharedPrefs());
  }

  late final _$setSharedPrefsAsyncAction =
      AsyncAction('_NotesController.setSharedPrefs', context: context);

  @override
  Future<void> setSharedPrefs() {
    return _$setSharedPrefsAsyncAction.run(() => super.setSharedPrefs());
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
