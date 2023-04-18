import 'package:flutter/material.dart';

class ResultadoWidget extends StatelessWidget implements PreferredSizeWidget {
  int venceu;
  void Function() onReiniciar;

  ResultadoWidget({
    super.key, 
    required this.venceu,
    required this.onReiniciar,
  });

  Color _getCor() {
    switch (venceu) {
      case 1:
        return Colors.green.shade300;
      case 0:
        return Colors.red.shade300;
      default:
        return Colors.yellow;
    }
  }

  IconData _getIcon() {
    switch (venceu) {
      case 1:
        return Icons.sentiment_very_satisfied;
      case 0:
        return Icons.sentiment_very_dissatisfied;
      default:
        return Icons.sentiment_satisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getCor(),
            child: IconButton(
              icon: Icon(
                _getIcon(),
                color: Colors.black,
              ),
              onPressed: onReiniciar,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
