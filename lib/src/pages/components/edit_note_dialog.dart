import 'package:flutter/material.dart';
import 'package:target_flutter/src/models/note_model.dart';

class EditNoteDialog extends StatelessWidget {
  const EditNoteDialog(
      {super.key,
      required this.onCancel,
      required this.onConfirm,
      required this.note});

  final void Function() onCancel;
  final void Function(String) onConfirm;
  final Note note;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Editar"),
      content: TextFormField(
        initialValue: note.description,
        onChanged: (text) => note.description = text,
      ),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: const Text("Cancelar"),
        ),
        TextButton(
          onPressed: () => onConfirm(note.description),
          child: const Text("Confirmar"),
        ),
      ],
    );
  }
}
