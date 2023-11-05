import 'package:flutter/material.dart';
import 'package:target_flutter/src/controllers/notes_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target_flutter/src/pages/components/delete_note_dialog.dart';
import 'package:target_flutter/src/pages/components/edit_note_dialog.dart';

import 'components/list_card.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _controller = NotesController();
  final _focusNode = FocusNode();
  final _fieldController = TextEditingController();
  final _fieldKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1c4d5d),
              Color(0xFF31948b),
            ],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(40, 32, 40, 24),
          height: size.height,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  color: Colors.white,
                  child: Observer(builder: (_) {
                    return ListView.builder(
                      itemCount: _controller.notes.length,
                      itemBuilder: ((_, index) {
                        final note = _controller.notes[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: ListCard(
                            note: note,
                            onPressDelete: () {
                              showCustomDialog(
                                (context) => DeleteNoteDialog(
                                  onCancel: () => Navigator.pop(context),
                                  onConfirm: () {
                                    _controller.removeNote(note);
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                            onPressEdit: () {
                              showCustomDialog(
                                (context) => EditNoteDialog(
                                  note: note,
                                  onCancel: () => Navigator.pop(context),
                                  onConfirm: (value) {
                                    _controller.setNote(note);
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 40),
              Form(
                key: _fieldKey,
                child: TextFormField(
                  validator: _controller.textValidator(),
                  onTapOutside: (event) => _focusNode.requestFocus(),
                  autofocus: true,
                  focusNode: _focusNode,
                  controller: _fieldController,
                  onFieldSubmitted: (description) {
                    if (_fieldKey.currentState!.validate()) {
                      _controller.addNote(description: description);
                      _fieldController.clear();
                    }
                    _focusNode.requestFocus();
                  },
                  style: theme.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintStyle: theme.textTheme.titleMedium,
                    hintText: 'Digite seu texto',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {},
                    child: const Text(
                      'Política de Privacidade',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<T?> showCustomDialog<T>(Widget Function(BuildContext) builder) {
    return showAdaptiveDialog(
      context: context,
      builder: builder,
    );
  }
}
