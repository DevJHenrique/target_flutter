import 'package:flutter/material.dart';

class DeleteNoteDialog extends StatelessWidget {
  const DeleteNoteDialog({super.key, this.onCancel, this.onConfirm});

  final void Function()? onCancel;
  final void Function()? onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Excluir"),
      content: const Text("Você tem certeza que deseja excluir essa nota?"),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: const Text("Cancelar"),
        ),
        TextButton(
          onPressed: onConfirm,
          child: const Text("Excluir"),
        ),
      ],
    );
  }
}
