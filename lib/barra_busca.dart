import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'styles.dart';

class BarraBusca extends StatelessWidget {
  const BarraBusca({
    @required this.controller,
    @required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Styles.fundoPesquisa,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 8,
        ),
        child: Row(
          children: [
            const Icon(
              CupertinoIcons.search,
              color: Styles.iconePesquisaCor,
            ),
            Expanded(
              child: CupertinoTextField(
                controller: controller,
                focusNode: focusNode,
                style: Styles.textoPesquisa,
                cursorColor: Styles.cursorPesquisaCor,
              ),
            ),
            GestureDetector(
              onTap: controller.clear,
              child: const Icon(
                CupertinoIcons.clear_thick_circled,
                color: Styles.iconePesquisaCor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
