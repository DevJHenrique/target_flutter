import 'package:flutter/material.dart';
import 'package:target_flutter/src/models/note_model.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.note,
    required this.onPressDelete,
    required this.onPressEdit,
  });

  final void Function()? onPressDelete;
  final void Function()? onPressEdit;
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
              '${note.id}-${note.description}',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            )),
            InkWell(
              onTap: onPressEdit,
              child: const Icon(
                Icons.edit,
                size: 32,
              ),
            ),
            InkWell(
              onTap: onPressDelete,
              child: const Icon(
                Icons.close,
                size: 32,
              ),
            )
          ],
        ),
        const Divider(),
      ],
    );
  }
}
