import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:quantomail/l10n/l10n.dart';
import 'package:quantomail/utils/custom_theme.dart';
import 'package:quantomail/utils/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(Intl.defaultLocale!),
      onGenerateTitle: (context) => context.l10n.appTitle,
      routerConfig: routerList,
      theme: customTheme(context),
    );
  }
}