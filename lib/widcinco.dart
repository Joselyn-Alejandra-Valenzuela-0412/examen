import 'package:flutter/material.dart';

class WidCinco extends StatefulWidget {
  const WidCinco({Key? key}) : super(key: key);

  @override
  State<WidCinco> createState() => _WidCincoState();
}

class _WidCincoState extends State<WidCinco> {
  List<int> items = List<int>.generate(100, (int index) => index);
  final Color _appBarColor =
      const Color(0xffc82663); // Color rosa característico

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _appBarColor,
        title: const Text(
          'Widget 5 - Lista Deslizable',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.green,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.archive, color: Colors.white),
            ),
            key: ValueKey<int>(items[index]),
            direction: DismissDirection
                .horizontal, // Permite deslizar en ambas direcciones
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                // Acción al deslizar hacia la izquierda (archive)
                return await _showConfirmationDialog(
                    context, '¿Archivar item?');
              } else {
                // Acción al deslizar hacia la derecha (delete)
                return await _showConfirmationDialog(
                    context, '¿Eliminar item?');
              }
            },
            onDismissed: (DismissDirection direction) {
              setState(() {
                final removedItem = items[index];
                items.removeAt(index);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(direction == DismissDirection.endToStart
                        ? 'Item $removedItem archivado'
                        : 'Item $removedItem eliminado'),
                    action: SnackBarAction(
                      label: 'Deshacer',
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          items.insert(index, removedItem);
                        });
                      },
                    ),
                  ),
                );
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 3,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ListTile(
                title: Text(
                  'Item ${items[index]}',
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: const Icon(Icons.swipe),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<bool?> _showConfirmationDialog(
      BuildContext context, String message) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );
  }
}
