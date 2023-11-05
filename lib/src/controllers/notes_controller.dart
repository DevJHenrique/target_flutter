import 'package:mobx/mobx.dart';
import 'package:target_flutter/src/models/note_model.dart';
import 'package:validatorless/validatorless.dart';

part 'notes_controller.g.dart';

// ignore: library_private_types_in_public_api
class NotesController = _NotesController with _$NotesController;

abstract class _NotesController with Store {
  @observable
  ObservableList<Note> notes = ObservableList<Note>();

  String? Function(String?)? textValidator() {
    var validate = Validatorless.required('O campo não pode ser vazio');
    return validate;
  }

  @computed
  int get notesLength => notes.length;

  @computed
  int get nextId => notes.isEmpty ? 1 : notes.last.id + 1;

  @action
  void addNote({required String description, int? id}) {
    final note = Note(id ?? nextId, description);
    notes.add(note);
  }

  @action
  void removeNote(Note note) {
    notes.removeWhere((element) => element.id == note.id);
  }

  @action
  void setNote(Note note) {
    removeNote(note);
    addNote(id: note.id, description: note.description);
    notes.sort(((a, b) => a.id.compareTo(b.id)));
  }
}
