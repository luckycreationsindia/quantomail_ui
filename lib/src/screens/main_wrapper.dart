import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quantomail/gen/assets.gen.dart';
import 'package:quantomail/l10n/l10n.dart';
import 'package:quantomail/src/widgets/custom_drawer.dart';

class MainWrapper extends StatefulWidget {
  final Widget child;
  final int selectedIndex;

  const MainWrapper({
    super.key,
    required this.child,
    required this.selectedIndex,
  });

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              const CustomDrawer(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        context.canPop()
                            ? IconButton(
                                onPressed: () => context.pop(),
                                icon: const Icon(Icons.arrow_back_ios_new),
                              )
                            : Assets.images.logo.image(height: 30, width: 30),
                        Expanded(
                          child: Center(
                            child: Text(
                              context.l10n.appTitle,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            return IconButton(
                              onPressed: () =>
                                  Scaffold.of(context).openEndDrawer(),
                              icon:
                                  const Icon(Icons.notifications_none_outlined),
                            );
                          },
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: widget.child,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      endDrawer: Builder(
        builder: (context) {
          return Drawer(
            child: Container(
              color: Theme.of(context).drawerTheme.backgroundColor,
              child: ListView(
                children: [
                  AppBar(
                    title: const Text("Notifications"),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Scaffold.of(context).closeEndDrawer();
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
