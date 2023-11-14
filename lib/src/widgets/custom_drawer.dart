import 'package:flutter/material.dart';
import 'package:quantomail/gen/assets.gen.dart';
import 'package:quantomail/l10n/l10n.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(context.l10n.appTitle),
            accountEmail: Text(
              context.l10n.appSubTitle,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              ),
            ),
            currentAccountPicture:
                Assets.images.logo.image(height: 70, width: 70),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("General"),
                DrawerButton(
                  icon: const Icon(Icons.inbox_outlined),
                  title: const Text("Inbox"),
                  onPressed: () {},
                  selected: true,
                  count: 10,
                ),
                DrawerButton(
                  icon: const Icon(Icons.send_outlined),
                  title: const Text("Sent"),
                  onPressed: () {},
                  selected: false,
                  count: 0,
                ),
                DrawerButton(
                  icon: const Icon(Icons.drafts_outlined),
                  title: const Text("Draft"),
                  onPressed: () {},
                  selected: false,
                  count: 0,
                ),
                DrawerButton(
                  icon: const Icon(Icons.delete_outline),
                  title: const Text("Trash"),
                  onPressed: () {},
                  selected: false,
                  count: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    super.key,
    required this.title,
    this.onPressed,
    required this.icon,
    this.count = 0,
    this.selected = false,
  });

  final Text title;
  final Icon icon;
  final int count;
  final bool selected;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(26),
        onTap: onPressed,
        child: Container(
          decoration: selected
              ? BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: const BorderRadius.all(Radius.circular(26)),
                  border: Border.all(
                    width: 1,
                    color: Colors.blueGrey,
                  ),
                )
              : null,
          padding: const EdgeInsets.all(13),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 10),
              Expanded(child: title),
              count > 0
                  ? Container(
                      padding: const EdgeInsets.all(5),
                      decoration: selected
                          ? BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                width: 1,
                                color: Colors.green,
                              ),
                            )
                          : null,
                      child: Text(
                        "$count",
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
