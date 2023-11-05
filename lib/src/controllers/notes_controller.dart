import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:target_flutter/src/models/note_model.dart';
import 'package:target_flutter/src/services/shared_preferences_local_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validatorless/validatorless.dart';

part 'notes_controller.g.dart';

// ignore: library_private_types_in_public_api
class NotesController = _NotesController with _$NotesController;

abstract class _NotesController with Store {
  final service = const SharedPreferencesLocalStorage();
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
  Future<void> addNote({required String description, int? id}) async {
    final note = Note(id ?? nextId, description);
    notes.add(note);

    await setSharedPrefs();
  }

  @action
  Future<void> removeNote(Note note) async {
    notes.removeWhere((element) => element.id == note.id);
    await setSharedPrefs();
  }

  @action
  Future<void> setNote(Note note) async {
    removeNote(note);
    addNote(id: note.id, description: note.description);
    notes.sort(((a, b) => a.id.compareTo(b.id)));
    await setSharedPrefs();
  }

  @action
  Future<void> loadSharedPrefs() async {
    const key = 'notes';
    var result = await service.getString(key);
    if (result != null) {
      List jsonList = jsonDecode(result) as List;

      notes =
          jsonList.map((item) => Note.fromMap(item)).toList().asObservable();
    }
  }

  @action
  Future<void> setSharedPrefs() async {
    const key = 'notes';
    await service.clean(key);
    await service.setString(key, value: notes.toString());
  }

  Future<void> openUrl() async {
    final Uri url = Uri.parse('https://www.google.com.br');
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
